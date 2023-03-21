use std::{ sync::Arc, fmt::Display, io::ErrorKind };
use thiserror::Error as ThisError;
use tokio::sync::{ oneshot::error::RecvError };

use super::{
    device_state::DeviceState, 
    common::ActionResult, 
    device_metadata::{
        DeviceId, 
        DeviceData, 
        DeviceImpl
    }
};

#[derive(Default, Debug, Clone, Copy)]
pub enum DeviceResultCode {
    #[default] Ok,
    ConnectionError,
    DeviceError,
    RequestError
}

#[derive(ThisError, Debug, Clone)]
pub enum DeviceError {
    Unknown,
    IO(DeviceIOError),
    ErrResponse(i32, String),
    Recv(RecvError),
}

#[derive(Debug, Clone, Copy)]
pub enum DeviceIOError {
    Os(i32),
    Simple(ErrorKind)
}

#[derive(Debug, Default, Clone)]
pub enum DeviceResult<T, S> {
    #[default] Undefined,
    Ok(Arc<T>, String),
    Err(Arc<S>, DeviceError)
}

pub type DeviceResultState = DeviceResult<DeviceState, DeviceState>;

#[derive(Debug, Clone)]
pub enum DeviceStatusResult {
    Ok(String),
    Err(DeviceError)
}

#[derive(Default, Debug, Clone)]
pub struct DeviceActionResultMeta {
    pub is_done: bool,
    pub had_success: bool,
    pub code: DeviceResultCode,
    pub message: String,
    pub error: Option<DeviceError>,
}

#[derive(Default, Debug)]
pub struct DeviceActionResult {
    pub status: DeviceActionResultMeta, 
    pub previous_state: Arc<DeviceState>,
    pub current_state: Option<Arc<DeviceState>>,
}

#[derive(Debug, Clone)]
pub enum DeviceDetectResult {
    Ok(Arc<DeviceData>),
    Error(Vec<DeviceDetectErrorItem>)
}

#[derive(Debug, Clone)]
pub struct DeviceDetectErrorItem(pub DeviceImpl, pub String);

pub type DeviceActionResultWrapped = Arc<ActionResult<DeviceActionResult>>;

#[derive(Default, Debug)]
pub struct DeviceMetaActionResult<T> {
    pub status: DeviceActionResultMeta,
    pub data: Option<Arc<T>>,
}

pub type DeviceMetaActionResultWrapped<T> = Arc<ActionResult<DeviceMetaActionResult<T>>>;

#[derive(Default, Debug)]
pub enum DeviceConnectionResult<T> {
    #[default] Pending,
    Ok(T, DeviceId, &'static str),
    Err(DeviceConnectionError),
}

#[derive(Default, Debug, ThisError)]
pub enum DeviceConnectionError {
    #[default] Unknown,
    Generic(anyhow::Error)
}

impl Display for DeviceConnectionError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            DeviceConnectionError::Generic(e) => write!(f, "{}", e),
            DeviceConnectionError::Unknown => write!(f, "Unknown"),
        }
    }
}