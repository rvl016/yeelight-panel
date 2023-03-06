use super::{device_state::DeviceState, device_metadata::Device};

#[derive(Debug, Default)]
struct DeviceGroup {
    pub id: &'static str,
    pub devices: Vec<Device>,
    pub state: DeviceState,
}