use super::*;
// Section: wire functions

#[no_mangle]
pub extern "C" fn wire_platform(port_: i64) {
    wire_platform_impl(port_)
}

#[no_mangle]
pub extern "C" fn wire_rust_release_mode(port_: i64) {
    wire_rust_release_mode_impl(port_)
}

#[no_mangle]
pub extern "C" fn wire_init_app(port_: i64) {
    wire_init_app_impl(port_)
}

#[no_mangle]
pub extern "C" fn wire_get_stored_devices(port_: i64) {
    wire_get_stored_devices_impl(port_)
}

#[no_mangle]
pub extern "C" fn wire_detect_new_device(
    port_: i64,
    device_name: *mut wire_uint_8_list,
    connection: *mut wire_ConnectionConfigInterface,
) {
    wire_detect_new_device_impl(port_, device_name, connection)
}

#[no_mangle]
pub extern "C" fn wire_get_devices_for_using(port_: i64) {
    wire_get_devices_for_using_impl(port_)
}

#[no_mangle]
pub extern "C" fn wire_get_device_state(port_: i64, device_id: *mut wire_uint_8_list) {
    wire_get_device_state_impl(port_, device_id)
}

// Section: allocate functions

#[no_mangle]
pub extern "C" fn new_box_autoadd_connection_config_interface_0(
) -> *mut wire_ConnectionConfigInterface {
    support::new_leak_box_ptr(wire_ConnectionConfigInterface::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_i_pv_4_connection_inteface_0() -> *mut wire_IPv4ConnectionInteface {
    support::new_leak_box_ptr(wire_IPv4ConnectionInteface::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_uint_8_list_0(len: i32) -> *mut wire_uint_8_list {
    let ans = wire_uint_8_list {
        ptr: support::new_leak_vec_ptr(Default::default(), len),
        len,
    };
    support::new_leak_box_ptr(ans)
}

// Section: related functions

// Section: impl Wire2Api

impl Wire2Api<String> for *mut wire_uint_8_list {
    fn wire2api(self) -> String {
        let vec: Vec<u8> = self.wire2api();
        String::from_utf8_lossy(&vec).into_owned()
    }
}
impl Wire2Api<ConnectionConfigInterface> for *mut wire_ConnectionConfigInterface {
    fn wire2api(self) -> ConnectionConfigInterface {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<ConnectionConfigInterface>::wire2api(*wrap).into()
    }
}
impl Wire2Api<Box<IPv4ConnectionInteface>> for *mut wire_IPv4ConnectionInteface {
    fn wire2api(self) -> Box<IPv4ConnectionInteface> {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<IPv4ConnectionInteface>::wire2api(*wrap).into()
    }
}
impl Wire2Api<ConnectionConfigInterface> for wire_ConnectionConfigInterface {
    fn wire2api(self) -> ConnectionConfigInterface {
        ConnectionConfigInterface {
            ip_v4: self.ip_v4.wire2api(),
        }
    }
}
impl Wire2Api<IPv4ConnectionInteface> for wire_IPv4ConnectionInteface {
    fn wire2api(self) -> IPv4ConnectionInteface {
        IPv4ConnectionInteface {
            ip: self.ip.wire2api(),
            port: self.port.wire2api(),
        }
    }
}

impl Wire2Api<[u8; 4]> for *mut wire_uint_8_list {
    fn wire2api(self) -> [u8; 4] {
        let vec: Vec<u8> = self.wire2api();
        support::from_vec_to_array(vec)
    }
}
impl Wire2Api<Vec<u8>> for *mut wire_uint_8_list {
    fn wire2api(self) -> Vec<u8> {
        unsafe {
            let wrap = support::box_from_leak_ptr(self);
            support::vec_from_leak_ptr(wrap.ptr, wrap.len)
        }
    }
}
// Section: wire structs

#[repr(C)]
#[derive(Clone)]
pub struct wire_ConnectionConfigInterface {
    ip_v4: *mut wire_IPv4ConnectionInteface,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_IPv4ConnectionInteface {
    ip: *mut wire_uint_8_list,
    port: u16,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_uint_8_list {
    ptr: *mut u8,
    len: i32,
}

// Section: impl NewWithNullPtr

pub trait NewWithNullPtr {
    fn new_with_null_ptr() -> Self;
}

impl<T> NewWithNullPtr for *mut T {
    fn new_with_null_ptr() -> Self {
        std::ptr::null_mut()
    }
}

impl NewWithNullPtr for wire_ConnectionConfigInterface {
    fn new_with_null_ptr() -> Self {
        Self {
            ip_v4: core::ptr::null_mut(),
        }
    }
}

impl Default for wire_ConnectionConfigInterface {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_IPv4ConnectionInteface {
    fn new_with_null_ptr() -> Self {
        Self {
            ip: core::ptr::null_mut(),
            port: Default::default(),
        }
    }
}

impl Default for wire_IPv4ConnectionInteface {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

// Section: sync execution mode utility

#[no_mangle]
pub extern "C" fn free_WireSyncReturn(ptr: support::WireSyncReturn) {
    unsafe {
        let _ = support::box_from_leak_ptr(ptr);
    };
}
