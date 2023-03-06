use std::{ sync::Arc, ops::Deref };

use super::{
    data::{
        device_metadata::{
            Device, DeviceData, DeviceStateProvider
        }, 
        common::{
            ActionResult, GenericError
        }
    }, 
    device_controller::{ DeviceAction }
};

impl Device {
    
    pub fn new(metadata: Arc<DeviceData>, controller: Arc<dyn DeviceAction>) -> ActionResult<Self> {
        let state = controller.clone().get_current_state(DeviceStateProvider::new(None, metadata.clone()));
        match state.deref() {
            Ok(d) => ActionResult::Ok(Self {
                metadata,
                dev_controller: controller,
                state: d.data.clone().unwrap()
            }),
            Err(err) => ActionResult::Err(
                Box::new(GenericError::from(err))
            ),
        }
    }

    pub fn new_stateless(metadata: Arc<DeviceData>, controller: Arc<dyn DeviceAction>) -> Self {
        Self {
            metadata,
            dev_controller: controller,
            state: Default::default(),
        }
    }
}
