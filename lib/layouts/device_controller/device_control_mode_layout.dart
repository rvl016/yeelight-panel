import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:yeelight_panel/data/app_state.dart';
import 'package:yeelight_panel/menus/control_menu.dart';
import 'package:yeelight_panel/panels/device_control_panel.dart';

class DeviceControlModeLayout extends StatelessWidget {
  const DeviceControlModeLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final stateObs = context.watch<Rx<ControlPanels>>();
    return Obx(() { 
      final state = stateObs.value;
      return ProxyProvider0(
        update: (_, __) => state.currentPanel,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const ControlModeMenu(),
            ProxyProvider0(
              update: (_, __) => state,
              child: const ControlMainPanel()
            ),
          ],
        ),
      );
    });
  }
}
