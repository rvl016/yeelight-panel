import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:yeelight_panel/common/ct_color.dart';
import 'package:yeelight_panel/layouts/root_layout.dart';
import 'package:yeelight_panel/menus/control_menu.dart';
import 'package:yeelight_panel/panels/device_control/color_wheel_panel.dart';
import 'package:yeelight_panel/panels/device_control/white/temperature_control.dart';

import '../bridge_definitions.dart';
import 'model_state.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    required final Rx<MainMenuState> mainMenu,
  }) = _AppState;

  factory AppState.build(Rx<ModelState> modelState) {
    return AppState(
      mainMenu: MainMenuState(
        menu: MenuPanel.controlPerDevice.obs, 
        controlPerDevice: DeviceControllerState(
          mode: Rx(DeviceControllerLayoutMode.perDevice),
          groupsColumProportion: .0.obs, 
          profilesColumProportion: .3.obs, 
          controlPanels: ControlPanels(modelState).obs,
        ).obs, 
        controlPerGroup: DeviceControllerState(
          mode: Rx(DeviceControllerLayoutMode.perGroup),
          groupsColumProportion: .25.obs, 
          profilesColumProportion: .25.obs, 
          controlPanels: ControlPanels(modelState).obs,
        ).obs, 
        devices: DevicesState(
          deviceDetailsOpen: false.obs,
          deviceDetailsProportion: .3.obs
        ).obs,
        modelState: modelState
      ).obs
    );
  }
}

class MainMenuState {
  final Rx<MenuPanel> menu;
  final Rx<DeviceControllerState> controlPerDevice;
  final Rx<DeviceControllerState> controlPerGroup;
  final Rx<DevicesState> devices;

  MainMenuState({
    required this.menu, 
    required this.controlPerDevice, 
    required this.controlPerGroup, 
    required this.devices,
    required Rx<ModelState> modelState,
  }) {
    menu.listen((menu) => onChangeMenu(modelState.value, menu));
    
    onChangeMenu(modelState.value, menu.value);
  }

  void onChangeMenu(ModelState modelState, MenuPanel menu) {
    final controlState = modelState.controlState;
    menu.match(
      controlPerDevice: () => controlState.value = ControlState.one(Rxn(), Rxn()), 
      controlPerGroup: () => controlState.value = ControlState.multi(RxList.empty(), Rxn()), 
      devices: () => controlState.value = const ControlState.none()
    );
  }
}

class DevicesState {
  final RxBool deviceDetailsOpen;
  final RxDouble deviceDetailsProportion;
  
  DevicesState({
    required this.deviceDetailsOpen,
    required this.deviceDetailsProportion,
  });
}

class DeviceControllerState {
  final Rx<DeviceControllerLayoutMode> mode;
  final RxDouble groupsColumProportion;
  final RxDouble profilesColumProportion;
  final Rx<ControlPanels> controlPanels;

  const DeviceControllerState({
    required this.mode, 
    required this.groupsColumProportion, 
    required this.profilesColumProportion, 
    required this.controlPanels,
  });
}

enum DeviceControllerLayoutMode {
  perDevice,
  perGroup
}

class ControlPanels {

  final Rx<ControlMenuPanel> currentPanel = ControlMenuPanel.white.obs;
  final WhitePanelState whitePanel = WhitePanelState();
  final ColorPanelState colorPanel = ColorPanelState();
  final List<StreamSubscription> curSubscriptions = List.empty(growable: true);

  Colored get currentPanelState => currentPanel.value.match(
    white: () => whitePanel, 
    colorWheel: () => colorPanel,
    colorFlow: () => throw UnimplementedError(), 
    animated: () => throw UnimplementedError(),
    streamed: () => throw UnimplementedError(),
  );

  Rx<Color> currentColor() => currentPanelState.currentColor;

  Rx<Color> currentColorNoBrightness() => currentPanelState.currentColorNoBrightness;

  ControlPanels(Rx<ModelState> modelState) {

    //modelState.listen((state) { 
    //  state.controlState.listen((controlState) { 
    //    controlState.whenOrNull(
    //      one: (dev, devState) => {
    //        dev.listen((devVal) {
    //          final panel = currentPanel.value;
    //          if (panel == ControlMenuPanel.white) {

    //          } else if (panel == ControlMenuPanel.colorWheel) {

    //          }
    //        })
    //      }, 
    //      multi: (devs, devsState) {

    //      }
    //    );
    //  });
    //});
    currentPanel.listen((panel) => onPanelChanged(modelState.value, panel));
    onPanelChanged(modelState.value, currentPanel.value);
  }

  void onPanelChanged(ModelState state, ControlMenuPanel panel) {
    curSubscriptions.map((s) => s.cancel()).toList();
    panel.match(
      white: () {
        curSubscriptions.add(whitePanel.brightness.listen(state.setCurrentBrightness));
        curSubscriptions.add(whitePanel.temperature.listen(
          (t) => state.setCurrentCt(CTInterface(temperature: t.toInt()))
        ));
      }, 
      colorWheel: () {
        curSubscriptions.add(colorPanel.brightness.listen(state.setCurrentBrightness));
        curSubscriptions.add(colorPanel.hue.listen(
          (h) => state.setCurrentHsv(HSVInterface(hue: h, saturation: colorPanel.saturation.value))
        ));
        curSubscriptions.add(colorPanel.saturation.listen(
          (s) => state.setCurrentHsv(HSVInterface(hue: colorPanel.hue.value, saturation: s))
        ));
      },
      colorFlow: () => throw UnimplementedError(), 
      animated: () => throw UnimplementedError(),
      streamed: () => throw UnimplementedError(),
    );
  }

}

mixin ControlPanelDataController on Colored {


}

mixin Colored {
  Rx<Color> get currentColor;
  Rx<Color> get currentColorNoBrightness;
}

class WhitePanelState implements Colored {
  final Rx<IndicatorMode> indicatorMode = IndicatorMode.unit.obs;
  final RxDouble step = 100.0.obs;

  final RxDouble brightness = 1.0.obs;
  final RxDouble temperature = 3200.0.obs;
  final RxDouble minTemp = 1700.0.obs;
  final RxDouble maxTemp = 6500.0.obs;
  @override
  final Rx<Color> currentColor = Color(CTColor(3200).value).obs;
  @override
  final Rx<Color> currentColorNoBrightness = Color(CTColor(3200).value).obs;

  WhitePanelState() {
    temperature.listen((_) => _updateCurrentColor());
    brightness.listen((_) => _updateCurrentColor());
  }

  void _updateCurrentColor() {
    final color = HSLColor.fromColor(CTColor(temperature.value.toInt()));
    currentColor.value = color
      .withAlpha(brightness.value)
      .toColor();
    currentColorNoBrightness.value = color.toColor();
  }
}

class ColorPanelState implements Colored {
  final Rx<IndicatorMode> indicatorMode = IndicatorMode.unit.obs;
  final RxDouble step = (1 / 36).obs;

  final RxDouble brightness = 1.0.obs;
  final RxDouble hue = 0.0.obs;
  final RxDouble saturation = 1.0.obs;
  @override
  final Rx<Color> currentColor = const HSLColor.fromAHSL(1, 0, 1, 1).toColor().obs;
  @override
  final Rx<Color> currentColorNoBrightness = const HSLColor.fromAHSL(1, 0, 1, 1).toColor().obs;

  ColorPanelState() {
    saturation.listen((_) => _updateCurrentColor());
    hue.listen((_) => _updateCurrentColor());
    brightness.listen((_) => _updateCurrentColor());
  }

  void _updateCurrentColor() {
    currentColorNoBrightness.value = HSVColor.fromAHSV(1.0, (hue.value % 1) * 360, saturation.value, 1).toColor();
    currentColor.value = HSLColor.fromColor(currentColorNoBrightness.value)
      .withAlpha(brightness.value).toColor();
  }
}
