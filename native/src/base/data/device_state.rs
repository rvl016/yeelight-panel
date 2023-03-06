use serde::{ Serialize, Deserialize };
use super::{ common::{Switch, Record}, device_metadata::ConnectionConfig };

#[derive(Default, Debug, Clone, Serialize, Deserialize)]
pub struct DeviceState {
    pub id: String,
    pub config: ConnectionConfig,
    pub power_state: Switch,
    pub running_mode: RunningMode,
    _states: States
}

impl Record for DeviceState {
    fn id(&self) -> String {
        self.id.clone()
    }
}

#[derive(Default, Debug, Copy, Clone, Serialize, Deserialize)]
struct States {
    pub color: ColorState,
    pub animation: AnimationState,
    pub direct: DirectModeState,
}

#[derive(Default, Debug, Copy, Clone)]
pub enum RunningState<'device_state> {
    #[default] None,
    Color(&'device_state ColorState),
    Animation(&'device_state AnimationState),
    DirectMode(&'device_state DirectModeState)
}

#[derive(Default, Debug, Copy, Clone, PartialEq, Eq, Serialize, Deserialize)]
pub enum RunningMode {
    #[default] None,
    Color,
    Animation,
    DirectMode
}

#[derive(Default, Debug, Clone, Copy, Serialize, Deserialize)]
pub struct DirectModeState {
    pub connection_addr: ConnectionConfig,
}

#[derive(Default, Debug, Clone, Copy, Serialize, Deserialize)]
pub struct AnimationState {

}

#[derive(Default, Debug, Clone, Copy, Serialize, Deserialize)]
pub struct HSV {
    pub hue: u16,
    pub saturation: u16,
}

#[derive(Default, Debug, Clone, Copy, Serialize, Deserialize)]
pub struct RGB {
    pub rgb: (u8, u8, u8),
}

#[derive(Default, Debug, Clone, Copy, Serialize, Deserialize)]
pub struct CT {
    pub temperature: u16,
}

#[derive(Default, Debug, Copy, Clone, Serialize, Deserialize)]
pub struct ColorState {
    pub brightness: u8,
    pub color_mode: ColorMode,
    _colors: Colors,
}

#[derive(Default, Debug, Clone, Copy)]
pub enum Color<'color_state> {
    #[default] None,
    HSV(&'color_state HSV),
    RGB(&'color_state RGB),
    CT(&'color_state CT)
}

#[derive(Default, Debug, Clone, Copy, Serialize, Deserialize)]
pub enum ColorMode {
    #[default] None,
    HSV,
    RGB,
    CT
}

#[derive(Default, Debug, Clone, Copy, Serialize, Deserialize)]
struct Colors {
    pub hsv: HSV,
    pub rgb: RGB,
    pub ct: CT
}

#[derive(Debug, Default)]
pub struct DeviceStateBuilder {
    power_state: Option<Switch>,
    color_brightness: Option<u8>,
    color_ct_temperature: Option<u16>,
    color_rgb: Option<(u8, u8, u8)>,
    color_hsv_hue: Option<u16>,
    color_hsv_saturation: Option<u16>,
    color_mode: Option<ColorMode>,
    running_mode: Option<RunningMode>,
}

impl DeviceStateBuilder {

    pub fn power_state(mut self, dt: Switch) -> Self {
        self.power_state = Some(dt);
        self
    }

    pub fn color_brightness(mut self, dt: u8) -> Self {
        self.color_brightness = Some(dt);
        self
    }

    pub fn color_ct_temperature(mut self, dt: u16) -> Self {
        self.color_ct_temperature = Some(dt);
        self
    }

    pub fn color_rgb(mut self, dt: (u8, u8, u8)) -> Self {
        self.color_rgb = Some(dt);
        self
    }

    pub fn color_hsv_hue(mut self, dt: u16) -> Self {
        self.color_hsv_hue = Some(dt);
        self
    }

    pub fn color_hsv_saturation(mut self, dt: u16) -> Self {
        self.color_hsv_saturation = Some(dt);
        self
    }

    pub fn color_mode(mut self, dt: ColorMode) -> Self {
        self.color_mode = Some(dt);
        self
    }

    pub fn running_mode(mut self, dt: RunningMode) -> Self {
        self.running_mode = Some(dt);
        self
    }

    pub fn build(self) -> DeviceState {
        let hsv = HSV {
            hue: self.color_hsv_hue.unwrap_or_default(),
            saturation: self.color_hsv_saturation.unwrap_or_default(),
        };
        let rgb = RGB {
            rgb: self.color_rgb.unwrap_or_default(),
        };
        let ct = CT {
            temperature: self.color_ct_temperature.unwrap_or_default(),
        };
        let color_state = ColorState {
            brightness: self.color_brightness.unwrap_or_default(),
            color_mode: self.color_mode.unwrap_or_default(),
            _colors: Colors { hsv, rgb, ct },
        };
        let animation_state = AnimationState {};
        let direct_state = DirectModeState { 
            connection_addr: Default::default()
        };
        DeviceState { 
            power_state: self.power_state.unwrap_or_default(), 
            running_mode: self.running_mode.unwrap_or_default(),
            _states: States { 
                color: color_state, 
                animation: animation_state, 
                direct: direct_state 
            },
            ..Default::default() 
        }
    }

}


impl DeviceState {
    pub fn color_state(&mut self) -> &mut ColorState {
        &mut self._states.color
    }

    pub fn animation_state(&mut self) -> &mut AnimationState {
        &mut self._states.animation
    }

    pub fn direct_state(&mut self) -> &mut DirectModeState {
        &mut self._states.direct
    }

    pub fn running_state(&self) -> RunningState {
        match self.running_mode {
            RunningMode::None => RunningState::None,
            RunningMode::Color => RunningState::Color(&self._states.color),
            RunningMode::Animation => RunningState::Animation(&self._states.animation),
            RunningMode::DirectMode => RunningState::DirectMode(&self._states.direct),
        }
    }

}

impl ColorState {
    pub fn rgb(&mut self) -> &RGB {
        &mut self._colors.rgb
    }

    pub fn hsv(&self) -> &HSV {
        &self._colors.hsv
    }

    pub fn ct(&self) -> &CT {
        &self._colors.ct
    }

    pub fn color(&self) -> Color {
        match self.color_mode {
            ColorMode::None => Color::None,
            ColorMode::HSV => Color::HSV(&self._colors.hsv),
            ColorMode::RGB => Color::RGB(&self._colors.rgb),
            ColorMode::CT => Color::CT(&self._colors.ct),
        }
    }
}
