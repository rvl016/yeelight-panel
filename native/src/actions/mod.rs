use std::sync::Arc;
use crate::{
    base::{
        data::{
            device_state::{ DeviceState, HSV, CT, RGB, ColorMode }, 
            device_metadata::{ Device, DeviceData, ConnectionConfig, DeviceStateProvider }, 
            device_result::{ DeviceActionResultMeta, DeviceDetectResult, DeviceDetectErrorItem, DeviceActionResultWrapped },
        }
    }, 
    model_state::{StorageOperator, AppendInField, Storage}, 
    devices_impl::impl_switch
};

pub struct ActionBinder<'binder> {
    pub storage: &'binder mut Storage,
}


impl<'binder> ActionBinder<'binder> {

    pub fn new(storage: &'binder mut Storage) -> Self {
        Self {
            storage
        }
    }

    pub async fn on_brightness_update(
        self, device: Device, brightness: f32
    ) -> Result<Arc<DeviceState>, Arc<DeviceActionResultMeta>> {
        self.process_impl_state_result(device.dev_controller.set_brightness(
            DeviceStateProvider::new(Some(device.state), device.metadata), brightness
        ).await)
    }

    pub async fn on_color_hsv_update(
        self, device: Device, color_state: HSV
    ) -> Result<Arc<DeviceState>, Arc<DeviceActionResultMeta>> {
        self.process_impl_state_result(device.dev_controller.set_hsv_color(
            DeviceStateProvider::new(Some(device.state), device.metadata), color_state
        ).await)
    }

    pub async fn on_color_rgb_update(
        self, device: Device, color_state: RGB
    ) -> Result<Arc<DeviceState>, Arc<DeviceActionResultMeta>> {
        self.process_impl_state_result(device.dev_controller.set_rgb_color(
            DeviceStateProvider::new(Some(device.state), device.metadata), color_state
        ).await)
    }

    pub async fn on_color_ct_update(
        self, device: Device, color_state: CT
    ) -> Result<Arc<DeviceState>, Arc<DeviceActionResultMeta>> {
        self.process_impl_state_result(device.dev_controller.set_ct_color(
            DeviceStateProvider::new(Some(device.state), device.metadata), color_state
        ).await)
    }

    pub async fn on_color_mode_update(
        self, device: Device, color_mode: ColorMode
    ) -> Result<Arc<DeviceState>, Arc<DeviceActionResultMeta>> {
        self.process_impl_state_result(device.dev_controller.set_color_mode(
            DeviceStateProvider::new(Some(device.state), device.metadata), color_mode
        ).await)
    }

    pub async fn sync_device_state(&self, device: Device) -> Result<Arc<DeviceState>, Arc<DeviceActionResultMeta>> {
        let x = device.dev_controller.get_current_state(
            DeviceStateProvider::new(Some(device.state), device.metadata)
        ).await; 
        match x.as_ref() {
            Ok(res) => if res.status.had_success {
                Ok(res.data.clone().unwrap())
            } else {
                Err(Arc::new(res.status.clone()))
            },
            Err(e) => panic!("Error when fetching Device State"),
        }

    } 

    fn process_impl_state_result(
        self, res: DeviceActionResultWrapped
    ) -> Result<Arc<DeviceState>, Arc<DeviceActionResultMeta>> {
        match res.as_ref() {
            Ok(v) => if v.status.had_success {
                let state = v.current_state.clone().unwrap_or_else(|| panic!("Expected Device with state"));
                self.storage.add(AppendInField::DeviceState(state.as_ref().clone()));
                Ok(state)
            } else {
                Err(Arc::new(v.status.clone()))
            },
            Err(e) => panic!("Error when changing Device State"),
        }
    }

    pub async fn connect_device(&mut self, device_name: String, connection: ConnectionConfig) -> DeviceDetectResult {
        match impl_switch::detected_device_from(connection).await {
            Ok((_, device_id)) => {
                let mut operator = StorageOperator::new(self.storage);
                let metadata = operator.add_device(DeviceData::new(device_name, device_id));
                operator.add_device_state(
                    DeviceState::for_new_device_data(metadata.id.clone(), connection)
                );
                DeviceDetectResult::Ok(metadata)
            },
            Err(err) => DeviceDetectResult::Error(
                err.into_iter().map(|(v1, v2)| DeviceDetectErrorItem(v1, format!("{}", v2))).collect()
            ),
        }
    }

}