use core::{ fmt };
use std::marker::Sync;
use std::sync::Arc;
use futures::executor::block_on;

use crate::device::impl_interface::DeviceImplInterface;

use super::data::common::Switch;
use super::data::device_state::{ ColorState, AnimationState, DirectModeState, DeviceState };
use super::data::device_metadata::{ Device, DeviceCommandCapability, DeviceData, DeviceStateProvider };
use super::data::device_result::{ DeviceActionResultWrapped, DeviceMetaActionResultWrapped };
use super::meta::device_macros::{ device_action_decorator };

device_action_decorator! {
    #[derive(Debug)]
    pub struct DeviceActionDecorator
}

pub trait DeviceAction: fmt::Debug + Sync + Send {
    fn set_power_state(self: Arc<Self>, data: DeviceStateProvider, power_state: Switch) -> DeviceActionResultWrapped;
    fn set_color_state(self: Arc<Self>, data: DeviceStateProvider, color_state: ColorState) -> DeviceActionResultWrapped;
    fn set_animation_state(
        self: Arc<Self>, data: DeviceStateProvider, animation_state: AnimationState
    ) -> DeviceActionResultWrapped;
    fn set_direct_mode_state(
        self: Arc<Self>, data: DeviceStateProvider, direct_mode_state: DirectModeState
    ) -> DeviceActionResultWrapped;
    fn get_current_state(self: Arc<Self>, data: DeviceStateProvider) -> DeviceMetaActionResultWrapped<DeviceState>;
}

impl DeviceAction for Arc<DeviceActionDecorator> {
    fn set_power_state(self: Arc<Self>, data: DeviceStateProvider, power_state: Switch) -> DeviceActionResultWrapped {
        self.next.clone().set_power_state(data, power_state)
    }

    fn set_color_state(self: Arc<Self>, data: DeviceStateProvider, color_state: ColorState) -> DeviceActionResultWrapped {
        self.next.clone().set_color_state(data, color_state)
    }

    fn set_animation_state(
        self: Arc<Self>, data: DeviceStateProvider, animation_state: AnimationState
    ) -> DeviceActionResultWrapped {
        self.next.clone().set_animation_state(data, animation_state)
    }

    fn set_direct_mode_state(
        self: Arc<Self>, data: DeviceStateProvider, direct_mode_state: DirectModeState
    ) -> DeviceActionResultWrapped {
        self.next.clone().set_direct_mode_state(data, direct_mode_state)
    }

    fn get_current_state(self: Arc<Self>, data: DeviceStateProvider) -> DeviceMetaActionResultWrapped<DeviceState> {
        self.next.clone().get_current_state(data)
    }
}

device_action_decorator!(
    #[derive(Debug)]
    pub struct DeviceActionFilter {}
);

impl<'device> DeviceAction for DeviceActionFilter {

    fn set_power_state(self: Arc<Self>, data: DeviceStateProvider, power_state: Switch) -> DeviceActionResultWrapped {
        self.clone().run_guarded(data, &DeviceCommandCapability::SwitchPower, |data| { 
            self.next.clone().set_power_state(data, power_state) 
        })
    }

    fn set_color_state(self: Arc<Self>, data: DeviceStateProvider, color_state: ColorState) -> DeviceActionResultWrapped {
        self.clone().run_guarded(data, &DeviceCommandCapability::SetColor, |data| {
            self.next.clone().set_color_state(data, color_state)
        })
    }

    fn set_animation_state(
        self: Arc<Self>, data: DeviceStateProvider, animation_state: AnimationState
    ) -> DeviceActionResultWrapped {
        self.clone().run_guarded(data, &DeviceCommandCapability::SetAnimation, |data| {
            self.next.clone().set_animation_state(data, animation_state)
        })
    }

    fn set_direct_mode_state(
        self: Arc<Self>, data: DeviceStateProvider, direct_mode_state: DirectModeState
    ) -> DeviceActionResultWrapped {
        self.clone().run_guarded(data, &DeviceCommandCapability::SetDirectMode, |data| {
            self.next.clone().set_direct_mode_state(data, direct_mode_state)
        })
    }

    fn get_current_state(self: Arc<Self>, data: DeviceStateProvider) -> DeviceMetaActionResultWrapped<DeviceState> {
        self.next.clone().get_current_state(data)
    }
}

impl DeviceActionFilter {

    fn run_guarded(
        self: Arc<Self>, data: DeviceStateProvider, cap_key: &DeviceCommandCapability, 
        run: impl FnOnce(DeviceStateProvider) -> DeviceActionResultWrapped
    ) -> DeviceActionResultWrapped {
        if ! data.metadata().has_capability(cap_key) {
            panic!("Called a device action without support")
        } else {
            run(data)
        }
    }
}

#[derive(Debug)]
pub struct DeviceController {
    pub implementation: Arc<dyn DeviceImplInterface>,
}

impl DeviceAction for DeviceController {

    fn set_power_state(self: Arc<Self>, data: DeviceStateProvider, power_state: Switch) -> DeviceActionResultWrapped {
        block_on(self.implementation.clone().set_power_state(data, power_state))
    }

    fn set_color_state(self: Arc<Self>, data: DeviceStateProvider, color_state: ColorState) -> DeviceActionResultWrapped {
        block_on(self.implementation.clone().set_color_state(data, color_state))
    }

    fn set_animation_state(
        self: Arc<Self>, data: DeviceStateProvider, animation_state: AnimationState
    ) -> DeviceActionResultWrapped {
        block_on(self.implementation.clone().set_animation_state(data, animation_state))
    }

    fn set_direct_mode_state(
        self: Arc<Self>, data: DeviceStateProvider, direct_mode_state: DirectModeState
    ) -> DeviceActionResultWrapped {
        block_on(self.implementation.clone().set_direct_mode_state(data, direct_mode_state))
    }

    fn get_current_state(self: Arc<Self>, data: DeviceStateProvider) -> DeviceMetaActionResultWrapped<DeviceState> {
        block_on(self.implementation.clone().get_current_state(data))
    }
}
