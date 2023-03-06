import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:yeelight_panel/data/ui/main_menu/state.dart';

import '../common/panel_button.dart';
import '../layouts/root_layout.dart';

part 'main_menu.freezed.dart';

class MainMenu extends StatelessWidget {

  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> mapWithChildren(MenuItemData m) => [
      Provider(create: (_) => false.obs, child: MenuItem(m)),
      Column(children: (m.children ?? []).mapMany((mi) => mapWithChildren(mi)).toList())
    ];
    final colors = Get.theme.colorScheme;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(width: 1, color: colors.onSecondaryContainer),
            bottom: BorderSide(width: 1, color: colors.onSecondaryContainer)
          ),
          color: colors.onSecondaryContainer,
        ),
        child: IntrinsicWidth(
          child: Column(
            children: menus.mapMany((m) => mapWithChildren(m)).toList(),
          ),
        ),
      ),
    );
  }
}


class MenuItem extends StatelessWidget {

  final MenuItemData menu;

  const MenuItem(this.menu, {super.key});

  void _toggleChildrenOpenness(BuildContext ctx) {
    final isOpen = ctx.read<RxBool>();
    isOpen.value = ! isOpen.value;
  }

  void _showMenuPanel(BuildContext ctx) {
    final panel = menu.panel;
    if (panel != null) {
      ctx.read<Rx<MainMenuState>>().value.menu.value = panel;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Get.theme.colorScheme;
    return PanelButton(
      onTap: () => (menu.children ?? []).isNotEmpty ? _toggleChildrenOpenness(context) : _showMenuPanel(context),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              color: colors.onTertiaryContainer,
              padding: const EdgeInsets.symmetric(
                horizontal: 4,
                vertical: 2
              ),
              child: Icon(
                menu.icon,
                size: 28 * Get.mediaQuery.textScaleFactor,
                semanticLabel: menu.label,
              )
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                constraints: const BoxConstraints.expand(),
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 10
                ),
                decoration: BoxDecoration(
                  color: colors.onPrimaryContainer,
                  border: Border(
                    left: BorderSide(
                      width: 2,
                      color: colors.onSecondaryContainer,
                    ),
                    bottom: BorderSide(
                      width: 0,
                      color: colors.onSecondaryContainer,
                    )
                  )
                ),
                child: Text(
                  menu.label,
                  style: Get.textTheme.titleMedium,
                  maxLines: 1,
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}

@freezed
class MenuItemData with _$MenuItemData {
  const factory MenuItemData({
    required final String name,
    required final String label,
    required final IconData icon,
    final MenuPanel? panel,
    final Iterable<MenuItemData>? children,
  }) = _MenuItemData;
}

const menus = [
  MenuItemData(
    name: "control", 
    label: "Control", 
    icon: Icons.brightness_6_outlined, 
    children: [
      MenuItemData(
        name: "device", label: "Per Device", icon: Icons.square_outlined, panel: MenuPanel.controlPerDevice
      ),
      MenuItemData(
        name: "group", label: "Per Group", icon: Icons.view_module_outlined, panel: MenuPanel.controlPerGroup
      ),
    ]
  ),
  MenuItemData(name: "devices", label: "Devices", icon: Icons.emoji_objects_outlined, panel: MenuPanel.devices)
];
