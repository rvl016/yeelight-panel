import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';


abstract class AbstractPanel<T> extends StatelessWidget {

  const AbstractPanel({Key? key}) : super(key: key);

  Widget getPanel(T curMenu, BuildContext context);

  @override
  Widget build(BuildContext context) {
    final curMenu = context.watch<Rx<T>>();
    return Obx(() => getPanel(curMenu.value, context));
  }
}

class MenuOperator<T> {

  final T curMenu;
  final Map<T, Widget Function(BuildContext)> menuToPanel;

  MenuOperator(this.curMenu, this.menuToPanel);
  
  Widget toPanel(BuildContext ctx) {
    if (menuToPanel.containsKey(curMenu)) {
      return menuToPanel[curMenu]!(ctx);
    } else {
      return const Text("No Panel");
    }
  }
}