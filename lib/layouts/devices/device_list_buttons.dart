import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:yeelight_panel/actions/common/list_intents.dart';
import 'package:yeelight_panel/bridge_definitions.dart';
import 'package:yeelight_panel/common/primary_button.dart';
import 'package:yeelight_panel/data/model_state.dart';
import 'package:yeelight_panel/layouts/common/dialog.dart';
import 'package:yeelight_panel/widgets/device_add_dialog.dart';

class DeviceListButtons extends StatelessWidget {
  const DeviceListButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<Rx<ListPageState<DeviceDataInterface>>>();
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
        Obx(() => Visibility(
          visible: state.value.selectedItem.value != null,
          child: PrimaryButton(
            icon: const Icon(Icons.delete), 
            label: const Text("Delete"), 
            onPressed: (ctx) => Actions.invoke(ctx, DeleteIntent()),
          ),
        )),
      ],
    );
  }
}