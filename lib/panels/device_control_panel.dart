import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeelight_panel/menus/control_menu.dart';
import 'package:yeelight_panel/panels/device_control/color/panel.dart';
import 'package:yeelight_panel/panels/device_control/white/panel.dart';
import 'abstract_panel.dart';

class ControlMainPanel extends AbstractPanel<ControlMenuPanel> {

  const ControlMainPanel({Key? key}) : super(key: key);

  @override
  Widget getPanel(ControlMenuPanel curMenu, BuildContext ctx) => ControlMenuPanelOperator(curMenu).toPanel(ctx);
}

class ControlMenuPanelOperator extends MenuOperator<ControlMenuPanel> {

  ControlMenuPanelOperator(ControlMenuPanel curMenu) : super(curMenu, {
    ControlMenuPanel.white: (ctx) => WhitePanel(),
    ControlMenuPanel.colorWheel: (ctx) => ColorPanel(),
    ControlMenuPanel.colorFlow: (ctx) => Container(child: Text("Color Flow")),
    ControlMenuPanel.animated: (ctx) => Container(child: Text("Animated")),
    ControlMenuPanel.streamed: (ctx) => Container(child: Text("Streamed")),
  });

}
