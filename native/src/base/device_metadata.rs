use super::data::device_metadata::{ DeviceCommandCapability, DeviceData };

impl DeviceData {
    pub fn has_capability(&self, c: &DeviceCommandCapability) -> bool {
        self.capabilities.contains(c)
    }
}