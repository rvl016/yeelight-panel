// This is the entry point of your Rust library.
// When adding new code to your project, note that only items used
// here will be transformed to their Dart equivalents.

use std::{sync::Arc, collections::HashMap, fmt::Display};

use flutter_rust_bridge::frb;

use futures::executor::block_on;
use thiserror::Error as ThisError;
use crate::{base::{data::{device_metadata::{Device, DeviceType, DeviceCommandCapability, DeviceData, DeviceImpl, ConnectionConfig, DeviceVariant, DeviceId}, device_state::{HSV, RGB, CT, DeviceState, RunningState, ColorState, Color, ColorMode, AnimationState, DirectModeState}, common::IPv4Connection, device_result::DeviceConnectionError, profile::{Profile, ProfileData, ProfileSingle, ProfileMultiple}}, device_controller::{DeviceActionFilter, DeviceController}}, APP, App, get_app, model_state::{Field, StorageField, AppendInField, AddedValue}, devices_impl::impl_switch};

// A plain enum without any fields. This is similar to Dart- or C-style enums.
// flutter_rust_bridge is capable of generating code for enums with fields
// (@freezed classes in Dart and tagged unions in C).
pub enum Platform {
    Unknown,
    Android,
    Ios,
    Windows,
    Unix,
    MacIntel,
    MacApple,
    Wasm,
}

// A function definition in Rust. Similar to Dart, the return type must always be named
// and is never inferred.
pub fn platform() -> Platform {
    // This is a macro, a special expression that expands into code. In Rust, all macros
    // end with an exclamation mark and can be invoked with all kinds of brackets (parentheses,
    // brackets and curly braces). However, certain conventions exist, for example the
    // vector macro is almost always invoked as vec![..].
    //
    // The cfg!() macro returns a boolean value based on the current compiler configuration.
    // When attached to expressions (#[cfg(..)] form), they show or hide the expression at compile time.
    // Here, however, they evaluate to runtime values, which may or may not be optimized out
    // by the compiler. A variety of configurations are demonstrated here which cover most of
    // the modern oeprating systems. Try running the Flutter application on different machines
    // and see if it matches your expected OS.
    //
    // Furthermore, in Rust, the last expression in a function is the return value and does
    // not have the trailing semicolon. This entire if-else chain forms a single expression.
    if cfg!(windows) {
        Platform::Windows
    } else if cfg!(target_os = "android") {
        Platform::Android
    } else if cfg!(target_os = "ios") {
        Platform::Ios
    } else if cfg!(all(target_os = "macos", target_arch = "aarch64")) {
        Platform::MacApple
    } else if cfg!(target_os = "macos") {
        Platform::MacIntel
    } else if cfg!(target_family = "wasm") {
        Platform::Wasm
    } else if cfg!(unix) {
        Platform::Unix
    } else {
        Platform::Unknown
    }
}

// The convention for Rust identifiers is the snake_case,
// and they are automatically converted to camelCase on the Dart side.
pub fn rust_release_mode() -> bool {
    cfg!(not(debug_assertions))
}

pub fn init_app() {
    get_app().load_data()
}

pub fn get_stored_devices() -> Vec<DeviceDataInterface> {
    match get_app().storage().get(Field::Devices) {
        StorageField::Devices(devs) => devs.values().into_iter().map(|v| v.clone().into()).collect(),
        _ => unreachable!(),
    }   
}

pub fn detect_new_device(device_name: String, connection: ConnectionConfigInterface) -> DeviceDetectResult {
    let x = tokio::runtime::Builder::new_multi_thread()
        .enable_all()
        .build()
        .unwrap()
        .block_on(async {
            impl_switch::detected_device_from(connection.into()).await
        });
    match x {
        Ok((dev, id)) => {
            let data = Device::new_stateless(
                match get_app().storage().add(AppendInField::Device(DeviceData::new(device_name, id))) {
                    AddedValue::Device(dt) => dt,
                    _ => unreachable!(),
                },
                Arc::new(
                    DeviceActionFilter {
                        next: Arc::new(DeviceController {
                            implementation: dev.for_using()
                        })
                    }
                )
            );
            DeviceDetectResult::Ok(DeviceDataInterface::from(data.metadata))
        },
        Err(err) => DeviceDetectResult::Error(
            err.into_iter().map(|(v1, v2)| DeviceDetectErrorItem(Box::new(v1), format!("{}", v2))).collect()
        ),
    }
}

pub fn get_devices_for_using() -> Vec<DeviceInterface> {
    vec![DeviceInterface {
        ..Default::default()
    }]
}

pub fn get_device_state(device_id: String) -> Option<DeviceStateInterface> {
    match get_app().storage().get(Field::DevicesState) {
        StorageField::DevicesState(states) => states.values().iter()
            .find_map(|&v| if v.id != device_id { None } else { Some(DeviceStateInterface::from(v.clone())) }),
        _ => unreachable!(),
    }
}

#[derive(Debug)]
pub enum DeviceDetectResult {
    Ok(DeviceDataInterface),
    Error(Vec<DeviceDetectErrorItem>)
}

#[derive(Debug)]
pub struct DeviceDetectErrorItem(pub Box<DeviceImpl>, pub String);

#[derive(Default, Debug, Clone)]
pub struct DeviceInterface {
    pub id: String,
    pub metadata: Box<DeviceDataInterface>,
}

impl From<Device> for DeviceInterface {
    fn from(dt: Device) -> Self {
        Self {
            id: dt.metadata.id.clone(),
            metadata: Box::new(DeviceDataInterface::from(dt.metadata))
        }
    }
}

pub struct DeviceIdInterface {
    device_type: Box<DeviceType>,
    device_impl: Box<DeviceImpl>,
    device_variation: Box<DeviceVariant>
}

impl From<DeviceId> for DeviceIdInterface {
    fn from(id: DeviceId) -> Self {
        Self {
            device_impl: Box::new(id.device_impl),
            device_type: Box::new(id.device_type),
            device_variation: Box::new(id.device_variant)
        }
    }
}

#[derive(Default, Debug, Clone)]
pub struct DeviceDataInterface {
    pub id: String,
    pub name: String,
    pub device_type: Box<DeviceType>,
    pub device_impl: Box<DeviceImpl>,
    pub capabilities: Vec<Wrapper>,
}

macro_rules! to_device_data_interface {
    ($d:ident) => {
        Self {
            id: $d.id.clone(), 
            name: $d.name.clone(), 
            device_type: Box::new($d.device_type), 
            device_impl: Box::new($d.device_impl), 
            capabilities: $d.capabilities.iter().map(|v| Wrapper { data: v.clone() }).collect()
        }
    };
}

#[derive(Debug, Clone)]
pub struct Wrapper {
    pub data: DeviceCommandCapability
}

impl From<DeviceData> for DeviceDataInterface {
    fn from(d: DeviceData) -> Self {
        to_device_data_interface!(d)
    }
}

impl From<Arc<DeviceData>> for DeviceDataInterface {
    fn from(d: Arc<DeviceData>) -> Self {
        to_device_data_interface!(d)
    }
}

#[derive(Default, Debug, Clone)]
pub struct DeviceStateInterface {
    pub config: Box<ConnectionConfigInterface>,
    pub running_state: Box<RunningStateInterface>
}

impl From<DeviceState> for DeviceStateInterface {
    fn from(d: DeviceState) -> Self {
        Self {
            config: Box::new(d.config.into()),
            running_state: Box::new(d.running_state().into()),
        }
    }
}

impl From<Arc<DeviceState>> for DeviceStateInterface {
    fn from(d: Arc<DeviceState>) -> Self {
        Self {
            config: Box::new(d.config.into()),
            running_state: Box::new(d.running_state().into())
        }
    }
}

#[derive(Debug, Default)]
pub struct DeviceGroup {
    pub id: &'static str,
    pub devices: Vec<DeviceInterface>,
    pub state: Box<DeviceStateInterface>,
}

#[derive(Default, Debug, Clone)]
pub enum RunningStateInterface {
    #[default] None,
    Color(Box<ColorStateInteface>),
    Animation(Box<AnimationStateInteface>),
    DirectMode(Box<DirectModeStateInterface>)
}

impl<'a> From<RunningState<'a>> for RunningStateInterface {
    fn from(state: RunningState) -> Self {
        match state {
            RunningState::None => RunningStateInterface::None,
            RunningState::Color(v) => RunningStateInterface::Color(Box::new(v.clone().into())),
            RunningState::Animation(v) => RunningStateInterface::Animation(Box::new(v.clone().into())),
            RunningState::DirectMode(v) => RunningStateInterface::DirectMode(Box::new(v.clone().into())),
        }
    }
}

#[derive(Default, Debug, Clone)]
pub struct ConnectionConfigInterface {
    pub ip_v4: Box<IPv4ConnectionInteface>
}

impl Into<ConnectionConfig> for ConnectionConfigInterface {
    fn into(self) -> ConnectionConfig {
        ConnectionConfig { ip_v4: (*self.ip_v4).into() }
    }
}

impl From<ConnectionConfig> for ConnectionConfigInterface {
    fn from(connection: ConnectionConfig) -> Self {
        Self {
            ip_v4: Box::new(connection.ip_v4.into())
        }
    }
}

#[derive(Default, Debug, Clone)]
pub struct IPv4ConnectionInteface {
    pub ip: [u8; 4],
    pub port: u16
}

impl Into<IPv4Connection> for IPv4ConnectionInteface {
    fn into(self) -> IPv4Connection {
        IPv4Connection { 
            ip: (self.ip[0], self.ip[1], self.ip[2], self.ip[3]), 
            port: self.port,
        }
    }
}

impl From<IPv4Connection> for IPv4ConnectionInteface {
    fn from(ipv4: IPv4Connection) -> Self {
        Self {
            ip: [ipv4.ip.0, ipv4.ip.1, ipv4.ip.2, ipv4.ip.3],
            port: ipv4.port,
        }
    }
}

#[derive(Default, Debug, Clone)]
pub struct ColorStateInteface {
    pub brightness: u8,
    pub color: Box<ColorInterface>,
}

impl From<ColorState> for ColorStateInteface {
    fn from(state: ColorState) -> Self {
        Self {
            brightness: state.brightness,
            color: Box::new(match state.color() {
                Color::None => ColorInterface::None,
                Color::HSV(v) => ColorInterface::HSV(Box::new((*v).into())),
                Color::RGB(v) => ColorInterface::RGB(Box::new((*v).into())),
                Color::CT(v) => ColorInterface::CT(Box::new((*v).into())),
            }),
        }
    }
}

#[derive(Default, Debug, Clone)]
pub enum ColorInterface {
    #[default] None,
    HSV(Box<HSVInterface>),
    RGB(Box<RGBInterface>),
    CT(Box<CTInterface>)
}

impl<'a> From<Color<'a>> for ColorInterface {
    fn from(col: Color) -> Self {
        match col {
            Color::None => ColorInterface::None,
            Color::HSV(d) => ColorInterface::HSV(Box::new((*d).into())),
            Color::RGB(d) => ColorInterface::RGB(Box::new((*d).into())),
            Color::CT(d) => ColorInterface::CT(Box::new((*d).into())),
        }
    }
}

#[derive(Default, Debug, Clone, Copy)]
pub struct RGBInterface {
    pub rgb: [u8; 3],
}

impl From<RGB> for RGBInterface {
    fn from(rgb: RGB) -> Self {
        Self {
            rgb: [rgb.rgb.0, rgb.rgb.1, rgb.rgb.2]
        }
    }
}

#[derive(Default, Debug, Clone, Copy)]
pub struct HSVInterface {
    pub hue: u16,
    pub saturation: u16,
}

impl From<HSV> for HSVInterface {
    fn from(hsv: HSV) -> Self {
        Self {
            hue: hsv.hue,
            saturation: hsv.saturation,
        }
    }
}

#[derive(Default, Debug, Clone, Copy)]
pub struct CTInterface {
    pub temperature: u16,
}

impl From<CT> for CTInterface {
    fn from(ct: CT) -> Self {
        Self {
            temperature: ct.temperature
        }
    }
}

#[derive(Default, Debug, Clone)]
pub struct AnimationStateInteface {

}

impl From<AnimationState> for AnimationStateInteface {
    fn from(state: AnimationState) -> Self {
        Self {

        }
    }
}

#[derive(Default, Debug, Clone)]
pub struct DirectModeStateInterface {
    pub connection_addr: Box<ConnectionConfigInterface>,
}

impl From<DirectModeState> for DirectModeStateInterface {
    fn from(state: DirectModeState) -> Self {
        Self {
            connection_addr: Box::new(state.connection_addr.into())
        }
    }
}

#[derive(Default, Debug, Clone)]
pub struct ProfileInterface {
    pub id: String,
    pub name: String,
    pub data: ProfileDataInterface,
}

impl<'dev, 'dev_state> From<Profile<'dev, 'dev_state>> for ProfileInterface {
    fn from(dt: Profile) -> Self {
        Self {
            id: dt.id.into(),
            name: dt.name.into(),
            data: dt.data.clone().into()
        }
    }
}

#[derive(Default, Debug, Clone)]
pub enum ProfileDataInterface {
    #[default] None,
    Single(ProfileSingleInterface),
    Multiple(ProfileMultipleInterface)
}

impl<'dev, 'dev_state> From<ProfileData<'dev, 'dev_state>> for ProfileDataInterface {
    fn from(dt: ProfileData) -> Self {
        match dt {
            ProfileData::None => ProfileDataInterface::None,
            ProfileData::Single(dt) => ProfileDataInterface::Single(dt.clone().into()),
            ProfileData::Multiple(dt) => ProfileDataInterface::Multiple(dt.clone().into()),
        }
    }
}

#[derive(Debug, Clone)]
pub struct ProfileSingleInterface {
    pub device: Box<DeviceInterface>,
    pub state: Box<DeviceStateInterface>,
}

impl<'dev, 'dev_state> From<ProfileSingle<'dev, 'dev_state>> for ProfileSingleInterface {
    fn from(dt: ProfileSingle) -> Self {
        Self {
           device: Box::new(dt.device.clone().into()),
           state: Box::new(dt.state.clone().into())
        }
    }
}

#[derive(Debug, Clone)]
pub struct ProfileMultipleInterface {
    pub devices: Vec<Arc<DeviceInterface>>,
    pub state: Box<DeviceStateInterface>,
}

impl<'dev, 'dev_state> From<ProfileMultiple<'dev, 'dev_state>> for ProfileMultipleInterface {
    fn from(dt: ProfileMultiple) -> Self {
        Self {
           devices: dt.devices.iter().map(|&v| Arc::new(v.clone().into())).collect(),
           state: Box::new(dt.state.clone().into()),
        }
    }
}
