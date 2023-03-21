import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:yeelight_panel/data/app_state.dart';
import 'package:yeelight_panel/menus/menu_panel_builder.dart';

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
    final appState = context.watch<Rx<AppState>>();

    return Column(
      children: [
        SingleChildScrollView(
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
        ),
        Obx(() {
          final mainMenu = appState.value.mainMenu.value;
          final menu = mainMenu.menu.value;

          final ctrPerDevice = mainMenu.controlPerDevice.value.controlPanels.value.currentPanel.value;
          final ctrPerGroup = mainMenu.controlPerGroup.value.controlPanels.value.currentPanel.value;
          final panel = menu == MenuPanel.controlPerDevice ? ctrPerDevice : (
            menu == MenuPanel.controlPerGroup ? ctrPerGroup : null
          );
          final child = MenuPanelBuilder(menu, panel).build(context);
          if (child == null) {
            return const SizedBox.shrink();
          }
          return Container(
            width: 135,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: colors.onSecondaryContainer, width: 1),
                right: BorderSide(color: colors.onSecondaryContainer, width: 1),
              )
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(width: 1, color: colors.onSecondaryContainer),
                    )
                  ),
                  child: Column(
                    children: Iterable.generate(11).map((i) => Container(
                      height: 2, 
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 0, color: colors.onTertiaryContainer),
                        )
                      ),
                    )).toList(),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(width: 1, color: colors.onSecondaryContainer),
                      bottom: BorderSide(width: 1, color: colors.onSecondaryContainer),
                      top: BorderSide(width: 2, color: colors.onSecondaryContainer),
                    ),
                    color: colors.onPrimaryContainer,
                  ),
                  child: child,
                ),
              ],
            ),
          );
        })
      ],
    );
  }
}


class MenuItem extends StatelessWidget {

  final MenuItemData menu;

  const MenuItem(this.menu, {super.key});

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
