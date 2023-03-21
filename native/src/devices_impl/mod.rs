
pub mod yeelight;

pub mod impl_switch {
    use std::{ sync::Arc, collections::HashMap };

    use strum::IntoEnumIterator;

    use crate::{ 
        base::{ 
            data::{ 
                device_metadata::{ 
                    DeviceImpl, ConnectionConfig, DeviceId, DeviceData, Device
                }, 
                device_result::{ DeviceConnectionResult, DeviceConnectionError }
            }, 
        }, 
        device::impl_interface::{ DeviceImplRaw, DeviceImplBuilder }, 
        model_state::StorageOperator
    };
    use super::yeelight::YeelightImpl;

    pub async fn detected_device_from<'a>(config: ConnectionConfig) -> Result<
        (Box<dyn DeviceImplRaw>, DeviceId), HashMap<DeviceImpl, DeviceConnectionError>
    > {
        let mut err = HashMap::new();
        for imp in DeviceImpl::iter() {
            if let Some(connection_result) = match imp {
                DeviceImpl::None => None,
                DeviceImpl::Yeelight => Some(YeelightImpl::connect(config).await),
            } {
                match connection_result {
                    DeviceConnectionResult::Pending => unreachable!(),
                    DeviceConnectionResult::Ok(v, id, _) => return Ok((v, id)),
                    DeviceConnectionResult::Err(v) => { err.insert(imp, v); },
                }
            }
        };
        Err(err)
    }

    pub async fn device_from_data<'op>(dev: Arc<DeviceData>, operator: &mut StorageOperator<'op>) -> Device {
        let state = operator.get_state_by_device_id(dev.id.clone());
        let controller = get_impl_controller(dev.device_impl, state.config).await.unwrap();
        Device::from_impl(dev, controller, state)
    }

    pub async fn get_impl_controller(
        implementation: DeviceImpl, config: ConnectionConfig
    ) -> Result<Box<dyn DeviceImplRaw>, DeviceConnectionError> {
        let res = match implementation {
            DeviceImpl::None => panic!("No Implementation set"),
            DeviceImpl::Yeelight => YeelightImpl::connect(config).await,
        };
        match res {
            DeviceConnectionResult::Ok(controller, _, _) => Ok(controller),
            DeviceConnectionResult::Err(err) => Err(err),
            _ => unreachable!()
        }
    }
}