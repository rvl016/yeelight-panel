import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:yeelight_panel/common/panel_control_button.dart';
import 'package:yeelight_panel/data/ui/main_menu/control_per_device/device_controller/state.dart';

part 'control_menu.freezed.dart';


class ControlModeMenu extends StatelessWidget {
  const ControlModeMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: IntrinsicHeight(child: Row(
          //mainAxisSize: MainAxisSize.max,
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: menus.map((m) => ControlMenuButton(controlMenu: m)).cast<Widget>().toList()
            ..add(Container(
                width: Get.mediaQuery.size.width,
                color: Get.theme.colorScheme.onPrimaryContainer,
              ),
            ),
        ))
      )
    );
  }
}

class ControlMenuButton extends StatelessWidget {
  final ControlMenuData controlMenu;

  const ControlMenuButton({Key? key, required this.controlMenu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<Rx<DeviceControlModeState>>();
    final theme = Get.theme.colorScheme;
    return Obx(() {
    final curMenu = state.value.menu;
      return PanelControlButton(
        onTap: () => curMenu.value = controlMenu.panel,
        child: Obx(() {
          return Container(
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: theme.onSecondaryContainer, width: 0),
                bottom: curMenu.value == controlMenu.panel 
                  ? BorderSide(color: theme.onSecondaryContainer, width: 10) 
                  : BorderSide(color: theme.onSecondaryContainer, width: 1),
              ),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Icon(
                    controlMenu.icon,
                    size: 28 * Get.mediaQuery.textScaleFactor,
                    semanticLabel: controlMenu.label,
                  ) 
                ),
                Container(child: Text(controlMenu.label)),
              ]
            ),
          );
        }),
      );
    });
  }
}

@freezed
class ControlMenuData with _$ControlMenuData {
  const factory ControlMenuData({
    required final String name,
    required final String label,
    required final IconData icon,
    required final ControlMenuPanel panel,
  }) = _ControlMenuData;
}

enum ControlMenuPanel {
  white,
  colorWheel,
  colorFlow,
  animated,
  streamed
}

const menus = [
  ControlMenuData(
    name: "white", label: "White", 
    icon: Icons.contrast_outlined, panel: ControlMenuPanel.white
  ),
  ControlMenuData(
    name: "color_wheel", label: "Color Wheel", 
    icon: Icons.palette_outlined, panel: ControlMenuPanel.colorWheel
  ),
  ControlMenuData(
    name: "color_flow", label: "Color Flow", 
    icon: Icons.gradient_outlined, panel: ControlMenuPanel.colorFlow
  ),
  ControlMenuData(
    name: "animated", label: "Animated", 
    icon: Icons.emoji_nature_outlined, panel: ControlMenuPanel.animated
  ),
  ControlMenuData(
    name: "streamed", label: "Streamed", 
    icon: Icons.schema_outlined, panel: ControlMenuPanel.streamed
  ),
];