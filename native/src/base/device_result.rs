use std::{ 
    io,
    fmt::Display, sync::Arc,
};

use super::data::{
    device_result::{ DeviceActionResult, DeviceResult, DeviceError, DeviceIOError, DeviceActionResultMeta, DeviceMetaActionResult, DeviceStatusResult, DeviceResultState, DeviceResultCode }, 
    device_state::DeviceState
};

impl DeviceActionResultMeta {
    pub fn update_with(&mut self, result: DeviceStatusResult) -> &mut Self {
        self.is_done = true;
        match result {
            DeviceStatusResult::Ok(msg) => {
                self.set_success(msg);
            },
            DeviceStatusResult::Err(err) => {
                self.set_fail(err);
            }
        };
        self
    }

    fn set_success(&mut self, msg: String) {
        self.had_success = true;
        self.message = msg;
    }

    fn set_fail(&mut self, err: DeviceError) {
        self.had_success = false;
        self.message = err.to_string();
        self.code = DeviceResultCode::DeviceError;
        self.error = Some(err);
    }
}

pub trait ResultBuildble<T, S> {
    fn new(state: Arc<DeviceState>) -> Self;
    fn update_with(self, result: DeviceResult<T, S>) -> Self;
}

impl ResultBuildble<DeviceState, DeviceState> for DeviceActionResult {
    fn new(state: Arc<DeviceState>) -> Self {
        Self {
            previous_state: state.clone(),
            ..Self::default()
        }
    }

    fn update_with(mut self, result: DeviceResultState) -> Self {
        self.status.update_with(DeviceStatusResult::from(&result));
        self.current_state = Some(match result {
            DeviceResult::Ok(ref s, _) => s.clone(),
            DeviceResult::Err(ref s, _) => s.clone(),
            DeviceResult::Undefined => unreachable!(),
        });
        self
    }

}

impl<T> ResultBuildble<T, ()> for DeviceMetaActionResult<T> {
    fn new(_: Arc<DeviceState>) -> Self {
        Self {
            status: DeviceActionResultMeta::default(),
            data: Option::None,
        }
    }

    fn update_with<'a>(mut self, result: DeviceResult<T, ()>) -> Self {
        self.status.update_with(DeviceStatusResult::from(&result));
        if let DeviceResult::Ok(s, _) = result {
            self.data = Some(s);
        }
        self
    }
}

impl<T, S> From<&DeviceResult<T, S>> for DeviceStatusResult {
    fn from(res: &DeviceResult<T, S>) -> Self {
        match res {
            DeviceResult::Ok(_, ref r) => DeviceStatusResult::Ok(r.clone()),
            DeviceResult::Err(_, ref r) => DeviceStatusResult::Err(r.clone()),
            DeviceResult::Undefined => unreachable!(),
        }
    }
}

impl DeviceIOError {
    pub fn from(err: io::Error) -> Self {
        if let Some(code) = err.raw_os_error() {
            DeviceIOError::Os(code)
        } else {
            DeviceIOError::Simple(err.kind())
        }
    }
}

impl Display for DeviceError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            DeviceError::IO(e) => write!(f, "IOError({})", match e {
                DeviceIOError::Os(e) => format!("OS({})", e),
                DeviceIOError::Simple(e) => format!("Simple({})", e),
            }),
            DeviceError::ErrResponse(status, msg) => 
                write!(f, "ResponseError(({}) => {})", status, msg),
            DeviceError::Recv(_) => write!(f, "RecvError({})", stringify!(_)),
            DeviceError::Unknown => write!(f, "Unknowm Error"),
        }
        
    }
}
