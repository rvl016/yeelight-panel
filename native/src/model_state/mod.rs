use std::{path::Path, sync::Arc, iter::Map, collections::{HashMap, hash_map}, fmt::Debug, borrow::BorrowMut};
use pickledb::PickleDb;
use serde::Serialize;
use strum::{ EnumIter, IntoEnumIterator };

use crate::base::data::{device_metadata::{DeviceType, DeviceCommandCapability, DeviceData}, common::{IPv4Connection, Switch, Record}, device_state::{ColorState, HSV, RGB, CT, DeviceState}};

pub mod database;


pub struct Storage {
    db: PickleDb,
    devices: StorageRecords<DeviceData>,
    devices_state: StorageRecords<DeviceState>
}

impl Debug for Storage {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        f.debug_struct("Storage").field("devices", &self.devices).finish()
    }
}

impl Default for Storage {
    fn default() -> Self {
        Self {
            db: PickleDb::new(
                "storage.db", 
                pickledb::PickleDbDumpPolicy::AutoDump, 
                pickledb::SerializationMethod::Json
            ),
            devices: StorageRecords::empty(),
            devices_state: StorageRecords::empty(),
        }
    }
}

impl Storage {

    pub fn load(&mut self) {
        self.db.iter();
        for kv in self.db.iter() {
            match Field::from(kv.get_key()) {
                Field::Devices => self.devices = StorageRecords::from(kv.get_value::<Vec<DeviceData>>().unwrap()),
                Field::DevicesState => 
                    self.devices_state = StorageRecords::from(kv.get_value::<Vec<DeviceState>>().unwrap()),
            }
        }
    }

    pub fn save(&mut self) {
        Field::iter().for_each(|f| self.save_field(f))
    }

    pub fn add(&mut self, field: AppendInField) -> AddedValue {
        match field {
            AppendInField::Device(v) => AddedValue::Device(self.devices.set(v)),
            AppendInField::DeviceState(v) => AddedValue::DeviceState(self.devices_state.set(v)),
        }
    }

    pub fn remove(&mut self, field: RemoveInField) {
        match field {
            RemoveInField::Device(v) => self.devices.remove(v.as_str()),
            RemoveInField::DeviceState(v) => self.devices_state.remove(v.as_str()),
        };
    }

    pub fn get(&mut self, field: Field) -> StorageField {
        match field {
            Field::Devices => StorageField::Devices(&mut self.devices),
            Field::DevicesState => StorageField::DevicesState(&mut self.devices_state),
        }
    }

    fn save_field(&mut self, field: Field) {
        match field {
            Field::Devices => self.db.set(field.into(), &self.devices.values()).expect("DB Error"),
            Field::DevicesState => self.db.set(field.into(), &self.devices_state.values()).expect("DB Error"),
        };
    }

}

pub enum StorageField<'a> {
    Devices(&'a mut StorageRecords<DeviceData>),
    DevicesState(&'a mut StorageRecords<DeviceState>),
}

pub enum AppendInField {
    Device(DeviceData),
    DeviceState(DeviceState),
}

pub enum RemoveInField {
    Device(String),
    DeviceState(String),
}

#[derive(Debug, EnumIter, Clone, Copy)]
pub enum Field {
    Devices,
    DevicesState,
}

pub enum AddedValue {
    Device(Arc<DeviceData>),
    DeviceState(Arc<DeviceState>),
}

const DEVICE_KEY: &str = "devices";
const DEVICE_STATE_KEY: &str = "devices_state";

impl From<Field> for &str {

    fn from(f: Field) -> Self {
        match f {
            Field::Devices => DEVICE_KEY,
            Field::DevicesState => DEVICE_STATE_KEY,
        }
    }
}

impl From<&str> for Field {
    fn from(f: &str) -> Self {
        match f {
            DEVICE_KEY => Field::Devices,
            DEVICE_STATE_KEY => Field::DevicesState,
            _ => unreachable!()
        }
    }
}

#[derive(Debug)]
pub struct StorageRecords<T: Record + Clone> {
    data: HashMap<String, Arc<T>>,
}

impl<T: Record + Clone> StorageRecords<T> {
    pub fn empty() -> Self {
        Self {
            data: HashMap::new()
        }
    }

    pub fn values(&self) -> Vec<&T> {
        self.data.iter().map(|(_, v)| v.as_ref()).collect()
    }

    pub fn get(&mut self, id: &str) -> Arc<T> {
        self.data.get(id).unwrap().clone()
    }

    pub fn set(&mut self, record: T) -> Arc<T> {
        let id = record.id();
        let record = Arc::new(record);
        self.data.insert(record.id(), record);
        self.data.get(id.as_str()).unwrap().clone()
    }

    pub fn remove(&mut self, id: &str) {
        self.data.remove(id);
    }
}

impl<T: Record + Clone> From<Vec<T>> for StorageRecords<T> {
    fn from(values: Vec<T>) -> Self {
        Self {
            data: values.into_iter().map(|v| (v.id(), Arc::new(v))).collect()
        }
    }
}