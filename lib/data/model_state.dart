import 'dart:async';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:yeelight_panel/actions/data_binders.dart';
import 'package:yeelight_panel/ffi.dart';

import 'model/base.dart';

part 'model_state.freezed.dart';


class ModelState {
  final Rx<DataSourceApi> dataSource = DataSourceApi().obs;

  final Rx<ListPageState<DeviceDataInterface>> deviceTablePageState = ListPageState<DeviceDataInterface>().obs;
  final Rx<ListPageState<DeviceInterface>> statedDevicesPageState = ListPageState<DeviceInterface>().obs;
  final Rx<ListPageState<ProfileInterface>> mainPanelDeviceProfiles = ListPageState<ProfileInterface>().obs;
  final Rx<ListPageState<ProfileInterface>> mainPanelGroupProfiles = ListPageState<ProfileInterface>().obs;

  final List<StreamSubscription> _subscriptions = [];
  final Rx<ControlState> controlState = const ControlState.none().obs;

  ModelState() {
    _subscriptions.add(deviceTablePageState.value.items.listen((_) {
      statedDevicesPageState.value.markOutdated();
    }));
  }

  RxBool get isReady => dataSource.value.isReady;
  DeviceStateBinder get stateBinder => DeviceStateBinder(dataSource.value, controlState.value);

  void setCurrentBrightness(double brightness) {
    controlState.value.whenOrNull(
      //multi: (devices, state) => state,
      one: (device, state) => stateBinder.updateBrightness(brightness).then((value) => state.value = value),
    );
  }

  void setCurrentHsv(HSVInterface hsv) {
    controlState.value.whenOrNull(
      //multi: (devices, state) => state,
      one: (device, state) => stateBinder.updateHSV(hsv).then((value) => state.value = value),
    );
  }

  void setCurrentRGB(RGBInterface rgb) {
    controlState.value.whenOrNull(
      //multi: (devices, state) => state,
      one: (device, state) => stateBinder.updateRGB(rgb).then((value) => state.value = value),
    );
  }

  void setCurrentCt(CTInterface ct) {
    controlState.value.whenOrNull(
      //multi: (devices, state) => state,
      one: (device, state) => stateBinder.updateCT(ct).then(
        (value) => state.value = value
      ),
    );
  }

  void dispose() { 
    _subscriptions.map((s) => s.cancel()).toList(); 
  }
}


@freezed
class ControlState with _$ControlState {
  const factory ControlState.none() = ControlStateNone;
  const factory ControlState.one(
    Rxn<DeviceInterface> device,
    Rxn<DeviceStateInterface> state,
  ) = ControlStateOne;
  const factory ControlState.multi(
    RxList<DeviceInterface> devices,
    Rxn<DeviceStateInterface> state,
  ) = ControlStateMulti;
}

class ListPageState<T extends Data> {
  final RxList<Rx<T>> items = RxList.empty();
  final Rxn<T> selectedItem = Rxn();
  final RxBool doNeedFetch = true.obs;
  StreamSubscription<List<Rx<T>>>? _selectSubscription;

  Rx<T>? operator [](String id) => items.firstWhereOrNull((e) => e.value.id == id);
  
  void operator []=(String id, T value) {
    final val = this[id];
    if (val == null) {
      items.add(value.obs);
    } else {
      val.value = value;
    }
  }

  void markOutdated() {
    doNeedFetch.value = true;
  }

  Rx<T> at(int idx) => items[idx];

  Rx<T> select(String targetId) {
    final item = this[targetId]!;
    selectedItem.value = item.value;
    _selectSubscription?.cancel();
    _selectSubscription = items.listen((v) {  
      if (v.firstWhereOrNull((i) => i.value.id == item.value.id) == null) {
        selectedItem.value = null;
      }
    });
    return item;
  }

  RxList<Rx<T>> replaceWith(List<T> values) {
    final ids = values.map((v) { 
      this[v.id] == null ? this[v.id] = v : this[v.id]!.value = v;
      return v.id;
    }).toList();
    if (ids.length != items.length) {
      items.removeWhere((v) => ! ids.contains(v.value.id));
    }
    return items;
  }

  void removeSelected() {
    items.removeWhere((el) => el.value.id == selectedItem.value!.id);
  }

  void add(T value) => items.add(value.obs);

}

class DataSourceApi {
  RxBool isReady = false.obs;

  DataSourceApi() {
    init();
  }

  Future<void> init() {
    return api.initApp().then((_) {
      isReady.value = true;
    });
  }

  Future<List<DeviceDataInterface>> getDevices() {
    return api.getStoredDevices();
  }

  Future<DeviceDetectResultInterface> detectNewDevice(String deviceName, ConnectionConfigInterface connection) {
    return api.detectNewDevice(deviceName: deviceName, connection: connection);
  }

  Future<void> removeDevice(String id) {
    return api.removeDevice(deviceId: id);
  }

  Future<List<DeviceInterface>> getDevicesForUsing() {
    return api.getDevicesForUsing();
  }

  Future<DeviceStateInterface> getDeviceState(DeviceInterface device) {
    return api.getDeviceState(deviceId: device.id);
  }

  Future<DeviceStateUpdateResult> setColorBrightness(DeviceInterface device, double brightness) {
    return api.setBrightness(deviceId: device.id, brightness: brightness);
  }

  Future<DeviceStateUpdateResult> setColorHSV(DeviceInterface device, HSVInterface colorState) {
    return api.setHsv(deviceId: device.id, hsv: colorState);
  }

  Future<DeviceStateUpdateResult> setColorRGB(DeviceInterface device, RGBInterface colorState) {
    return api.setRgb(deviceId: device.id, rgb: colorState);
  }

  Future<DeviceStateUpdateResult> setColorCT(DeviceInterface device, CTInterface colorState) {
    return api.setCt(deviceId: device.id, ct: colorState);
  }
  
}