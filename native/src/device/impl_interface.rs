use std::fmt::Debug;
use std::sync::Arc;
use async_trait::async_trait;

use crate::base::data::{
    common::Switch,
    device_metadata::{ ConnectionConfig, DeviceStateProvider },
    device_result::{ DeviceConnectionResult, DeviceActionResultWrapped, DeviceMetaActionResultWrapped },
    device_state::{ AnimationState, DirectModeState, DeviceState, HSV, RGB, CT, ColorMode },
    transition::Transition,
};

#[async_trait]
pub trait DeviceImplInterface: Debug + Sync + Send {

    async fn is_connected(self: Arc<Self>) -> bool;
    async fn set_current_transition(self: Arc<Self>, effect: Transition);
    async fn set_power_state(
        self: Arc<Self>, data: DeviceStateProvider, power_state: Switch
    ) -> DeviceActionResultWrapped;
    async fn set_brightness(
        self: Arc<Self>, data: DeviceStateProvider, brightness: f32
    ) -> DeviceActionResultWrapped;
    async fn set_hsv_color(
        self: Arc<Self>, data: DeviceStateProvider, hsv: HSV
    ) -> DeviceActionResultWrapped;
    async fn set_rgb_color(
        self: Arc<Self>, data: DeviceStateProvider, rgb: RGB
    ) -> DeviceActionResultWrapped;
    async fn set_ct_color(
        self: Arc<Self>, data: DeviceStateProvider, ct: CT
    ) -> DeviceActionResultWrapped;
    async fn set_color_mode(
        self: Arc<Self>, data: DeviceStateProvider, mode: ColorMode
    ) -> DeviceActionResultWrapped;
    async fn set_animation_state(
        self: Arc<Self>, data: DeviceStateProvider, animation_state: AnimationState
    ) -> DeviceActionResultWrapped;
    async fn set_direct_mode_state(
        self: Arc<Self>, data: DeviceStateProvider, direct_mode_state: DirectModeState
    ) -> DeviceActionResultWrapped;
    async fn get_current_state(
        self: Arc<Self>, data: DeviceStateProvider
    ) -> DeviceMetaActionResultWrapped<DeviceState>;
}

pub trait DeviceImplRaw {
    fn for_using(self: Box<Self>) -> Arc<dyn DeviceImplInterface>;
}

#[async_trait]
pub trait DeviceImplBuilder {

    async fn connect<'a>(connection_config: ConnectionConfig) -> DeviceConnectionResult<Box<dyn DeviceImplRaw>>;
}
