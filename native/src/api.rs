// This is the entry point of your Rust library.
// When adding new code to your project, note that only items used
// here will be transformed to their Dart equivalents.

use std::{sync::Arc, vec, io::ErrorKind, fmt::Display};

use futures::{Future, future::try_join_all};
use tokio::{sync::{oneshot::error::RecvError, MutexGuard}, io::AsyncWriteExt, try_join};

use crate::{
    base::{
        data::{
            device_metadata::{
                Device, DeviceType, DeviceCommandCapability, DeviceData, DeviceImpl, ConnectionConfig, DeviceVariant, DeviceId, DeviceStateProvider
            }, 
            device_state::{
                HSV, RGB, CT, DeviceState, RunningState, ColorState, Color, AnimationState, DirectModeState, ColorMode, ColorTransfer
            }, 
            common::IPv4Connection, 
            profile::{
                Profile, ProfileData, ProfileSingle, ProfileMultiple
            }, device_result::{DeviceActionResultMeta, DeviceResultCode, DeviceError, DeviceIOError, DeviceDetectErrorItem, DeviceDetectResult}
        }, 
    }, 
    get_app, 
    model_state::{
        Field, StorageField, AppendInField, FieldRecord, FieldId, StorageOperator, Storage
    }, devices_impl::impl_switch, actions::ActionBinder, App
};

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

#[tokio::main]
pub async fn init_app() {
    get_app().await.load_data()
}

#[tokio::main]
pub async fn detect_new_device(device_name: String, connection: ConnectionConfigInterface) -> DeviceDetectResultInterface {
    ActionBinder::new(get_app().await.storage()).connect_device(device_name, connection.into()).await.into()
}

#[tokio::main]
pub async fn get_stored_devices() -> Vec<DeviceDataInterface> {
    _get_stored_devices(get_app().await.storage())
}

fn _get_stored_devices(storage: &mut Storage) -> Vec<DeviceDataInterface> {
    match storage.get(Field::Devices) {
        StorageField::Devices(devs) => devs.values().into_iter().map(|v| v.clone().into()).collect(),
        _ => unreachable!(),
    }   
}

#[tokio::main]
pub async fn remove_device(device_id: String) {
    get_app().await.storage().remove(FieldId::Device(device_id))
}

#[tokio::main]
pub async fn set_brightness(device_id: String, brightness: f32) -> DeviceStateUpdateResult {
    let mut app = get_app().await;
    let (operator, device) = get_operator_device_pair(&mut app, device_id).await;
    utils::state_result_to_interface(
        ActionBinder::new(operator.storage).on_brightness_update(device, brightness).await
    )
}

#[tokio::main]
pub async fn set_rgb(device_id: String, rgb: RGBInterface) -> DeviceStateUpdateResult {
    let mut app = get_app().await;
    let (operator, device) = get_operator_device_pair(&mut app, device_id).await;
    utils::state_result_to_interface(
        ActionBinder::new(operator.storage).on_color_rgb_update(device, rgb.into()).await
    )
}

#[tokio::main]
pub async fn set_hsv(device_id: String, hsv: HSVInterface) -> DeviceStateUpdateResult {
    let mut app = get_app().await;
    let (operator, device) = get_operator_device_pair(&mut app, device_id).await;
    utils::state_result_to_interface(
        ActionBinder::new(operator.storage).on_color_hsv_update(device, hsv.into()).await
    )
}

#[tokio::main]
pub async fn set_ct(device_id: String, ct: CTInterface) -> DeviceStateUpdateResult {
    let mut app = get_app().await;
    let (operator, device) = get_operator_device_pair(&mut app, device_id).await;
    utils::state_result_to_interface(
        ActionBinder::new(operator.storage).on_color_ct_update(device, ct.into()).await
    )
}

#[tokio::main]
pub async fn set_color_mode(device_id: String, color_mode: ColorMode) -> DeviceStateUpdateResult {
    let mut app = get_app().await;
    let (operator, device) = get_operator_device_pair(&mut app, device_id).await;
    utils::state_result_to_interface(
        ActionBinder::new(operator.storage).on_color_mode_update(device, color_mode).await
    )
}

#[tokio::main]
pub async fn get_devices_for_using() -> Vec<DeviceInterface> {
    let mut app = get_app().await;
    let devs = _get_stored_devices(&mut app.storage);
    let mut res: Vec<DeviceInterface> = vec![];
    for dev in devs {
        res.append(&mut vec![DeviceInterface {
            id: dev.id.clone(),
            state: Some(_get_device_state(dev.id.clone(), &mut app).await),
            metadata: Box::new(dev),
        }]);
    };
    res
}

#[tokio::main]
pub async fn get_device_state(device_id: String) -> DeviceStateInterface {
    let mut app = get_app().await;
    let (operator, device) = get_operator_device_pair(&mut app, device_id.clone()).await;
    match app.storage.get_by_id(FieldId::DeviceState(device_id)) {
        Some(FieldRecord::DeviceState(v)) => v.into(),
        _ => match ActionBinder::new(&mut app.storage).sync_device_state(device).await {
            Ok(v) => v.into(),
            Err(e) => panic!("Error on sync_device_state"),
        }
    }
}

pub async fn _get_device_state(device_id: String, app: &mut MutexGuard<'static, App>) -> DeviceStateInterface {
    let (operator, device) = get_operator_device_pair(app, device_id.clone()).await;
    match app.storage.get_by_id(FieldId::DeviceState(device_id)) {
        Some(FieldRecord::DeviceState(v)) => v.into(),
        _ => match ActionBinder::new(&mut app.storage).sync_device_state(device).await {
            Ok(v) => v.into(),
            Err(e) => panic!("Error on sync_device_state"),
        }
    }
}

#[tokio::main]
pub async fn sync_device_state(device_id: String) -> DeviceStateInterface {
    let mut app = get_app().await;
    let (operator, device) = get_operator_device_pair(&mut app, device_id).await;
    match ActionBinder::new(operator.storage).sync_device_state(device).await {
        Ok(v) => v.into(),
        Err(e) => panic!("Error on sync_device_state"),
    }
}

async fn get_operator_device_pair<'op>(
    app: &'op mut MutexGuard<'static, App>, device_id: String
) -> (StorageOperator<'op>, Device) {
    let mut operator = StorageOperator::new(&mut app.storage);
    let device = impl_switch::device_from_data(
        operator.get_device_by_id(device_id), &mut operator
    ).await;
    (operator, device)
}

pub fn get_profiles() -> Vec<ProfileInterface> {
    vec![ProfileInterface::default()]
}

mod utils {
    use std::sync::Arc;

    use crate::base::data::{device_state::DeviceState, device_result::DeviceActionResultMeta};

    use super::{ DeviceStateUpdateResult };

    pub fn state_result_to_interface(
        result: Result<Arc<DeviceState>, Arc<DeviceActionResultMeta>>
    ) -> DeviceStateUpdateResult {
        match result {
            Ok(v) => DeviceStateUpdateResult::Ok(v.into()),
            Err(e) => DeviceStateUpdateResult::Err(e.as_ref().clone().into()),
        }
    }

}

impl From<ColorInterface> for ColorTransfer {
    fn from(col: ColorInterface) -> Self {
        match col {
            ColorInterface::None => todo!(),
            ColorInterface::HSV(hsv) => Self::HSV((*hsv).into()),
            ColorInterface::RGB(rgb) => Self::RGB((*rgb).into()),
            ColorInterface::CT(ct) => Self::CT((*ct).into()),
        }
    }
}

pub enum DeviceStateUpdateResult {
    Ok(DeviceStateInterface),
    Err(DeviceActionResultMetaInterface)
}

#[derive(Debug, Clone)]
pub struct DeviceActionResultMetaInterface {
    pub had_success: bool,
    pub code: Box<DeviceResultCode>,
    pub message: String,
}

impl Display for DeviceActionResultMetaInterface {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{} (code: {}, msg: {})", if self.had_success {"Ok"} else {"Error"}, match *self.code {
            DeviceResultCode::Ok => "Ok",
            DeviceResultCode::ConnectionError => "ConnectionError",
            DeviceResultCode::DeviceError => "DeviceError",
            DeviceResultCode::RequestError => "RequestError",
        }, self.message)
    }
}

impl From<DeviceActionResultMeta> for DeviceActionResultMetaInterface {
    fn from(res: DeviceActionResultMeta) -> Self {
        Self {
            code: Box::new(res.code),
            had_success: res.had_success,
            message: res.message
        }
    }
}

#[derive(Debug)]
pub enum DeviceDetectResultInterface {
    Ok(DeviceDataInterface),
    Error(Vec<DeviceDetectErrorItemInterface>)
}

impl From<DeviceDetectResult> for DeviceDetectResultInterface {
    fn from(r: DeviceDetectResult) -> Self {
        match r {
            DeviceDetectResult::Ok(d) => Self::Ok(d.into()),
            DeviceDetectResult::Error(e) => Self::Error(
                e.into_iter().map(|v| v.into()).collect()
            ),
        }
    }
}

#[derive(Debug)]
pub struct DeviceDetectErrorItemInterface(pub Box<DeviceImpl>, pub String);

impl From<DeviceDetectErrorItem> for DeviceDetectErrorItemInterface {
    fn from(e: DeviceDetectErrorItem) -> Self {
        Self(Box::new(e.0), e.1)
    }
}

#[derive(Default, Debug, Clone)]
pub struct DeviceInterface {
    pub id: String,
    pub metadata: Box<DeviceDataInterface>,
    pub state: Option<DeviceStateInterface>
}

impl From<Device> for DeviceInterface {
    fn from(dt: Device) -> Self {
        Self {
            id: dt.metadata.id.clone(),
            metadata: Box::new(DeviceDataInterface::from(dt.metadata)),
            state: Some(DeviceStateInterface::from(dt.state))
        }
    }
}

#[derive(Debug)]
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
    Color(Box<ColorStateInterface>),
    Animation(Box<AnimationStateInteface>),
    DirectMode(Box<DirectModeStateInterface>)
}

impl<'a> From<RunningState<'a>> for RunningStateInterface {
    fn from(state: RunningState) -> Self {
        match state {
            RunningState::None => RunningStateInterface::None,
            RunningState::Color(v) => RunningStateInterface::Color(Box::new((*v).into())),
            RunningState::Animation(v) => RunningStateInterface::Animation(Box::new((*v).into())),
            RunningState::DirectMode(v) => RunningStateInterface::DirectMode(Box::new((*v).into())),
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
pub struct ColorStateInterface {
    pub brightness: f32,
    pub color: Box<ColorInterface>,
}

impl From<ColorState> for ColorStateInterface {
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

impl From<RGBInterface> for RGB {
    fn from(rgb: RGBInterface) -> Self {
        Self {
            rgb: (rgb.rgb[0], rgb.rgb[1], rgb.rgb[2]),
        }
    }
}

#[derive(Default, Debug, Clone, Copy)]
pub struct HSVInterface {
    pub hue: f32,
    pub saturation: f32,
}

impl From<HSV> for HSVInterface {
    fn from(hsv: HSV) -> Self {
        Self {
            hue: hsv.hue,
            saturation: hsv.saturation,
        }
    }
}

impl From<HSVInterface> for HSV {
    fn from(hsv: HSVInterface) -> Self {
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

impl From<CTInterface> for CT {
    fn from(ct: CTInterface) -> Self {
        Self {
            temperature: ct.temperature,
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
            ProfileData::Single(dt) => ProfileDataInterface::Single(dt.into()),
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
    pub devices: Vec<DeviceInterface>,
    pub state: Box<DeviceStateInterface>,
}

impl<'dev, 'dev_state> From<ProfileMultiple<'dev, 'dev_state>> for ProfileMultipleInterface {
    fn from(dt: ProfileMultiple) -> Self {
        Self {
           devices: dt.devices.iter().map(|&v| v.clone().into()).collect(),
           state: Box::new(dt.state.clone().into()),
        }
    }
}
