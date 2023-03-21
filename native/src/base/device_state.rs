use std::sync::Arc;

use futures::executor::block_on;

use crate::{base::data::device_state::DeviceState, model_state::StorageOperator, devices_impl::impl_switch};

use super::data::device_metadata::Device;


impl DeviceState {
    fn from_id(dt: (&mut StorageOperator, String)) -> Arc<Self> {
        dt.0.get_state_by_device_id(dt.1)
    }
}
