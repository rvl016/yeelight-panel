import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'device_controller/state.dart';

part 'state.freezed.dart';

@freezed
class DeviceControllerState with _$DeviceControllerState {
  const factory DeviceControllerState({
    required final Rx<DeviceControllerLayoutMode> mode,
    required final RxDouble groupsColumProportion,
    required final RxDouble profilesColumProportion,
    required final Rx<DeviceControlModeState> deviceStatePanel,
  }) = _DeviceControllerState;
}

enum DeviceControllerLayoutMode {
  perDevice,
  perGroup
}
