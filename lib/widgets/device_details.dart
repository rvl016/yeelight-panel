import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:yeelight_panel/bridge_definitions.dart';
import 'package:yeelight_panel/common/data_display/form_fields.dart';
import 'package:yeelight_panel/data/model/device.dart';
import 'package:yeelight_panel/layouts/common/secondary_panel_layout.dart';
import 'package:yeelight_panel/layouts/devices/control_bar_layout.dart';
import 'package:yeelight_panel/layouts/devices/device_config_buttons_layout.dart';

import '../data/model_state.dart';


class DeviceDetails extends StatelessWidget {
  const DeviceDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<Rx<ListPageState<DeviceDataInterface>>>();
    final colors = Get.theme.colorScheme;
    final txt = Get.textTheme;
    return Container(
      child: Obx(() {
        final dev = state.value.selectedItem.value;
        return SecondaryPanelLayout(
          title: "Device Details", 
          children: [Expanded(
            child: Offstage(
              offstage: dev == null,
              child: Container(
                color: colors.onSecondaryContainer,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FieldDisplaySimple(
                            label: "Name", 
                            value: dev?.name
                          ),
                          FieldDisplaySimple(
                            label: "Type",
                            value: (dev?.deviceType ?? DeviceType.Bulb).toText, 
                          ),
                          FieldDisplaySimple(
                            label: "Implementation",
                            value: (dev?.deviceImpl ?? DeviceImpl.None).toText, 
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    const ControlBarLayout(
                      child: DeviceConfigButtons()
                    ),
                  ],
                )
              ),
            ),
          )],
        );
      }),
    );
  }
}


class FieldDisplaySimple extends StatelessWidget {
  const FieldDisplaySimple({
    super.key, 
    required this.label, 
    required this.value
  });

  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    final txt = Get.textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 4
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: txt.labelSmall,
          ),
          Text(
            value ?? "",
            style: txt.bodyLarge,
          ),
        ]
      ),
    );
  }
}