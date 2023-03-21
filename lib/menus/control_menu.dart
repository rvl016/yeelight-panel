import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:match/match.dart';
import 'package:provider/provider.dart';
import 'package:yeelight_panel/common/panel_control_button.dart';
import 'package:yeelight_panel/data/app_state.dart';

part 'control_menu.freezed.dart';
part 'control_menu.g.dart';


class ControlModeMenu extends StatelessWidget {
  const ControlModeMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LayoutBuilder(
        builder: (ctx, constraints) => SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            constraints: BoxConstraints(
              minWidth: constraints.maxWidth
            ),
            color: Get.theme.colorScheme.onPrimaryContainer,
            child: IntrinsicHeight(child: Row(
              //mainAxisSize: MainAxisSize.max,
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: menus.map((m) => ControlMenuButton(controlMenu: m)).cast<Widget>().toList(),
            )),
          ),
        ),
      )
    );
  }
}

class ControlMenuButton extends StatelessWidget {
  final ControlMenuData controlMenu;

  const ControlMenuButton({Key? key, required this.controlMenu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menu = context.watch<Rx<ControlMenuPanel>>();
    final theme = Get.theme.colorScheme;
    return Obx(() {
      return PanelControlButton(
        onTap: () => menu.value = controlMenu.panel,
        child: Container(
          decoration: BoxDecoration(
            color: theme.onBackground,
            border: Border(
              right: BorderSide(color: theme.onSecondaryContainer, width: 0),
              bottom: menu.value == controlMenu.panel 
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
        )
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

@match
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