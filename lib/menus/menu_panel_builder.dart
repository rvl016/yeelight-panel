import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:yeelight_panel/common/framed.dart';
import 'package:yeelight_panel/data/model_state.dart';
import 'package:yeelight_panel/layouts/device_controller/layout.dart';
import 'package:yeelight_panel/layouts/root_layout.dart';
import 'package:yeelight_panel/panels/device_control/white/color_presenter.dart';

import '../data/app_state.dart';
import 'control_menu.dart';


class MenuPanelBuilder {

  final MenuPanel menu;
  final ControlMenuPanel? controllerPanelMenu;

  MenuPanelBuilder(this.menu, this.controllerPanelMenu);

  Widget? build(BuildContext context) {
    if (menu == MenuPanel.controlPerDevice) {
      if (controllerPanelMenu == ControlMenuPanel.white) {
        return getWithDeviceDetail(context, getColorPresenter(
          context: context, 
          getPanel: (p) => p.whitePanel, 
          getChild: (p) => StateFieldsWhiteData(
            brightness: p.whitePanel.brightness, 
            temperature: p.whitePanel.temperature
          )
        ));
      } else if (controllerPanelMenu == ControlMenuPanel.colorWheel) {
        return getWithDeviceDetail(context, getColorPresenter(
          context: context, 
          getPanel: (p) => p.colorPanel, 
          getChild: (p) => const Text("COLOR FIELDS HERE")
        ));
      }
    }
    return null;
  }

  Widget getColorPresenter({
    required BuildContext context, 
    required Colored Function(ControlPanels) getPanel, 
    required Widget Function(ControlPanels) getChild
  }) {
    return Obx(() {
      final appState = context.watch<Rx<AppState>>();
      final panels = appState.value.mainMenu.value.controlPerDevice.value.controlPanels.value;
      final panelData = getPanel(panels);
      return ProxyProvider0(
        update: (_, __) => panels,
        child: Framed(
          child: ColorPresenter(
            color: panelData.currentColor,
            child: getChild(panels),
          ),
        )
      );
    });
  }

  Widget getWithDeviceDetail(BuildContext context, Widget child) {
    
    return Column(
      children: [
        child,
        Framed(
          child: Obx(() => DeviceDetail(
            context.watch<Rx<ModelState>>().value.statedDevicesPageState.value.selectedItem
          )),
        ),
      ],
    );
  }
}