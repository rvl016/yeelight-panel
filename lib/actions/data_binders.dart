import 'package:get/get.dart';
import 'package:tuple/tuple.dart';
import 'package:yeelight_panel/actions/action_base.dart';
import 'package:yeelight_panel/bridge_definitions.dart';

import '../data/model_state.dart';

class DeviceDataBinder extends DataBinder<DeviceDataInterface> {
  DeviceDataBinder(super.source);

  void delete(DeviceInterface data) {
    // TODO: implement delete
  }

  @override
  Future<List<DeviceDataInterface>> fetch() {
    return source.getDevices();
  }

  Future<DeviceDataInterface> create(Tuple2<String, ConnectionConfigInterface> data) {
    return source.detectNewDevice(data.item1, data.item2).then((v) => v.when(
      ok: (DeviceDataInterface dev) => Future.value(dev), 
      error: (List<DeviceDetectErrorItemInterface> errors) => Future.error(errors),
    ));
  }

  DeviceDataInterface update(DeviceDataInterface data) {
    // TODO: implement update
    throw UnimplementedError();
  }
  
  @override
  Future<void> remove(String targetId) {
    return source.removeDevice(targetId);
  }
  
}

class DeviceBinder extends DataBinder<DeviceInterface> {
  DeviceBinder(super.source);

  @override
  Future<List<DeviceInterface>> fetch() {
    return source.getDevicesForUsing()
      .onError((error, stackTrace) {
        throw Exception();
      });
  }

  Future<DeviceStateInterface> getDeviceState(DeviceInterface device) {
    return source.getDeviceState(device);
  }

  @override
  Future<void> remove(String targetId) {
    // TODO: implement remove
    throw UnimplementedError();
  }
}

class DeviceStateBinder {

  DeviceStateBinder(this.dataSource, this.controlState);

  final DataSourceApi dataSource;
  final ControlState controlState;

  DeviceStateInterface get state => controlState.maybeWhen(
    one: (device, state) => state.value!, 
    multi: (devices, state) => state.value!,
    orElse: throw Exception("Expected a One or Multi ControlState, but there is no ControlState (None)")
  );

  ColorStateInterface get colorState => state.runningState.maybeWhen(
    color: (c) => c,
    orElse: throw Exception("Expected Color RunningState, but it isn't Color")
  );

  Future<DeviceStateInterface> updateBrightness(double brightness) {
    return runForEach(
      (dev) => dataSource.setColorBrightness(dev.value!, brightness), 
      (dev) => throw Exception()
    );
  }

  Future<DeviceStateInterface> updateRGB(RGBInterface rgb) {
    return runForEach(
      (dev) => dataSource.setColorRGB(dev.value!, rgb), 
      (dev) => throw Exception()
    );
  }

  Future<DeviceStateInterface> updateHSV(HSVInterface hsv) {
    return runForEach(
      (dev) => dataSource.setColorHSV(dev.value!, hsv), 
      (dev) => throw Exception()
    );
  }

  Future<DeviceStateInterface> updateCT(CTInterface ct) {
    return runForEach(
      (dev) => dataSource.setColorCT(dev.value!, ct), 
      (dev) => throw Exception()
    );
  }

  Future<DeviceStateInterface> runForEach(
    Future<DeviceStateUpdateResult> Function(Rxn<DeviceInterface>) fOne,
    Future<DeviceStateUpdateResult> Function(RxList<DeviceInterface>) fMulti,
  ) {
    final result = controlState.maybeWhen(
      one: (dev, _) => fOne(dev), 
      multi: (devs, _) => fMulti(devs), 
      orElse: () => throw Exception("Expected One or Multi, receive None"),
    );
    return result.then((value) => value.when(
      ok: (v) => v, 
      err: (v) => throw Exception(v.message)
    ));
  }

}

class ProfileDataBinder extends DataBinder<ProfileInterface> {
  ProfileDataBinder(super.source);

  void delete(ProfileInterface data) {
    remove(data.id);
  }

  ProfileInterface fetchById(String id) {
    // TODO: implement fetchById
    throw UnimplementedError();
  }

  List<ProfileInterface> fetchSlice(int offset, int limit, int size) {
    // TODO: implement fetchSlice
    throw UnimplementedError();
  }

  ProfileInterface update(ProfileInterface data) {
    // TODO: implement update
    throw UnimplementedError();
  }
  
  @override
  Future<void> remove(String targetId) {
    // TODO: implement remove
    throw UnimplementedError();
  }
  
  @override
  Future<List<ProfileInterface>> fetch() {
    // TODO: implement fetch
    throw UnimplementedError();
  }
  
}