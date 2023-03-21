import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:yeelight_panel/actions/common/list_intents.dart' as intents;
import 'package:yeelight_panel/data/model/base.dart';
import 'package:yeelight_panel/data/model_state.dart';
import 'package:yeelight_panel/layouts/common/dialog.dart';


class SelectableListTile<T extends Data> extends StatelessWidget {
  const SelectableListTile({
    required this.state, 
    required this.item, 
    required this.bgColor, 
    required this.child,
    super.key, 
  });

  final Rx<ListPageState<T>> state;
  final Rx<T> item;
  final Color bgColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final modelState = context.watch<Rx<ModelState>>();
    return Obx(() {
      final isSelected = state.value.selectedItem.value?.id == item.value.id;
      return GestureDetector(
        onTap: () {
          if (isSelected) {
            Actions.invoke(context, intents.ChooseSelectedIntent(modelState.value.controlState));
          } else {
            Actions.invoke(context, intents.SelectIntent(item.value));
          }
        },
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            ThemeColors(context).highlightTintColor(36 * (isSelected ? 1 : 0)), BlendMode.colorDodge
          ),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? ThemeColors(context).highlightBorderTintColor() : bgColor,
                width: 0.35
              )
            ),
            child: child,
          ),
        ),
      );
    });
  }
}