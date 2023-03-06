
import 'package:tuple/tuple.dart';
import 'package:yeelight_panel/actions/action_base.dart';
import 'package:yeelight_panel/bridge_definitions.dart';
import 'package:yeelight_panel/data/model/device.dart';
import 'package:yeelight_panel/data/model/profile.dart';

class DeviceDataBinder extends DataBinder {
  DeviceDataBinder(super.source);

  void delete(DeviceInterface data) {
    // TODO: implement delete
  }

  Future<List<DeviceDataInterface>> fetch() {
    return source.getDevices();
  }

  Future<DeviceDataInterface> create(Tuple2<String, ConnectionConfigInterface> data) {
    return source.detectNewDevice(data.item1, data.item2).then((v) => v.when(
      ok: (DeviceDataInterface dev) => Future.value(dev), 
      error: (List<DeviceDetectErrorItem> errors) => Future.error(errors),
    ));
  }

  DeviceInterface update(DeviceInterface data) {
    // TODO: implement update
    throw UnimplementedError();
  }
  
}


class ProfileDataBinder extends DataBinder {
  ProfileDataBinder(super.source);

  void delete(Profile<ProfileType> data) {
    // TODO: implement delete
  }

  Profile<ProfileType> fetchById(String id) {
    // TODO: implement fetchById
    throw UnimplementedError();
  }

  List<Profile<ProfileType>> fetchSlice(int offset, int limit, int size) {
    // TODO: implement fetchSlice
    throw UnimplementedError();
  }

  Profile<ProfileType> update(Profile<ProfileType> data) {
    // TODO: implement update
    throw UnimplementedError();
  }
  
}