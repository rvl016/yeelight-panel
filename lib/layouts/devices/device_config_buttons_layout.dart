import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morphable_shape/morphable_shape.dart';
import 'package:yeelight_panel/actions/common/list_intents.dart';
import 'package:yeelight_panel/actions/device_table_actions.dart';
import 'package:yeelight_panel/common/primary_button.dart';

class DeviceConfigButtons extends StatelessWidget {

  const DeviceConfigButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PrimaryButton(
          icon: const Icon(Icons.edit), 
          label: const Text("Edit"), 
          onPressed: (ctx) => Actions.invoke(ctx, EditIntent()),
          marginRight: 4,
        ),
        const Spacer(),
        PrimaryButton(
          icon: const Icon(Icons.more_horiz), 
          onPressed: (ctx) => Actions.invoke(ctx, EditIntent()),
          marginRight: 4,
        ),
        //Text("Device Config Buttons"),
      ],
    );
  }
}

         // PrimaryButton(
         //   icon: const Icon(Icons.bug_report), 
         //   label: const Text("Test Connection"), 
         //   onPressed: (ctx) => Actions.invoke(ctx, TestConnectionIntent())
         // ),