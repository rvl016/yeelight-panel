#![allow(
    non_camel_case_types,
    unused,
    clippy::redundant_closure,
    clippy::useless_conversion,
    clippy::unit_arg,
    clippy::double_parens,
    non_snake_case,
    clippy::too_many_arguments
)]
// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.65.1.

use crate::api::*;
use core::panic::UnwindSafe;
use flutter_rust_bridge::*;
use std::ffi::c_void;
use std::sync::Arc;

// Section: imports

use crate::base::data::device_metadata::DeviceCommandCapability;
use crate::base::data::device_metadata::DeviceImpl;
use crate::base::data::device_metadata::DeviceType;
use crate::base::data::device_result::DeviceResultCode;
use crate::base::data::device_state::ColorMode;

// Section: wire functions

fn wire_platform_impl(port_: MessagePort) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "platform",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || move |task_callback| Ok(platform()),
    )
}
fn wire_rust_release_mode_impl(port_: MessagePort) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "rust_release_mode",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || move |task_callback| Ok(rust_release_mode()),
    )
}
fn wire_init_app_impl(port_: MessagePort) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "init_app",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || move |task_callback| Ok(init_app()),
    )
}
fn wire_detect_new_device_impl(
    port_: MessagePort,
    device_name: impl Wire2Api<String> + UnwindSafe,
    connection: impl Wire2Api<ConnectionConfigInterface> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "detect_new_device",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_device_name = device_name.wire2api();
            let api_connection = connection.wire2api();
            move |task_callback| Ok(detect_new_device(api_device_name, api_connection))
        },
    )
}
fn wire_get_stored_devices_impl(port_: MessagePort) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "get_stored_devices",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || move |task_callback| Ok(get_stored_devices()),
    )
}
fn wire_remove_device_impl(port_: MessagePort, device_id: impl Wire2Api<String> + UnwindSafe) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "remove_device",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_device_id = device_id.wire2api();
            move |task_callback| Ok(remove_device(api_device_id))
        },
    )
}
fn wire_set_brightness_impl(
    port_: MessagePort,
    device_id: impl Wire2Api<String> + UnwindSafe,
    brightness: impl Wire2Api<f32> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "set_brightness",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_device_id = device_id.wire2api();
            let api_brightness = brightness.wire2api();
            move |task_callback| Ok(set_brightness(api_device_id, api_brightness))
        },
    )
}
fn wire_set_rgb_impl(
    port_: MessagePort,
    device_id: impl Wire2Api<String> + UnwindSafe,
    rgb: impl Wire2Api<RGBInterface> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "set_rgb",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_device_id = device_id.wire2api();
            let api_rgb = rgb.wire2api();
            move |task_callback| Ok(set_rgb(api_device_id, api_rgb))
        },
    )
}
fn wire_set_hsv_impl(
    port_: MessagePort,
    device_id: impl Wire2Api<String> + UnwindSafe,
    hsv: impl Wire2Api<HSVInterface> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "set_hsv",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_device_id = device_id.wire2api();
            let api_hsv = hsv.wire2api();
            move |task_callback| Ok(set_hsv(api_device_id, api_hsv))
        },
    )
}
fn wire_set_ct_impl(
    port_: MessagePort,
    device_id: impl Wire2Api<String> + UnwindSafe,
    ct: impl Wire2Api<CTInterface> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "set_ct",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_device_id = device_id.wire2api();
            let api_ct = ct.wire2api();
            move |task_callback| Ok(set_ct(api_device_id, api_ct))
        },
    )
}
fn wire_set_color_mode_impl(
    port_: MessagePort,
    device_id: impl Wire2Api<String> + UnwindSafe,
    color_mode: impl Wire2Api<ColorMode> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "set_color_mode",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_device_id = device_id.wire2api();
            let api_color_mode = color_mode.wire2api();
            move |task_callback| Ok(set_color_mode(api_device_id, api_color_mode))
        },
    )
}
fn wire_get_devices_for_using_impl(port_: MessagePort) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "get_devices_for_using",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || move |task_callback| Ok(get_devices_for_using()),
    )
}
fn wire_get_device_state_impl(port_: MessagePort, device_id: impl Wire2Api<String> + UnwindSafe) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "get_device_state",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_device_id = device_id.wire2api();
            move |task_callback| Ok(get_device_state(api_device_id))
        },
    )
}
fn wire_sync_device_state_impl(port_: MessagePort, device_id: impl Wire2Api<String> + UnwindSafe) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "sync_device_state",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_device_id = device_id.wire2api();
            move |task_callback| Ok(sync_device_state(api_device_id))
        },
    )
}
fn wire_get_profiles_impl(port_: MessagePort) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "get_profiles",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || move |task_callback| Ok(get_profiles()),
    )
}
// Section: wrapper structs

// Section: static checks

// Section: allocate functions

// Section: related functions

// Section: impl Wire2Api

pub trait Wire2Api<T> {
    fn wire2api(self) -> T;
}

impl<T, S> Wire2Api<Option<T>> for *mut S
where
    *mut S: Wire2Api<T>,
{
    fn wire2api(self) -> Option<T> {
        (!self.is_null()).then(|| self.wire2api())
    }
}

impl Wire2Api<ColorMode> for i32 {
    fn wire2api(self) -> ColorMode {
        match self {
            0 => ColorMode::None,
            1 => ColorMode::HSV,
            2 => ColorMode::RGB,
            3 => ColorMode::CT,
            _ => unreachable!("Invalid variant for ColorMode: {}", self),
        }
    }
}

impl Wire2Api<f32> for f32 {
    fn wire2api(self) -> f32 {
        self
    }
}

impl Wire2Api<i32> for i32 {
    fn wire2api(self) -> i32 {
        self
    }
}

impl Wire2Api<u16> for u16 {
    fn wire2api(self) -> u16 {
        self
    }
}
impl Wire2Api<u8> for u8 {
    fn wire2api(self) -> u8 {
        self
    }
}

// Section: impl IntoDart

impl support::IntoDart for AnimationStateInteface {
    fn into_dart(self) -> support::DartAbi {
        Vec::<u8>::new().into_dart()
    }
}
impl support::IntoDartExceptPrimitive for AnimationStateInteface {}

impl support::IntoDart for ColorInterface {
    fn into_dart(self) -> support::DartAbi {
        match self {
            Self::None => vec![0.into_dart()],
            Self::HSV(field0) => vec![1.into_dart(), field0.into_dart()],
            Self::RGB(field0) => vec![2.into_dart(), field0.into_dart()],
            Self::CT(field0) => vec![3.into_dart(), field0.into_dart()],
        }
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for ColorInterface {}
impl support::IntoDart for ColorStateInterface {
    fn into_dart(self) -> support::DartAbi {
        vec![self.brightness.into_dart(), (*self.color).into_dart()].into_dart()
    }
}
impl support::IntoDartExceptPrimitive for ColorStateInterface {}

impl support::IntoDart for ConnectionConfigInterface {
    fn into_dart(self) -> support::DartAbi {
        vec![(*self.ip_v4).into_dart()].into_dart()
    }
}
impl support::IntoDartExceptPrimitive for ConnectionConfigInterface {}

impl support::IntoDart for CTInterface {
    fn into_dart(self) -> support::DartAbi {
        vec![self.temperature.into_dart()].into_dart()
    }
}
impl support::IntoDartExceptPrimitive for CTInterface {}

impl support::IntoDart for DeviceActionResultMetaInterface {
    fn into_dart(self) -> support::DartAbi {
        vec![
            self.had_success.into_dart(),
            (*self.code).into_dart(),
            self.message.into_dart(),
        ]
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for DeviceActionResultMetaInterface {}

impl support::IntoDart for DeviceCommandCapability {
    fn into_dart(self) -> support::DartAbi {
        match self {
            Self::SwitchPower => 0,
            Self::SetBrightness => 1,
            Self::SetRGB => 2,
            Self::SetHSV => 3,
            Self::SetCT => 4,
            Self::SetAnimation => 5,
            Self::SetDirectMode => 6,
        }
        .into_dart()
    }
}
impl support::IntoDart for DeviceDataInterface {
    fn into_dart(self) -> support::DartAbi {
        vec![
            self.id.into_dart(),
            self.name.into_dart(),
            (*self.device_type).into_dart(),
            (*self.device_impl).into_dart(),
            self.capabilities.into_dart(),
        ]
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for DeviceDataInterface {}

impl support::IntoDart for DeviceDetectErrorItemInterface {
    fn into_dart(self) -> support::DartAbi {
        vec![(*self.0).into_dart(), self.1.into_dart()].into_dart()
    }
}
impl support::IntoDartExceptPrimitive for DeviceDetectErrorItemInterface {}

impl support::IntoDart for DeviceDetectResultInterface {
    fn into_dart(self) -> support::DartAbi {
        match self {
            Self::Ok(field0) => vec![0.into_dart(), field0.into_dart()],
            Self::Error(field0) => vec![1.into_dart(), field0.into_dart()],
        }
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for DeviceDetectResultInterface {}
impl support::IntoDart for DeviceImpl {
    fn into_dart(self) -> support::DartAbi {
        match self {
            Self::None => 0,
            Self::Yeelight => 1,
        }
        .into_dart()
    }
}
impl support::IntoDart for DeviceInterface {
    fn into_dart(self) -> support::DartAbi {
        vec![
            self.id.into_dart(),
            (*self.metadata).into_dart(),
            self.state.into_dart(),
        ]
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for DeviceInterface {}

impl support::IntoDart for DeviceResultCode {
    fn into_dart(self) -> support::DartAbi {
        match self {
            Self::Ok => 0,
            Self::ConnectionError => 1,
            Self::DeviceError => 2,
            Self::RequestError => 3,
        }
        .into_dart()
    }
}
impl support::IntoDart for DeviceStateInterface {
    fn into_dart(self) -> support::DartAbi {
        vec![
            (*self.config).into_dart(),
            (*self.running_state).into_dart(),
        ]
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for DeviceStateInterface {}

impl support::IntoDart for DeviceStateUpdateResult {
    fn into_dart(self) -> support::DartAbi {
        match self {
            Self::Ok(field0) => vec![0.into_dart(), field0.into_dart()],
            Self::Err(field0) => vec![1.into_dart(), field0.into_dart()],
        }
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for DeviceStateUpdateResult {}
impl support::IntoDart for DeviceType {
    fn into_dart(self) -> support::DartAbi {
        match self {
            Self::Bulb => 0,
        }
        .into_dart()
    }
}
impl support::IntoDart for DirectModeStateInterface {
    fn into_dart(self) -> support::DartAbi {
        vec![(*self.connection_addr).into_dart()].into_dart()
    }
}
impl support::IntoDartExceptPrimitive for DirectModeStateInterface {}

impl support::IntoDart for HSVInterface {
    fn into_dart(self) -> support::DartAbi {
        vec![self.hue.into_dart(), self.saturation.into_dart()].into_dart()
    }
}
impl support::IntoDartExceptPrimitive for HSVInterface {}

impl support::IntoDart for IPv4ConnectionInteface {
    fn into_dart(self) -> support::DartAbi {
        vec![self.ip.into_dart(), self.port.into_dart()].into_dart()
    }
}
impl support::IntoDartExceptPrimitive for IPv4ConnectionInteface {}

impl support::IntoDart for Platform {
    fn into_dart(self) -> support::DartAbi {
        match self {
            Self::Unknown => 0,
            Self::Android => 1,
            Self::Ios => 2,
            Self::Windows => 3,
            Self::Unix => 4,
            Self::MacIntel => 5,
            Self::MacApple => 6,
            Self::Wasm => 7,
        }
        .into_dart()
    }
}
impl support::IntoDart for ProfileDataInterface {
    fn into_dart(self) -> support::DartAbi {
        match self {
            Self::None => vec![0.into_dart()],
            Self::Single(field0) => vec![1.into_dart(), field0.into_dart()],
            Self::Multiple(field0) => vec![2.into_dart(), field0.into_dart()],
        }
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for ProfileDataInterface {}
impl support::IntoDart for ProfileInterface {
    fn into_dart(self) -> support::DartAbi {
        vec![
            self.id.into_dart(),
            self.name.into_dart(),
            self.data.into_dart(),
        ]
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for ProfileInterface {}

impl support::IntoDart for ProfileMultipleInterface {
    fn into_dart(self) -> support::DartAbi {
        vec![self.devices.into_dart(), (*self.state).into_dart()].into_dart()
    }
}
impl support::IntoDartExceptPrimitive for ProfileMultipleInterface {}

impl support::IntoDart for ProfileSingleInterface {
    fn into_dart(self) -> support::DartAbi {
        vec![(*self.device).into_dart(), (*self.state).into_dart()].into_dart()
    }
}
impl support::IntoDartExceptPrimitive for ProfileSingleInterface {}

impl support::IntoDart for RGBInterface {
    fn into_dart(self) -> support::DartAbi {
        vec![self.rgb.into_dart()].into_dart()
    }
}
impl support::IntoDartExceptPrimitive for RGBInterface {}

impl support::IntoDart for RunningStateInterface {
    fn into_dart(self) -> support::DartAbi {
        match self {
            Self::None => vec![0.into_dart()],
            Self::Color(field0) => vec![1.into_dart(), field0.into_dart()],
            Self::Animation(field0) => vec![2.into_dart(), field0.into_dart()],
            Self::DirectMode(field0) => vec![3.into_dart(), field0.into_dart()],
        }
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for RunningStateInterface {}

impl support::IntoDart for Wrapper {
    fn into_dart(self) -> support::DartAbi {
        vec![self.data.into_dart()].into_dart()
    }
}
impl support::IntoDartExceptPrimitive for Wrapper {}

// Section: executor

support::lazy_static! {
    pub static ref FLUTTER_RUST_BRIDGE_HANDLER: support::DefaultHandler = Default::default();
}

#[cfg(not(target_family = "wasm"))]
#[path = "bridge_generated.io.rs"]
mod io;
#[cfg(not(target_family = "wasm"))]
pub use io::*;
