use std::io::ErrorKind;
use serde::{Serialize, Deserialize};

#[derive(Clone, Debug)]
pub struct GenericError {
    pub kind: ErrorKind,
    pub message: String,
}

impl GenericError {
    pub fn new(kind: ErrorKind, msg: String) -> Self {
        Self {
            kind,
            message: msg
        }
    }
}

pub type ActionResult<T> = Result<T, GenericError>;

pub const NULL_IPV4_CONNECTION: IPv4Connection = IPv4Connection {
    ip: (0, 0, 0, 0),
    port: 0,
};

#[derive(Default, Debug, Clone, Copy, PartialEq, Eq, Serialize, Deserialize)]
pub struct IPv4Connection {
    pub ip: (u8, u8, u8, u8),
    pub port: u16,
}

impl IPv4Connection {
    pub fn get_str_ip(&self) -> String {
        let (ip0, ip1, ip2, ip3) = self.ip;
        format!("{ip0}.{ip1}.{ip2}.{ip3}")
    }

    pub fn get_port(&self) -> u16 {
        self.port
    }
}

#[derive(Debug, Default, Clone, Copy, PartialEq, Eq, Serialize, Deserialize)]
pub enum Switch {
    On,
    #[default] Off,
}

impl From<bool> for Switch {
    fn from(v: bool) -> Self {
        match v {
            true => Self::On,
            false => Self::Off,
        }
    }
}

pub trait Record {
    fn id(&self) -> String;
}
