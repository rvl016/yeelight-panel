import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:yeelight_panel/data/ui/main_menu/state.dart';
import 'package:yeelight_panel/layouts/device_controller/layout.dart';

class ControlDeviceLayout extends StatelessWidget {
  const ControlDeviceLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DeviceControllerLayout();
  }
}

