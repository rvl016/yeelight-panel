use std::fmt::Debug;
use std::iter::{Zip, zip};
use std::slice::Iter;
use std::sync::{ Arc, RwLock, Mutex };
use std::{ time::Duration };
use async_trait::async_trait;
use futures::executor::block_on;
use yeelight::{ Bulb, Effect, Mode, Power, Properties, Property, MusicAction, Class, BulbError, Response };
use crate::base::common::RwLockProvider;
use crate::base::data::common::{ Switch, IPv4Connection, ActionResult, NULL_IPV4_CONNECTION, GenericError };
use crate::base::data::device_result::{DeviceConnectionResult, DeviceActionResult, DeviceResult, DeviceError, DeviceIOError, DeviceMetaActionResult, DeviceMetaActionResultWrapped, DeviceActionResultWrapped, DeviceConnectionError};
use crate::base::data::transition::{Transition, TransitionEffect, DEFAULT_TRANSITION};
use crate::base::device_result::ResultBuildble;
use crate::device::impl_interface::{DeviceImplInterface, DeviceImplBuilder, DeviceImplRaw};
use crate::base::data::device_metadata::{ Device, ConnectionConfig, DeviceId, DeviceType, DeviceImpl, DeviceStateProvider, DeviceVariant };
use crate::base::data::device_state::{ ColorState, AnimationState, DeviceState, DirectModeState, Color, RunningState, ColorMode, RunningMode, DeviceStateBuilder };

pub struct YeelightImpl {
    bulb: Bulb,
    current_transition: Transition,
    connection: ConnectionConfig,
}

pub type Yeelight = RwLock<YeelightImpl>;

#[async_trait(?Send)]
impl DeviceImplInterface for Yeelight {

    async fn is_connected(self: Arc<Self>) -> bool {
        self.write().unwrap().connection.ip_v4 != NULL_IPV4_CONNECTION
    }

    fn set_current_transition(self: Arc<Self>, effect: Transition) {
        self.write().unwrap().current_transition = effect
    }

    async fn set_power_state(
        self: Arc<Self>, data: DeviceStateProvider, power_state: Switch
    ) -> DeviceActionResultWrapped {
        let s = RwLockProvider::new(&self);
        let res = s.reading().get_processed_response(
            data.state_or_default(), 
            block_on(s.writing().bulb.set_power(
                Power::from(power_state), s.reading().get_cur_transition_effect(), 
                s.reading().get_cur_transition_duration(), Mode::Normal
            ))
        );
        res
        //let response = bulb.get_prop(&props).await?.unwrap();
        //let mut bulb = Bulb::connect("192.168.0.105", 55443).await?;
        //bulb.set_bright(100, Effect::Smooth, Duration::from_secs(1)).await?;
        //// Set Temperature
        //self.bulb.set_ct_abx(100, Effect::Sudden, Duration::from_secs(1)).await?;
        //self.bulb.set_hsv(1234, 10, Effect::Smooth, Duration::from_secs(1)).await?;
        //self.bulb.set_music(MusicAction::On, "192.168.0.1", 8000).await?;
        //self.bulb.set_name("Bulb Bla").await?;
        //self.bulb.set_power(Power::On, Effect::Sudden, Duration::from_secs(1), Mode::Normal).await?;
        //self.bulb.set_rgb(0xFF_FF_FF, Effect::Smooth, Duration::from_secs(1)).await?;
        //self.bulb.set_notify(Sender).await?;
        //self.bulb.adjust_ct(percentage, duration)
    }

    async fn set_color_state(
        self: Arc<Self>, data: DeviceStateProvider, color_state: ColorState
    ) -> DeviceActionResultWrapped {
        let s = RwLockProvider::new(&self);
        let res = s.reading().get_processed_response(
            data.state_or_default(), 
            block_on(s.writing().bulb.set_hsv(
                color_state.hsv().hue, color_state.hsv().saturation as u8, 
                s.reading().get_cur_transition_effect(), s.reading().get_cur_transition_duration()
            ))
        );
        res
    }

    async fn set_animation_state(
        self: Arc<Self>, data: DeviceStateProvider, animation_state: AnimationState
    ) -> DeviceActionResultWrapped {
        let s = RwLockProvider::new(&self);
        let res = s.reading().get_processed_response(
            data.state_or_default(), 
            block_on(s.writing().bulb.set_scene(Class::Color, 100, 100, 100))
        );
        res
    }

    async fn set_direct_mode_state(
        self: Arc<Self>, data: DeviceStateProvider, direct_mode_state: DirectModeState
    ) -> DeviceActionResultWrapped {
        let connection = direct_mode_state.connection_addr.ip_v4;
        let s = RwLockProvider::new(&self);
        let state = data.state_or_default();
        let res = s.reading().get_processed_response(
            state.clone(), 
            block_on(s.writing().bulb.set_music(
                Switch::from(state.running_mode == RunningMode::DirectMode).into(), 
                &*connection.get_str_ip(), connection.get_port()
            ))
        );
        res
    }

    async fn get_current_state(
        self: Arc<Self>, data: DeviceStateProvider
    ) -> DeviceMetaActionResultWrapped<DeviceState> {
        let s = RwLockProvider::new(&self);
        let res = block_on(s.writing().bulb.get_prop(&Properties(Vec::from(BULB_PROPS))));
        Arc::new(Ok(DeviceMetaActionResult::new(data.state_or_default()).update_with(match res {
            Ok(Some(dt)) => {
                let state = Arc::new(YeelightImpl::props_to_device_state(zip(BULB_PROPS.iter(), dt.iter())));
                DeviceResult::Ok(state, String::from(stringify!(dt)))
            },
            Ok(None) => DeviceResult::Err(Arc::new(()), DeviceError::Unknowm),
            Err(err) => DeviceResult::Err(Arc::new(()), DeviceError::from(err)),
        })))
    }

}

#[async_trait(?Send)]
impl DeviceImplBuilder for YeelightImpl {

    async fn connect<'a>(connection_config: ConnectionConfig) -> DeviceConnectionResult<Box<dyn DeviceImplRaw>> {
        let ip = connection_config.ip_v4;
        let result = Bulb::connect(&ip.get_str_ip(), ip.get_port()).await;
        match result {
            Ok(bulb) => DeviceConnectionResult::Ok(
                Box::new(YeelightImpl {
                    bulb,
                    connection: connection_config,
                    current_transition: Default::default()
                }), 
                DeviceId {
                    device_type: DeviceType::Bulb,
                    device_impl: DeviceImpl::Yeelight,
                    device_variant: DeviceVariant::Rgb
                }, 
                ""
            ),
            Err(err) => DeviceConnectionResult::Err(
                DeviceConnectionError::Generic(anyhow::Error::msg(format!("{}", err)))
            ),
        }
    }

}

impl DeviceImplRaw for YeelightImpl {
    fn for_using(self: Box<Self>) -> Arc<dyn DeviceImplInterface> {
        Arc::new(RwLock::new(*self))
    }
}

impl YeelightImpl {

    async fn new() -> ActionResult<Self> {
        let connection = NULL_IPV4_CONNECTION.clone();
        let bulb = Bulb::connect(&*connection.get_str_ip(), connection.get_port()).await;
        match bulb {
            Ok(bulb) => ActionResult::Ok(Self { 
                bulb,
                connection: ConnectionConfig {
                    ip_v4: connection
                },
                current_transition: DEFAULT_TRANSITION,
            }),
            Err(err) => ActionResult::Err(
                Box::new(GenericError::from(&err))
            ),
        }
    }

    fn get_cur_transition_effect(&self) -> Effect {
        match self.current_transition.effect {
            TransitionEffect::Smooth => Effect::Smooth,
            TransitionEffect::Sudden => Effect::Sudden,
        }
    }

    fn get_cur_transition_duration(&self) -> Duration {
        self.current_transition.duration
    }

    fn props_to_device_state<'device_state>(
        props_to_values: Zip<Iter<Property>, Iter<String>>
    ) -> DeviceState {
        let p = |s: &String| s.parse::<u16>().expect("");
        let to_switch = |s: &String| match s.as_str() {
            "on" => Switch::On,
            "off" => Switch::Off,
            _ => unreachable!()
        };
        let mut builder = DeviceStateBuilder::default();

        // First pass: collect changes to DeviceState
        for pair in props_to_values {
            match pair {
                (Property::Power, dt) => builder = builder.power_state(to_switch(dt)),
                (Property::Bright, dt) => builder = builder.color_brightness(dt.parse().unwrap()),
                (Property::CT, dt) => builder = builder.color_ct_temperature(p(dt)),
                (Property::RGB, dt) => {
                    let val = p(dt);
                    builder = builder.color_rgb((
                        ((val - val % (16 ^ 4)) / (16 ^ 6)) as u8,
                        ((val - val % (16 ^ 2)) / (16 ^ 4)) as u8,
                        (val / (16 ^ 2)) as u8
                    ));
                },
                (Property::Hue, dt) => builder = builder.color_hsv_hue(p(dt)),
                (Property::Sat, dt) => builder = builder.color_hsv_saturation(p(dt)),
                (Property::ColorMode, dt) => builder = builder.color_mode(match dt.as_str() {
                    "1" => ColorMode::RGB,
                    "2" => ColorMode::CT,
                    "3" => ColorMode::HSV,
                    _ => unreachable!()
                }),
                //Property::Flowing,
                //Property::DelayOff,
                //Property::FlowParams,
                (Property::MusicOn, dt) if to_switch(dt) == Switch::On => {
                    builder = builder.running_mode(RunningMode::DirectMode);
                },
                //Property::Name,
                //Property::BgPower,
                //Property::BgFlowing,
                //Property::BgFlowParams,
                //Property::BgCT,
                //Property::BgColorMode,
                //Property::BgBright,
                //Property::BgRGB,
                //Property::BgHue,
                //Property::BgSat,
                //Property::NightLightBright,
                //Property::ActiveMode ,
                _ => ()
            };
        }
        builder.build()
    }

    fn get_processed_response(
        &self, state: Arc<DeviceState>, 
        result: Result<Option<Response>, BulbError>,
    ) -> DeviceActionResultWrapped {
        Arc::new(Ok(DeviceActionResult::new(state.clone()).update_with(match result {
            Ok(_dt) => DeviceResult::Ok(state.clone(), String::from(stringify!(_dt))),
            Err(err) => DeviceResult::Err(state, DeviceError::from(err))
        })))
    }
}

impl Debug for YeelightImpl {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        f.debug_struct("Yeelight").finish()
    }
}

impl Into<MusicAction> for Switch {
    fn into(self) -> MusicAction {
        match self {
            Switch::On => MusicAction::On,
            Switch::Off => MusicAction::Off,
        }
    }
}

impl From<Switch> for Power {
    fn from(s: Switch) -> Self {
        match s {
            Switch::On => Power::On,
            Switch::Off => Power::Off,
        }
    }
}

impl From<BulbError> for DeviceError {
    fn from(err: BulbError) -> Self {
        match err {
            BulbError::IO(err) => DeviceError::IO(DeviceIOError::from(err)),
            BulbError::ErrResponse(status, data) => DeviceError::ErrResponse(status, data),
            BulbError::Recv(err) => DeviceError::Recv(err),
        }
    }
}

const BULB_PROPS: [Property; 23] = [
    Property::Power,
    Property::Bright,
    Property::CT,
    Property::RGB,
    Property::Hue,
    Property::Sat,
    Property::ColorMode,
    Property::Flowing,
    Property::DelayOff,
    Property::FlowParams,
    Property::MusicOn,
    Property::Name,
    Property::BgPower,
    Property::BgFlowing,
    Property::BgFlowParams,
    Property::BgCT,
    Property::BgColorMode,
    Property::BgBright,
    Property::BgRGB,
    Property::BgHue,
    Property::BgSat,
    Property::NightLightBright,
    Property::ActiveMode,
];
