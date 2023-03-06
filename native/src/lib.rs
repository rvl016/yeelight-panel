use std::{cell::Cell, sync::{Mutex, MutexGuard}};
use futures::executor::block_on;
use lazy_static::lazy_static;

use base::{data::device_metadata::Device};
use model_state::Storage;

mod api;
mod bridge_generated;
mod base;
mod device;
mod devices_impl;
mod model_state;

#[derive(Default, Debug)]
pub struct App {
    storage: Storage
}

impl App {
    pub fn load_data(&mut self) {
        self.storage.load();
    }

    pub fn storage(&mut self) -> &mut Storage {
        &mut self.storage
    }
}

lazy_static! {
    static ref APP: Mutex<App> = Mutex::new(App::default());
}

pub fn get_app() -> MutexGuard<'static, App> {
    APP.lock().unwrap()
}
