import 'package:flutter/material.dart';
import 'package:yeelight_panel/actions/common/list_intents.dart';
import 'package:yeelight_panel/common/primary_button.dart';
import 'package:yeelight_panel/layouts/common/dialog.dart';
import 'package:yeelight_panel/widgets/device_add_dialog.dart';

class DeviceListButtons extends StatelessWidget {
  const DeviceListButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PrimaryButton(
          icon: const Icon(Icons.add), 
          label: const Text("Add"), 
          onPressed: DialogWrapper(
            DeviceAddDialog(parentContext: context)
          ).open,
          marginRight: 4,
        ),
        const Spacer(),
        PrimaryButton(
          icon: const Icon(Icons.delete), 
          label: const Text("Delete"), 
          onPressed: (ctx) => Actions.invoke(ctx, DeleteIntent()),
        ),
      ],
    );
  }
}