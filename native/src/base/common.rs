use std::{ error::Error, fmt, io::ErrorKind, sync::Arc };

use rand::{Rng, distributions::Alphanumeric};
use tokio::sync::{RwLock, RwLockReadGuard, RwLockWriteGuard};

use super::data::common::{GenericError};


impl From<Box<dyn Error>> for GenericError {
    fn from(e: Box<dyn Error>) -> GenericError {
        GenericError::new(ErrorKind::Other, String::from(format!("{}", e)))
    }
}

impl fmt::Display for GenericError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{:?}: {}", self.kind, self.message)
    }
}

impl Error for GenericError {}


pub fn make_id() -> String {
    rand::thread_rng().sample_iter(&Alphanumeric).take(16).map(char::from).collect()
}
