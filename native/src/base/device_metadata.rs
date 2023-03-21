use std::sync::Arc;

use crate::{devices_impl::yeelight::YeelightImpl, device::impl_interface::{DeviceImplBuilder, DeviceImplRaw}};

use super::{data::{device_metadata::{DeviceData, DeviceCommandCapability, DeviceImpl, ConnectionConfig}, device_result::DeviceConnectionResult}, device_controller::{DeviceAction, DeviceActionFilter, DeviceController}};


impl DeviceData {
    pub fn has_capability(&self, c: &DeviceCommandCapability) -> bool {
        self.capabilities.contains(c)
    }
}

impl DeviceImpl {
    pub async fn controller_from_config(&self, config: ConnectionConfig) -> Arc<dyn DeviceAction> {
        let implementation = match match self {
            DeviceImpl::None => panic!("No Implementation set on this device"),
            DeviceImpl::Yeelight => YeelightImpl::connect(config).await
        } {
            DeviceConnectionResult::Ok(i, _, _) => i,
            _ => panic!("Connection Failed"),
        };
        Self::controller_from_implementation(implementation)
    }

    pub fn controller_from_implementation(implementation: Box<dyn DeviceImplRaw>) -> Arc<dyn DeviceAction> {
        Arc::new(DeviceActionFilter {
            next: Arc::new(DeviceController {
                implementation: implementation.for_using()
            })
        })
    }
}