use super::{device_state::DeviceState, device_metadata::Device};

#[derive(Default, Debug, Clone)]
pub struct Profile<'device, 'device_state> {
    pub id: &'device str,
    pub name: &'device str,
    pub data: ProfileData<'device, 'device_state>,
}

#[derive(Default, Debug, Clone)]
pub enum ProfileData<'device, 'device_state> {
    #[default] None,
    Single(ProfileSingle<'device, 'device_state>),
    Multiple(ProfileMultiple<'device, 'device_state>)
}

#[derive(Debug, Clone, Copy)]
pub struct ProfileSingle<'device, 'device_state> {
    pub device: &'device Device,
    pub state: &'device_state DeviceState,
}

#[derive(Debug, Clone)]
pub struct ProfileMultiple<'device, 'device_state> {
    pub devices: Vec<&'device Device>,
    pub state: &'device_state DeviceState,
}