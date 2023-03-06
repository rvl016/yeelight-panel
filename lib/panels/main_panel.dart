import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:yeelight_panel/data/app_state.dart';
import 'package:yeelight_panel/data/ui/main_menu/state.dart';
import 'package:yeelight_panel/layouts/control_device_layout.dart';
import 'package:yeelight_panel/layouts/control_groups_layout.dart';
import 'package:yeelight_panel/layouts/devices_layout.dart';
import 'package:yeelight_panel/menus/control_menu.dart';
import 'package:yeelight_panel/panels/abstract_panel.dart';
import 'package:yeelight_panel/widgets/devices_list.dart';

import '../layouts/root_layout.dart';
import '../menus/main_menu.dart';

class MainPanel extends AbstractPanel<MenuPanel> {

  const MainPanel({Key? key}) : super(key: key);

  @override
  Widget getPanel(MenuPanel curMenu, BuildContext context) => MenuPanelOperator(curMenu).toPanel(context);
}

class MenuPanelOperator extends MenuOperator<MenuPanel> {

  static Widget provided<T>(BuildContext ctx, T Function(MainMenuState) getData, Widget child) {
    return Obx(() { 
      final data = getData(ctx.watch<Rx<AppState>>().value.mainMenu.value);
      return ProxyProvider0<T>(
        update: (_, __) => data,
        child: child,
      );
    });
  }

  MenuPanelOperator(MenuPanel curMenu) : super(curMenu, {
    MenuPanel.controlPerDevice: (ctx) => provided(ctx, (s) => s.controlPerDevice, ControlDeviceLayout()),
    MenuPanel.controlPerGroup: (ctx) => provided(ctx, (s) => s.controlPerGroup, ControlGroupsLayout()),
    MenuPanel.devices: (ctx) => provided(ctx, (s) => s.devices, DevicesLayout()),
  });

}