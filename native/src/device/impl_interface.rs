use std::fmt::Debug;
use std::sync::{ RwLock, Arc, RwLockReadGuard, RwLockWriteGuard, LockResult };
use async_trait::async_trait;

use crate::base::data::common::{ Switch };
use crate::base::data::device_metadata::{ Device, ConnectionConfig, DeviceData, DeviceStateProvider };
use crate::base::data::device_result::{ DeviceConnectionResult, DeviceActionResultWrapped, DeviceMetaActionResultWrapped };
use crate::base::data::device_state::{ ColorState, AnimationState, DirectModeState, DeviceState };
use crate::base::data::transition::{ Transition };

#[async_trait(?Send)]
pub trait DeviceImplInterface: Debug + Sync + Send {

    async fn is_connected(self: Arc<Self>) -> bool;
    fn set_current_transition(self: Arc<Self>, effect: Transition);
    async fn set_power_state(
        self: Arc<Self>, data: DeviceStateProvider, power_state: Switch
    ) -> DeviceActionResultWrapped;
    async fn set_color_state(
        self: Arc<Self>, data: DeviceStateProvider, color_state: ColorState
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

#[async_trait(?Send)]
pub trait DeviceImplBuilder {

    async fn connect<'a>(connection_config: ConnectionConfig) -> DeviceConnectionResult<Box<dyn DeviceImplRaw>>;
}
