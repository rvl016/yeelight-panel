
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:yeelight_panel/actions/action_base.dart';
import 'package:yeelight_panel/actions/common/list_intents.dart' as intents;
import 'package:yeelight_panel/actions/data_binders.dart';
import 'package:yeelight_panel/actions/device_table_actions.dart';
import 'package:yeelight_panel/data/model/device.dart';
import 'package:yeelight_panel/data/model_state.dart';
import 'package:yeelight_panel/widgets/devices_list.dart';

import '../../bridge_definitions.dart';
import 'control_bar_layout.dart';
import 'device_list_buttons.dart';

class DeviceTableLayout extends StatelessWidget {
  const DeviceTableLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Expanded(child: DevicesList()),
        ControlBarLayout(
          child: DeviceListButtons(),
        )
      ],
    );
  }
}



