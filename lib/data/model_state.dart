
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:yeelight_panel/bridge_generated.io.dart';
import 'package:yeelight_panel/data/model/profile.dart';
import 'package:yeelight_panel/ffi.dart';

import '../bridge_definitions.dart';
import 'model/base.dart';
import 'model/device.dart';


class ModelState {
  final Rx<DataSourceApi> dataSource = DataSourceApi().obs;
  final Rx<ListPageState<DeviceDataInterface>> deviceTablePageState = ListPageState<DeviceDataInterface>().obs;
  final Rx<ListPageState<Profile>> mainPanelDeviceProfiles = ListPageState<Profile>().obs;
  final Rx<ListPageState<Profile>> mainPanelGroupProfiles = ListPageState<Profile>().obs;

  RxBool get isReady => dataSource.value.isReady;
}


class ListPageState<T extends Data> {
  final RxList<Rx<T>> items = RxList.empty();
  final Rxn<T> selecteditem = Rxn();
  final RxBool doNeedFetch = true.obs;

  Rx<T>? operator [](String id) => items.firstWhereOrNull((e) => e.value.id == id);
  
  void operator []=(String id, T value) {
    final val = this[id];
    if (val == null) {
      items.add(value.obs);
    } else {
      val.value = value;
    }
  }

  Rx<T> at(int idx) => items[idx];

  Rx<T> select(String targetId) {
    final item = this[targetId]!;
    selecteditem.value = item.value;
    return item;
  }

  RxList<Rx<T>> replaceWith(List<T> values) {
    final ids = values.map((v) { 
      this[v.id] == null ? this[v.id] = v : this[v.id]!.value = v;
      return v.id;
    });
    if (ids.length != items.length) {
      items.removeWhere((v) => ! ids.contains(v.value.id));
    }
    return items;
  }

  void add(T value) => items.add(value.obs);

}

class DataSourceApi {
  RxBool isReady = false.obs;

  DataSourceApi() {
    init();
  }

  Future<void> init() {
    return api.initApp().then((value) {
      isReady.value = true;
      return value;
    });
  }

  Future<List<DeviceDataInterface>> getDevices() {
    return api.getStoredDevices();
  }

  Future<DeviceDetectResult> detectNewDevice(String deviceName, ConnectionConfigInterface connection) {
    return api.detectNewDevice(deviceName: deviceName, connection: connection);
  }
}