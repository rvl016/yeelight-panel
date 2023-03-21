use std::fmt::Display;
use std::sync::Arc;
use serde::{Serialize, Deserialize};
use strum::EnumIter;

use super::common::{IPv4Connection, Record};
use super::device_state::DeviceState;
use crate::base::common::make_id;
use crate::base::device_controller::DeviceAction;

#[derive(Debug, Clone)]
pub struct Device {
    pub metadata: Arc<DeviceData>,
    pub dev_controller: Arc<dyn DeviceAction>,
    pub state: Arc<DeviceState>,
}

#[derive(Default, Debug, Clone, Serialize, Deserialize)]
pub struct DeviceData {
    pub id: String,
    pub name: String,
    pub device_type: DeviceType,
    pub device_impl: DeviceImpl,
    pub device_variant: DeviceVariant,
    pub capabilities: Vec<DeviceCommandCapability>,
    pub mac_address: (u8, u8, u8, u8, u8, u8),
}

impl DeviceData {
    pub fn new(name: String, device_id: DeviceId) -> Self {
        Self {
            id: make_id(),
            name,
            device_type: device_id.device_type,
            device_impl: device_id.device_impl,
            device_variant: device_id.device_variant,
            capabilities: device_id.into(),
            mac_address: device_id.mac_address
        }
    }
}

impl Record for DeviceData {
    fn id(&self) -> String {
        self.id.clone()
    }
}

#[derive(Debug, PartialEq, Eq, Clone, Copy, Serialize, Deserialize)]
pub enum DeviceCommandCapability {
    SwitchPower,
    SetBrightness,
    SetRGB,
    SetHSV,
    SetCT,
    SetAnimation,
    SetDirectMode,
}

#[derive(Default, Debug, Clone, Copy, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub enum DeviceType {
    #[default] Bulb,
}

#[derive(Default, Debug, Clone, Copy, Serialize, Deserialize)]
pub struct ConnectionConfig {
    pub ip_v4: IPv4Connection
}

#[derive(Default, Debug, Clone, Copy, Serialize, Deserialize, EnumIter, PartialEq, Eq, Hash)]
pub enum DeviceImpl {
    #[default] None,
    Yeelight,
}

impl Display for DeviceImpl {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{}", match self {
            DeviceImpl::None => "None",
            DeviceImpl::Yeelight => "Yeelight",
        })
    }
}

#[derive(Default, Debug, Clone, Copy, Serialize, Deserialize, EnumIter, PartialEq, Eq, Hash)]
pub enum DeviceVariant {
    #[default] Rgb,
}

impl From<DeviceImpl> for &str {
    fn from(imp: DeviceImpl) -> Self {
        match imp {
            DeviceImpl::None => "None",
            DeviceImpl::Yeelight => "Yeelight",
        }
    }
}

#[derive(Default, Debug, Clone, Copy, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct DeviceId {
    pub device_type: DeviceType,
    pub device_impl: DeviceImpl,
    pub device_variant: DeviceVariant,
    pub mac_address: (u8, u8, u8, u8, u8, u8),
}

impl From<DeviceId> for Vec<DeviceCommandCapability> {
    fn from(_: DeviceId) -> Self {
        vec![]
    }
}


#[derive(Default, Debug, Clone)]
pub struct DeviceStateProvider {
    state: Option<Arc<DeviceState>>,
    metadata: Arc<DeviceData>
}

impl DeviceStateProvider {
    pub fn new(state: Option<Arc<DeviceState>>, metadata: Arc<DeviceData>) -> Self {
        Self {
            state, 
            metadata
        }
    }

    pub fn state(&self) -> Option<Arc<DeviceState>> {
        self.state.clone()
    }

    pub fn state_or_default(&self) -> Arc<DeviceState> {
        self.state.clone().unwrap_or_default()
    }

    pub fn metadata(&self) -> Arc<DeviceData> {
        self.metadata.clone()
    }
}