import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:yeelight_panel/actions/common/list_intents.dart' as intents;
import 'package:yeelight_panel/common/data_display/form_fields.dart';
import 'package:yeelight_panel/data/model/device.dart';
import 'package:yeelight_panel/layouts/common/dialog.dart';

import '../actions/action_base.dart';
import '../actions/data_binders.dart';
import '../bridge_definitions.dart';
import '../data/model_state.dart';



class DevicesList extends StatelessWidget {
  const DevicesList({super.key});

  void initData(BuildContext context) {
    final operator = context.read<ListPageOperator<DeviceDataInterface, DeviceDataBinder>>();
    if (operator.state.doNeedFetch.isTrue) {
      Actions.invoke(context, intents.FetchAllIntent());
    }
  }

  @override
  Widget build(BuildContext context) {
    initData(context);     
    final devItems = context.select((ListPageOperator<DeviceDataInterface, DeviceDataBinder> op) => op.state.items);
    return Container(
      color: Get.theme.colorScheme.onPrimaryContainer,
      child: Obx(() {
        return Scrollbar(
          child: ListView.builder(
            itemCount: devItems.length,
            itemBuilder: (ctx, idx) => DeviceListTile(device: devItems[idx]),
            shrinkWrap: true,
          ),
        );
      }),
    );
  }
}

class DeviceListTile extends StatelessWidget {
  final Rx<DeviceDataInterface> device;
  const DeviceListTile({required this.device, super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() { 
      final dev = device.value;
      final devType = dev.deviceType;
      final capabilities = dev.capabilities;

      final colors = Get.theme.colorScheme;
      final state = context.watch<Rx<ListPageState<DeviceDataInterface>>>();
      return Obx(() { 
        final isSelected = state.value.selecteditem.value?.id == dev.id;
        return ListTile(
          contentPadding: const EdgeInsets.all(0),
          minVerticalPadding: 0,
          selected: isSelected,
          onTap: () => Actions.invoke(context, intents.SelectIntent(dev)),
          title: ColorFiltered(
            colorFilter: ColorFilter.mode(
              ThemeColors(context).highlightTintColor(36 * (isSelected ? 1 : 0)), BlendMode.colorDodge
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: isSelected ? ThemeColors(context).highlightBorderTintColor() : colors.onSecondaryContainer,
                  width: 0
                )
              ),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      color: Color.lerp(colors.secondaryContainer, Colors.white, (isSelected ? 1 : 0) * 0),
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(
                        devType.toIconData,
                        size: 36,
                        color: colors.onSecondaryContainer,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8
                        ),
                        color: colors.onSecondaryContainer,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FieldDisplay(
                              value: dev.name, 
                              label: "Name",
                              verticalMargin: 0,
                            ),
                            Row(
                              children: [
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: Container(
                                    child: FieldDisplay(
                                      value: devType.toText, 
                                      label: "Type",
                                      verticalMargin: 0,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 16),
                                    child: FieldDisplay(
                                      value: dev.deviceImpl.toText, 
                                      label: "Implementation",
                                      verticalMargin: 0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                            
                              ],
                            ),
                          ]
                        ),
                      ),
                    )
                  ]
                ),
              ),
            ),
          ),
        );
      });
    });
  }
}