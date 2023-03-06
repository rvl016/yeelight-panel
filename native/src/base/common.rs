use std::{ io::ErrorKind, error::Error, fmt, sync::{Arc, RwLock, RwLockReadGuard, RwLockWriteGuard} };

use rand::{Rng, distributions::Alphanumeric};

use super::data::common::GenericError;


impl GenericError {
    fn new(kind: ErrorKind, message: &str) -> GenericError {
        GenericError {
            kind,
            message: message.to_owned(),
        }
    }
}

impl From<&Box<dyn Error>> for GenericError {
    fn from(e: &Box<dyn Error>) -> GenericError {
        GenericError::new(ErrorKind::Other, &format!("{}", e))
    }
}

impl fmt::Display for GenericError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{:?}: {}", self.kind, self.message)
    }
}

impl Error for GenericError {}


pub struct RwLockProvider<T> {
    data: Arc<RwLock<T>>,
}

impl<'data, T> RwLockProvider<T> {

    pub fn new(data: &Arc<RwLock<T>>) -> Self {
        Self { data: data.clone() }
    }

    pub fn reading(&'data self) -> RwLockReadGuard<'data, T> {
        self.data.read().unwrap()
    }

    pub fn writing(&'data self) -> RwLockWriteGuard<'data, T> {
        self.data.write().unwrap()
    }
}


pub fn make_id() -> String {
    rand::thread_rng().sample_iter(&Alphanumeric).take(16).map(char::from).collect()
}
