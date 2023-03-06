import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:yeelight_panel/menus/control_menu.dart';

part 'state.freezed.dart';

@freezed
class DeviceControlModeState with _$DeviceControlModeState {
  const factory DeviceControlModeState({
    required final Rx<ControlMenuPanel> menu,
  }) = _DeviceControlModeState;
}
