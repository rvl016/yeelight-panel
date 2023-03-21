use std::{ sync::Arc, ops::Deref };

use crate::device::impl_interface::DeviceImplRaw;

use super::{
    data::{
        device_metadata::{
            Device, DeviceData, DeviceStateProvider, DeviceImpl
        }, 
        common::{
            ActionResult, GenericError
        }, device_state::DeviceState
    }, 
    device_controller::{ DeviceAction, DeviceActionFilter, DeviceController }
};

impl Device {
    
    pub async fn new(metadata: Arc<DeviceData>, dev_controller: Arc<dyn DeviceAction>) -> ActionResult<Self> {
        let state = dev_controller.clone().get_current_state(
            DeviceStateProvider::new(None, metadata.clone())
        ).await;
        match state.as_ref() {
            Ok(d) => Ok(Self {
                metadata,
                dev_controller,
                state: d.data.clone().unwrap()
            }),
            Err(e) => Err(e.clone()),
        }
    }

    pub fn new_stateless(metadata: Arc<DeviceData>, dev_controller: Arc<dyn DeviceAction>) -> Self {
        Self {
            metadata,
            dev_controller,
            state: Default::default(),
        }
    }

    pub fn from_impl(
        metadata: Arc<DeviceData>, implementation: Box<dyn DeviceImplRaw>, state: Arc<DeviceState>
    ) -> Self {
        Self {
            metadata,
            dev_controller: DeviceImpl::controller_from_implementation(implementation),
            state,
        }
    }

    
}
