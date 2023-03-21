use lazy_static::lazy_static;

use model_state::Storage;
use tokio::sync::{Mutex, MutexGuard};

mod api;
mod bridge_generated;
mod base;
mod device;
mod devices_impl;
mod model_state;
mod actions;
mod streams;

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

pub async fn get_app() -> MutexGuard<'static, App> {
    APP.lock().await
}

#[cfg(test)]
mod tests {
    use std::{thread::sleep, time::Duration};

    use crate::{api::{detect_new_device, ConnectionConfigInterface, IPv4ConnectionInteface, get_devices_for_using, init_app, set_ct, CTInterface, get_device_state, sync_device_state, set_color_mode}, base::data::{device_state::{ColorMode, CT}, device_metadata::{Device, ConnectionConfig}, common::IPv4Connection}, actions, get_app, model_state::StorageOperator, devices_impl::impl_switch};

    #[test]
    fn it_creates_device_and_allows_later_fetch_for_using() {
        init_app();
        assert_eq!(get_devices_for_using().len(), 0);
        assert!(match detect_new_device(String::from("Yeelight"), ConnectionConfigInterface {
            ip_v4: Box::new(IPv4ConnectionInteface { ip: [192, 168, 0, 111], port: 0 })
        }) {
            crate::api::DeviceDetectResultInterface::Ok(_) => true,
            crate::api::DeviceDetectResultInterface::Error(_) => false,
        });
        //sleep(Duration::from_millis(200));
        assert_eq!(get_devices_for_using().len(), 1);
    }

    #[tokio::test]
    async fn it_creates_device_and_allows_later_fetch_for_using_inner() {
        _it_creates_device_and_allows_later_fetch_for_using_inner().await
    }

    async fn _it_creates_device_and_allows_later_fetch_for_using_inner() {
        let mut app = get_app().await;
        app.load_data();
        let storage = app.storage();
        let mut operator = StorageOperator::new(storage);
        assert_eq!(operator.get_stored_devices().len(), 0);
        
        assert!(match actions::ActionBinder::new(operator.storage).connect_device(
            String::from("Yeelight"), 
            ConnectionConfig { ip_v4: IPv4Connection { ip: (192, 168, 0, 111), port: 0 } }
        ).await {
            crate::base::data::device_result::DeviceDetectResult::Ok(_) => true,
            crate::base::data::device_result::DeviceDetectResult::Error(_) => false,
        });
        assert_eq!(operator.get_stored_devices().len(), 1);
    }

    #[test]
    fn it_can_change_device_ct() {
        it_creates_device_and_allows_later_fetch_for_using();
        let temp = 2200;
        let devs = get_devices_for_using();
        let dev = devs.get(0).unwrap();
        assert!(match set_color_mode(dev.id.clone(), ColorMode::CT) {
            crate::api::DeviceStateUpdateResult::Ok(_) => true,
            crate::api::DeviceStateUpdateResult::Err(e) => {
                e.message;
                false
            },
        });
        assert!(match set_ct(dev.id.clone(), CTInterface { temperature: temp }) {
            crate::api::DeviceStateUpdateResult::Ok(_) => true,
            crate::api::DeviceStateUpdateResult::Err(_) => false,
        });
        let dev_state = sync_device_state(dev.id.clone());
        assert!(match *dev_state.running_state {
            crate::api::RunningStateInterface::Color(c) => match *c.color {
                crate::api::ColorInterface::CT(ct) => ct.temperature == temp,
                _ => false
            },
            _ => false
        });
    }

    #[tokio::test]
    async fn it_can_change_device_ct_inner() {
        _it_creates_device_and_allows_later_fetch_for_using_inner().await;
        let mut app = get_app().await;
        let temp = 2200;
        let mut operator = StorageOperator::new(&mut app.storage);
        let devs = operator.get_stored_devices();
        let dev_data = devs.first().unwrap();
        let device = impl_switch::device_from_data(
            operator.get_device_by_id(dev_data.id.clone()), &mut operator
        ).await;
        assert!(actions::ActionBinder::new(operator.storage).on_color_mode_update(device.clone(), ColorMode::CT).await.is_ok());
        assert!(actions::ActionBinder::new(operator.storage).on_color_ct_update(device.clone(), CT { temperature: temp }).await.is_ok());
        let dev_state = match actions::ActionBinder::new(operator.storage).sync_device_state(device).await {
            Ok(d) => d,
            Err(err) => {
                panic!("");
            },
        };
        assert!(match dev_state.running_state() {
            crate::base::data::device_state::RunningState::Color(c) => match c.color() {
                crate::base::data::device_state::Color::CT(ct) => ct.temperature == temp,
                _ => false
            },
            _ => false
        });
    }
}