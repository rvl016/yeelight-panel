import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:yeelight_panel/bridge_definitions.dart';
import 'package:yeelight_panel/common/framed.dart';
import 'package:yeelight_panel/data/model_state.dart';
import 'package:yeelight_panel/data/ui/main_menu/devices/state.dart';
import 'package:yeelight_panel/layouts/common/secondary_panel_layout.dart';

import 'package:yeelight_panel/actions/common/list_intents.dart' as intents;
import '../actions/action_base.dart';
import '../actions/data_binders.dart';
import '../actions/device_table_actions.dart';
import '../widgets/device_details.dart';
import 'devices/control_bar_layout.dart';
import '../widgets/devices_list.dart';
import 'devices/device_table_layout.dart';

class DevicesLayout extends StatelessWidget {

  const DevicesLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final devProportion = context.select((Rx<DevicesState> s) => s.value.deviceDetailsProportion);
    final devTableState = context.select((Rx<ModelState> s) => s.value.deviceTablePageState);
    final source = context.watch<Rx<DataSourceApi>>().value;
    return Obx(() {
      final operator = ListPageOperator.withData(devTableState.value, DeviceDataBinder(source));
      return MultiProvider(
        providers: [
          ProxyProvider0(
            update: (_, __) => operator
          ),
          ProxyProvider0(
            update: (_, __) => devTableState
          ),
        ],
        child: Actions(
          actions: {
            intents.SelectIntent<DeviceDataInterface>: DeviceTableSelect(operator),
            intents.EditIntent: DeviceTableEdit(operator),
            intents.AddIntent: DeviceTableAdd(operator),
            intents.DeleteIntent: DeviceTableDelete(operator),
            intents.SaveIntent: DeviceTableSave(operator),
            intents.FetchAllIntent: DeviceTableFetch(operator),
            intents.CreateIntent<Tuple2<String, ConnectionConfigInterface>>: DeviceTableCreate(operator),
            TestConnectionIntent: CallbackAction(
              onInvoke: (intent) => Get.dialog(const SizedBox(height: 100, width: 100,))
            ),
          },
          child: Obx(() => MultiSplitView(
            axis: Axis.horizontal,
            initialAreas: [
              Area(weight: 1.0 - devProportion.value, minimalSize: 10),
              Area(minimalSize: 100),
            ],
            children: const [
              Framed(child: DeviceTableLayout()),
              Framed(child: DeviceDetails())
            ]
          )),
        ),
      );
    });
  }
}
