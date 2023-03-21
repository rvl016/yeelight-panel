use std::{path::Path, sync::Arc, iter::Map, collections::{HashMap, hash_map}, fmt::Debug, borrow::BorrowMut};
use pickledb::PickleDb;
use serde::Serialize;
use strum::{ EnumIter, IntoEnumIterator };

use crate::{base::{data::{device_metadata::{DeviceType, DeviceCommandCapability, DeviceData, DeviceImpl, Device}, common::{IPv4Connection, Switch, Record}, device_state::{ColorState, HSV, RGB, CT, DeviceState}}, common::make_id}, get_app};

pub mod database;


pub struct Storage {
    db: PickleDb,
    devices: StorageRecords<DeviceData>,
    devices_state: StorageRecords<DeviceState>,
    connected_devices: Vec<Device>,
    device_groups: Vec<Vec<String>>,
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
            connected_devices: vec![],
            device_groups: vec![],
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

    pub fn add(&mut self, field: AppendInField) -> FieldRecord {
        match field {
            AppendInField::Device(v) => FieldRecord::Device(self.devices.set(v)),
            AppendInField::DeviceState(v) => FieldRecord::DeviceState(self.devices_state.set(v)),
        }
    }

    pub fn remove(&mut self, field: FieldId) {
        match field {
            FieldId::Device(v) => self.devices.remove(v.as_str()),
            FieldId::DeviceState(v) => self.devices_state.remove(v.as_str()),
        };
    }

    pub fn get(&mut self, field: Field) -> StorageField {
        match field {
            Field::Devices => StorageField::Devices(&mut self.devices),
            Field::DevicesState => StorageField::DevicesState(&mut self.devices_state),
        }
    }

    pub fn get_by_id(&mut self, field: FieldId) -> Option<FieldRecord> {
        match field {
            FieldId::Device(id) => self.found_object_to_field_record(
                id, &self.devices.data, |f| FieldRecord::Device(f.clone())
            ),
            FieldId::DeviceState(id) => self.found_object_to_field_record(
                id, &self.devices_state.data, |f| FieldRecord::DeviceState(f.clone())
            ),
        }
    }

    fn save_field(&mut self, field: Field) {
        match field {
            Field::Devices => self.db.set(field.into(), &self.devices.values()).expect("DB Error"),
            Field::DevicesState => self.db.set(field.into(), &self.devices_state.values()).expect("DB Error"),
        };
    }

    fn found_object_to_field_record<T>(
        &self, id: String, id_to_record: &HashMap<String, Arc<T>>, 
        into_field: impl FnOnce(&Arc<T>) -> FieldRecord
    ) -> Option<FieldRecord> {
        id_to_record.get(id.as_str()).map(into_field)
    }
}


pub struct StorageOperator<'op> {
    pub storage: &'op mut Storage
}

impl<'op> StorageOperator<'op> {

    pub fn new(storage: &'op mut Storage) -> Self { Self { storage } }

    pub fn get_state_by_device_id(&mut self, dev_id: String) -> Arc<DeviceState> {
        match self.storage.get_by_id(FieldId::DeviceState(dev_id)) {
            Some(r) => match r {
                FieldRecord::DeviceState(state) => state,
                _ => unreachable!()
            },
            None => unreachable!("Device State not Found"),
        }
    }

    pub fn get_stored_devices(&mut self) -> Vec<Arc<DeviceData>> {
        match self.storage.get(Field::Devices) {
            StorageField::Devices(devs) => devs.data.iter().map(|(_, v)| v.clone()).collect(),
            _ => unreachable!(),
        }   
    }

    pub fn get_device_by_id(&mut self, dev_id: String) -> Arc<DeviceData> {
        match self.storage.get_by_id(FieldId::Device(dev_id)) {
            Some(r) => match r {
                FieldRecord::Device(device) => device,
                _ => unreachable!()
            },
            None => unreachable!("Device not Found"),
        }
    }

    pub fn add_device(&mut self, device: DeviceData) -> Arc<DeviceData> {
        match self.storage.add(
            AppendInField::Device(device)
        ) {
            FieldRecord::Device(dt) => dt,
            _ => unreachable!(),
        }
    }

    pub fn add_device_state(&mut self, state: DeviceState) -> Arc<DeviceState> {
        match self.storage.add(
            AppendInField::DeviceState(state)
        ) {
            FieldRecord::DeviceState(dt) => dt,
            _ => unreachable!(),
        }
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

pub enum FieldId {
    Device(String),
    DeviceState(String),
}

#[derive(Debug, EnumIter, Clone, Copy)]
pub enum Field {
    Devices,
    DevicesState,
}

impl From<FieldId> for Field {
    fn from(f: FieldId) -> Self {
        match f {
            FieldId::Device(_) => Field::Devices,
            FieldId::DeviceState(_) => Field::DevicesState,
        }
    }
}

pub enum FieldRecord {
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