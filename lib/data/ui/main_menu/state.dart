import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';

import '../../../layouts/root_layout.dart';

import 'control_per_device/state.dart';
import 'devices/state.dart';
part 'state.freezed.dart';

@freezed
class MainMenuState with _$MainMenuState {
  const factory MainMenuState({
    required final Rx<MenuPanel> menu,
    required final Rx<DeviceControllerState> controlPerDevice,
    required final Rx<DeviceControllerState> controlPerGroup,
    required final Rx<DevicesState> devices,
  }) = _MainMenuState;
}
