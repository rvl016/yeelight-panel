import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';
import 'package:get/get.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:provider/provider.dart';
import 'package:yeelight_panel/actions/action_base.dart';
import 'package:yeelight_panel/actions/data_binders.dart';
import 'package:yeelight_panel/actions/device_table_actions.dart';
import 'package:yeelight_panel/bridge_definitions.dart';
import 'package:yeelight_panel/common/framed.dart';
import 'package:yeelight_panel/data/app_state.dart';
import 'package:yeelight_panel/actions/common/list_intents.dart' as intents;
import 'package:yeelight_panel/data/model/device.dart';
import 'package:yeelight_panel/layouts/common/secondary_panel_layout.dart';
import 'package:yeelight_panel/widgets/common/list.dart';

import '../../data/model_state.dart';
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
      final mode = state.mode.value;
      final profiles = state.mode.value == DeviceControllerLayoutMode.perGroup
        ? modelState.mainPanelGroupProfiles : modelState.mainPanelDeviceProfiles;
      final devicesList = modelState.statedDevicesPageState;
      final selectedDevice = devicesList.value.selectedItem;

      final source = context.watch<Rx<DataSourceApi>>().value;
      final operator = ListPageOperator.withData(devicesList.value, DeviceBinder(source));

      return MultiProvider(
        providers: [
          ProxyProvider0(update: (_, __) => selectedDevice),
          ProxyProvider0(update: (_, __) => operator),
          ProxyProvider0(update: (_, __) => devicesList),
        ],
        child: MultiSplitView(
          axis: Axis.horizontal,
          initialAreas: getPanelAreas(state, mode),
          children: getPanels(state, mode, profiles),
        ),
      );
    });

  }
  
  List<Area> getPanelAreas(DeviceControllerState state, DeviceControllerLayoutMode mode) {
    final area = [Area(weight: 1.0 - state.groupsColumProportion.value - state.profilesColumProportion.value)];
    if (mode == DeviceControllerLayoutMode.perGroup) {
      area.insert(0, Area(weight: state.groupsColumProportion.value));
    }
    return area;
  }

  List<Widget> getPanels(
    DeviceControllerState state, 
    DeviceControllerLayoutMode mode, 
    Rx<ListPageState<ProfileInterface>> profiles
  ) {
    final List<Widget> profileListRows = [
      const Framed(child: ProfileList())
    ];
    if (mode == DeviceControllerLayoutMode.perDevice) {
      profileListRows.insert(profileListRows.length, const Framed(child: StatedDeviceSelector()));
    }

    final panels = [
      ProxyProvider0(
        update: (_, __) => state.controlPanels,
        child: const Framed(child: DeviceControlModeLayout())
      ),
      Framed(
        child: MultiProvider(
          providers: [
            ProxyProvider0(update: (_, __) => profiles),
            ProxyProvider0(update: (_, __) => state.controlPanels),
          ],
          child: ProxyProvider0(
            update: (_, __) => profiles,
            child: Column(
              children: profileListRows,
            )
          ),
        ),
      ),
    ];

    if (mode == DeviceControllerLayoutMode.perGroup) {
      panels.insert(0, const Framed(child: DeviceGroups()));
    }
    return panels;
  }
}

class StatedDeviceSelector extends StatelessWidget {
  const StatedDeviceSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final operator = context.watch<ListPageOperator<DeviceInterface, DeviceBinder>>();
    return Actions(
      actions: {
        intents.SelectIntent<DeviceInterface>: DataTableSelect(operator),
        intents.FetchAllIntent: DataTableFetch<DeviceInterface, DeviceBinder>(operator),
        intents.ChooseSelectedIntent: DeviceTableChooseSelected(operator),
      },
      child: const StatedDevicesList(),
    );
  }
}

class StatedDevicesList extends StatelessWidget {
  const StatedDevicesList({
    super.key,
  });

  void initData(BuildContext context) {
    final operator = context.read<ListPageOperator<DeviceInterface, DeviceBinder>>();
    if (operator.state.doNeedFetch.isTrue) {
      Actions.invoke(context, intents.FetchAllIntent());
    }
  }

  @override
  Widget build(BuildContext context) {
    initData(context);
    final operator = context.watch<ListPageOperator<DeviceInterface, DeviceBinder>>();
    final state = context.watch<Rx<ListPageState<DeviceInterface>>>();
    final colors = Get.theme.colorScheme;
    return Obx(() {
      final items = operator.state.items;
      final needFetch = operator.state.doNeedFetch.isTrue;
      return ConditionalSwitch.single(
        context: context, 
        valueBuilder: (ctx) => needFetch, 
        caseBuilders: {
          true: (ctx) => Container(
            child: const Text("Loading..."),
          ),
          false: (ctx) => ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, idx) => Obx(() {
              final item = items[idx];
              final dev = item.value.metadata;
              return SelectableListTile(
                state: state,
                bgColor: colors.onPrimaryContainer,
                item: item,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                      vertical: BorderSide(
                        color: colors.onSecondaryContainer,
                        width: 1.5
                      ),
                      horizontal: BorderSide(
                        color: colors.onSecondaryContainer,
                        width: .5
                      ),
                    )
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        color: colors.onTertiaryContainer,
                        child: Icon(
                          dev.deviceType.toIconData,
                          size: 20,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 24,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4
                          ),
                          alignment: Alignment.centerLeft,
                          color: colors.onPrimaryContainer,
                          child: Text(
                            dev.name,
                          ),
                        )
                      ),
                    ]
                  ),
                ),
              );
            })
          ),
        }, 
        fallbackBuilder: (ctx) => const SizedBox.shrink()
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
    final state = context.watch<Rx<ListPageState<ProfileInterface>>>();
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
                Container(child: Text(profile.data.when(
                  none: () => "", 
                  single: (dt) => "Single", 
                  multiple: (dt) => "Group"
                )))
              ]
            ))
          );
        }
      )),
    );
  }
}


class DeviceDetail extends StatelessWidget {
  const DeviceDetail(this.device, {super.key});
  
  final Rxn<DeviceInterface> device;

  @override
  Widget build(BuildContext context) {
    return SecondaryPanelLayout(
      title: "Current Device",
      children: [Obx(() => Column(
        children: [
          Text(device.value?.metadata.name ?? "")
        ],
      ))],
    );
  }
}