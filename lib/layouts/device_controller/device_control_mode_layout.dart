import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:yeelight_panel/data/ui/main_menu/control_per_device/device_controller/state.dart';
import 'package:yeelight_panel/menus/control_menu.dart';
import 'package:yeelight_panel/panels/device_control_panel.dart';

class DeviceControlModeLayout extends StatelessWidget {
  const DeviceControlModeLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final stateObs = context.watch<Rx<DeviceControlModeState>>();
    return Obx(() { 
      final state = stateObs.value;
      return Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ProxyProvider0(
            update: (_, __) => state,
            child: ControlModeMenu()
          ),
          ProxyProvider0(
            update: (_, __) => state.menu,
            child: ControlMainPanel()
          ),
        ],
      );
    });
  }
}
