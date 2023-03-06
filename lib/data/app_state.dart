import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:yeelight_panel/data/ui/main_menu/control_per_device/device_controller/state.dart';
import 'package:yeelight_panel/data/ui/main_menu/control_per_device/state.dart';
import 'package:yeelight_panel/data/ui/main_menu/devices/state.dart';
import 'package:yeelight_panel/layouts/root_layout.dart';
import 'package:yeelight_panel/menus/control_menu.dart';

import 'ui/main_menu/state.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    required final Rx<MainMenuState> mainMenu,
  }) = _AppState;

  factory AppState.build() {
    return AppState(
      mainMenu: MainMenuState(
        menu: MenuPanel.controlPerDevice.obs, 
        controlPerDevice: DeviceControllerState(
          mode: Rx(DeviceControllerLayoutMode.perDevice),
          groupsColumProportion: .0.obs, 
          profilesColumProportion: .3.obs, 
          deviceStatePanel: DeviceControlModeState(
            menu: ControlMenuPanel.white.obs,
          ).obs,
        ).obs, 
        controlPerGroup: DeviceControllerState(
          mode: Rx(DeviceControllerLayoutMode.perGroup),
          groupsColumProportion: .25.obs, 
          profilesColumProportion: .25.obs, 
          deviceStatePanel: DeviceControlModeState(
            menu: ControlMenuPanel.white.obs,
          ).obs,
        ).obs, 
        devices: DevicesState(
          deviceDetailsOpen: false.obs,
          deviceDetailsProportion: .3.obs
        ).obs
      ).obs
    );
  }
}


//@freezed
//class * with _$* {
//  const factory *({
//  }) = _*;
//}