use core::{ fmt };
use std::marker::Sync;
use std::pin::Pin;
use std::sync::Arc;

use async_trait::async_trait;
use futures::Future;
use futures::executor::block_on;

use crate::device::impl_interface::DeviceImplInterface;

use super::data::common::Switch;
use super::data::device_state::{ ColorState, AnimationState, DirectModeState, DeviceState, HSV, RGB, CT, ColorMode };
use super::data::device_metadata::{ Device, DeviceCommandCapability, DeviceData, DeviceStateProvider };
use super::data::device_result::{ DeviceActionResultWrapped, DeviceMetaActionResultWrapped };
use super::meta::device_macros::{ device_action_decorator };

device_action_decorator! {
    #[derive(Debug)]
    pub struct DeviceActionDecorator
}

#[async_trait]
pub trait DeviceAction: fmt::Debug + Sync + Send {
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
    async fn get_current_state(self: Arc<Self>, data: DeviceStateProvider) -> DeviceMetaActionResultWrapped<DeviceState>;
}

#[async_trait]
impl DeviceAction for Arc<DeviceActionDecorator> {
    async fn set_power_state(
        self: Arc<Self>, data: DeviceStateProvider, power_state: Switch
    ) -> DeviceActionResultWrapped {
        self.next.clone().set_power_state(data, power_state).await
    }

    async fn set_brightness(
        self: Arc<Self>, data: DeviceStateProvider, brightness: f32
    ) -> DeviceActionResultWrapped {
        self.next.clone().set_brightness(data, brightness).await
    }

    async fn set_hsv_color(
        self: Arc<Self>, data: DeviceStateProvider, hsv: HSV
    ) -> DeviceActionResultWrapped {
        self.next.clone().set_hsv_color(data, hsv).await
    }

    async fn set_rgb_color(
        self: Arc<Self>, data: DeviceStateProvider, rgb: RGB
    ) -> DeviceActionResultWrapped {
        self.next.clone().set_rgb_color(data, rgb).await
    }

    async fn set_ct_color(
        self: Arc<Self>, data: DeviceStateProvider, ct: CT
    ) -> DeviceActionResultWrapped {
        self.next.clone().set_ct_color(data, ct).await
    }

    async fn set_color_mode(
        self: Arc<Self>, data: DeviceStateProvider, mode: ColorMode
    ) -> DeviceActionResultWrapped {
        self.next.clone().set_color_mode(data, mode).await
    }

    async fn set_animation_state(
        self: Arc<Self>, data: DeviceStateProvider, animation_state: AnimationState
    ) -> DeviceActionResultWrapped {
        self.next.clone().set_animation_state(data, animation_state).await
    }

    async fn set_direct_mode_state(
        self: Arc<Self>, data: DeviceStateProvider, direct_mode_state: DirectModeState
    ) -> DeviceActionResultWrapped {
        self.next.clone().set_direct_mode_state(data, direct_mode_state).await
    }

    async fn get_current_state(self: Arc<Self>, data: DeviceStateProvider) -> DeviceMetaActionResultWrapped<DeviceState> {
        self.next.clone().get_current_state(data).await
    }
}

device_action_decorator!(
    #[derive(Debug)]
    pub struct DeviceActionFilter {}
);

#[async_trait]
impl DeviceAction for DeviceActionFilter {

    async fn set_power_state(
        self: Arc<Self>, data: DeviceStateProvider, power_state: Switch
    ) -> DeviceActionResultWrapped {
        let metadata = data.metadata();
        let res = self.next.clone().set_power_state(data, power_state).await;
        self.clone().run_guarded(metadata, &DeviceCommandCapability::SwitchPower, move || res).await
    }

    async fn set_brightness(
        self: Arc<Self>, data: DeviceStateProvider, brightness: f32
    ) -> DeviceActionResultWrapped {
        let metadata = data.metadata();
        let res = self.next.clone().set_brightness(data, brightness).await;
        self.clone().run_guarded(metadata, &DeviceCommandCapability::SetBrightness, move || res).await
    }

    async fn set_hsv_color(
        self: Arc<Self>, data: DeviceStateProvider, hsv: HSV
    ) -> DeviceActionResultWrapped {
        let metadata = data.metadata();
        let res = self.next.clone().set_hsv_color(data, hsv).await;
        self.clone().run_guarded(metadata, &DeviceCommandCapability::SetHSV, move || res).await
    }

    async fn set_rgb_color(
        self: Arc<Self>, data: DeviceStateProvider, rgb: RGB
    ) -> DeviceActionResultWrapped {
        let metadata = data.metadata();
        let res = self.next.clone().set_rgb_color(data, rgb).await;
        self.clone().run_guarded(metadata, &DeviceCommandCapability::SetRGB, move || res).await
    }

    async fn set_ct_color(
        self: Arc<Self>, data: DeviceStateProvider, ct: CT
    ) -> DeviceActionResultWrapped {
        let metadata = data.metadata();
        let res = self.next.clone().set_ct_color(data, ct).await;
        self.clone().run_guarded(metadata, &DeviceCommandCapability::SetCT, move || res).await
    }

    async fn set_color_mode(
        self: Arc<Self>, data: DeviceStateProvider, mode: ColorMode
    ) -> DeviceActionResultWrapped {
        let metadata = data.metadata();
        let res = self.next.clone().set_color_mode(data, mode).await;
        self.clone().run_guarded(metadata, &DeviceCommandCapability::SetCT, move || res).await
    }

    async fn set_animation_state(
        self: Arc<Self>, data: DeviceStateProvider, animation_state: AnimationState
    ) -> DeviceActionResultWrapped {
        let metadata = data.metadata();
        let res = self.next.clone().set_animation_state(data, animation_state).await;
        self.clone().run_guarded(metadata, &DeviceCommandCapability::SetAnimation, move || res).await
    }

    async fn set_direct_mode_state(
        self: Arc<Self>, data: DeviceStateProvider, direct_mode_state: DirectModeState
    ) -> DeviceActionResultWrapped {
        let metadata = data.metadata();
        let res = self.next.clone().set_direct_mode_state(data, direct_mode_state).await;
        self.clone().run_guarded(metadata, &DeviceCommandCapability::SetDirectMode, move || res).await
    }

    async fn get_current_state(self: Arc<Self>, data: DeviceStateProvider) -> DeviceMetaActionResultWrapped<DeviceState> {
        self.next.clone().get_current_state(data).await
    }
}

impl DeviceActionFilter {

    async fn run_guarded(
        self: Arc<Self>, data: Arc<DeviceData>, cap_key: &DeviceCommandCapability, 
        run: impl FnOnce() -> DeviceActionResultWrapped
    ) -> DeviceActionResultWrapped {
        let x = run();
        return x;
        // TODO: Manage implementations capabilities
        if ! data.has_capability(cap_key) {
            panic!("Called a device action without support")
        } else {
            run()
        }
    }
}

#[derive(Debug)]
pub struct DeviceController {
    pub implementation: Arc<dyn DeviceImplInterface>,
}

#[async_trait]
impl DeviceAction for DeviceController {

    async fn set_power_state(
        self: Arc<Self>, data: DeviceStateProvider, power_state: Switch
    ) -> DeviceActionResultWrapped {
        self.implementation.clone().set_power_state(data, power_state).await
    }

    async fn set_brightness(
        self: Arc<Self>, data: DeviceStateProvider, brightness: f32
    ) -> DeviceActionResultWrapped {
        self.implementation.clone().set_brightness(data, brightness).await
    }

    async fn set_hsv_color(
        self: Arc<Self>, data: DeviceStateProvider, hsv: HSV
    ) -> DeviceActionResultWrapped {
        self.implementation.clone().set_hsv_color(data, hsv).await
    }

    async fn set_rgb_color(
        self: Arc<Self>, data: DeviceStateProvider, rgb: RGB
    ) -> DeviceActionResultWrapped {
        self.implementation.clone().set_rgb_color(data, rgb).await
    }

    async fn set_ct_color(
        self: Arc<Self>, data: DeviceStateProvider, ct: CT
    ) -> DeviceActionResultWrapped {
        self.implementation.clone().set_ct_color(data, ct).await
    }

    async fn set_color_mode(
        self: Arc<Self>, data: DeviceStateProvider, mode: ColorMode
    ) -> DeviceActionResultWrapped {
        self.implementation.clone().set_color_mode(data, mode).await
    }

    async fn set_animation_state(
        self: Arc<Self>, data: DeviceStateProvider, animation_state: AnimationState
    ) -> DeviceActionResultWrapped {
        self.implementation.clone().set_animation_state(data, animation_state).await
    }

    async fn set_direct_mode_state(
        self: Arc<Self>, data: DeviceStateProvider, direct_mode_state: DirectModeState
    ) -> DeviceActionResultWrapped {
        self.implementation.clone().set_direct_mode_state(data, direct_mode_state).await
    }

    async fn get_current_state(self: Arc<Self>, data: DeviceStateProvider) -> DeviceMetaActionResultWrapped<DeviceState> {
        self.implementation.clone().get_current_state(data).await
    }
}
