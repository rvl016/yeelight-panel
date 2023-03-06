
pub mod yeelight;

pub mod impl_switch {
    use std::{sync::{RwLock, Arc}, collections::HashMap, borrow::BorrowMut};

    use strum::IntoEnumIterator;

    use crate::{base::data::{device_metadata::{DeviceImpl, ConnectionConfig, DeviceId}, device_result::{DeviceConnectionResult, DeviceConnectionError}, common::ActionResult}, device::impl_interface::{DeviceImplBuilder, DeviceImplInterface, self, DeviceImplRaw}};

    use super::yeelight::{Yeelight, YeelightImpl};

    pub async fn detected_device_from<'a>(config: ConnectionConfig) -> Result<
        (Box<dyn DeviceImplRaw>, DeviceId), HashMap<DeviceImpl, DeviceConnectionError>
    > {
        let mut err = HashMap::new();
        for imp in DeviceImpl::iter() {
            if let Some(x) = match imp {
                DeviceImpl::None => None,
                DeviceImpl::Yeelight => Some(YeelightImpl::connect(config).await),
            } {
                match x {
                    DeviceConnectionResult::Pending => unreachable!(),
                    DeviceConnectionResult::Ok(v, id, __) => return Ok((v, id)),
                    DeviceConnectionResult::Err(v) => { err.insert(imp, v); },
                }
            }
        };
        Err(err)
    }
}