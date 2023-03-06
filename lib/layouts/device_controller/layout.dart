import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:provider/provider.dart';
import 'package:yeelight_panel/common/framed.dart';
import 'package:yeelight_panel/data/model/profile.dart';
import 'package:yeelight_panel/data/ui/main_menu/control_per_device/state.dart';

import '../../data/model_state.dart';
import '../../menus/control_menu.dart';
import 'device_control_mode_layout.dart';


class DeviceControllerLayout extends StatelessWidget {
  
  const DeviceControllerLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final stateObs = context.watch<Rx<DeviceControllerState>>();
    final modelStateObs = context.watch<Rx<ModelState>>();

    return Obx(() {
      final state = stateObs.value;
      final modelState = modelStateObs.value;
      final profiles = state.mode.value == DeviceControllerLayoutMode.perGroup
        ? modelState.mainPanelGroupProfiles : modelState.mainPanelDeviceProfiles;
      final mode = state.mode.value;
      return MultiSplitView(
        axis: Axis.horizontal,
        initialAreas: [
          Area(weight: state.groupsColumProportion.value),
          Area(weight: 1.0 - state.groupsColumProportion.value - state.profilesColumProportion.value),
        ],
        children: [
          Visibility(
            visible: mode == DeviceControllerLayoutMode.perGroup,
            child: const Framed(child: DeviceGroups()),
          ),
          Provider(
            create: (_) => state.deviceStatePanel,
            child: const Framed(child: DeviceControlModeLayout())
          ),
          Framed(
            child: Column(
              children: [
                Provider(
                  create: (ctx) => profiles,
                  child: const ProfileList()
                ),
                Visibility(
                  visible: mode == DeviceControllerLayoutMode.perDevice,
                  child: const DeviceDetail()
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}

class DeviceGroups extends StatelessWidget {
  const DeviceGroups({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Device Groups"));
  }
}

class ProfileList extends StatelessWidget {
  const ProfileList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<Rx<ListPageState<Profile>>>();
    return Container(
      child: Obx(() => ListView.builder(
        shrinkWrap: true,
        itemCount: state.value.items.length,
        itemBuilder: (context, index) { 
          final profile = state.value.at(index).value;
          return Container(
            child: Obx(() => Row(
              children: [
                Container(child: Text(profile.name)),
                Container(child: Text(profile.config.type.text))
              ]
            ))
          );
        }
      )),
    );
  }
}


class DeviceDetail extends StatelessWidget {
  const DeviceDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}