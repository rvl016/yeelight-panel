import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match/match.dart';
import 'package:provider/provider.dart';
import 'package:yeelight_panel/data/app_state.dart';

import '../menus/main_menu.dart';
import '../panels/main_panel.dart';

part 'root_layout.g.dart';

class MainLayout extends StatelessWidget {

  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<Rx<AppState>>();
    return Flex(
      direction: Axis.vertical,
      children: [
        Expanded(
          child: Obx(() { 
            final mainMenu = state.value.mainMenu;
            final curMenu = mainMenu.value.menu;
            return MultiProvider(
              providers: [
                ProxyProvider0(update: (_, __) => mainMenu),
                ProxyProvider0(update: (_, __) => curMenu)
              ],
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  MainMenu(),
                  Expanded(
                    child: MainPanel()
                  ),
                ],
              ),
            );
          }),
        )
      ],
    );
  }
}

@match
enum MenuPanel {
  controlPerDevice,
  controlPerGroup,
  devices,
}
