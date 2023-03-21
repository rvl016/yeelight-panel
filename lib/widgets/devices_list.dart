import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:yeelight_panel/actions/common/list_intents.dart' as intents;
import 'package:yeelight_panel/common/data_display/form_fields.dart';
import 'package:yeelight_panel/data/model/base.dart';
import 'package:yeelight_panel/data/model/device.dart';
import 'package:yeelight_panel/layouts/common/dialog.dart';

import '../actions/action_base.dart';
import '../actions/data_binders.dart';
import '../bridge_definitions.dart';
import '../data/model_state.dart';
import 'common/list.dart';



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

      final colors = Get.theme.colorScheme;
      final state = context.watch<Rx<ListPageState<DeviceDataInterface>>>();
      return SelectableListTile(
        state: state,
        item: device,
        bgColor: colors.onSecondaryContainer,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: colors.secondaryContainer,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Icon(
                  device.value.deviceType.toIconData,
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
                      Obx(() => FieldDisplay(
                        value: device.value.name, 
                        label: "Name",
                        verticalMargin: 0,
                      )),
                      Row(
                        children: [
                          Flexible(
                            fit: FlexFit.loose,
                            child: Container(
                              child: Obx(() => FieldDisplay(
                                value: device.value.deviceType.toText, 
                                label: "Type",
                                verticalMargin: 0,
                              )),
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.loose,
                            child: Container(
                              margin: const EdgeInsets.only(left: 16),
                              child: Obx(() => FieldDisplay(
                                value: device.value.deviceImpl.toText, 
                                label: "Implementation",
                                verticalMargin: 0,
                              )),
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
      );
    });
  }
}

