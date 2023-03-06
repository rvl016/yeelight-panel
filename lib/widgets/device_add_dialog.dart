import 'dart:async';
import 'dart:math';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tuple/tuple.dart';
import 'package:yeelight_panel/actions/common/list_intents.dart';
import 'package:yeelight_panel/bridge_definitions.dart';
import 'package:yeelight_panel/common/data_display/form_fields.dart';
import 'package:yeelight_panel/layouts/common/dialog.dart';

class DeviceAddDialog extends StatefulWidget {
  const DeviceAddDialog({required this.parentContext, Key? key}) : super(key: key);

  final BuildContext parentContext;

  @override
  State<DeviceAddDialog> createState() => _DeviceAddDialogState();
}

class _DeviceAddDialogState extends State<DeviceAddDialog> {

  final RxString name = "".obs;
  final RxInt port = 0.obs;
  final Rx<U8Array4> ip = U8Array4(Uint8List.fromList([0, 0, 0, 0])).obs;
  final RxBool isEnabled = true.obs;
  final Rxn<DialogHeaderProvider> headerProvider = Rxn();

  late MaskedTextController ipController;

  @override
  void initState() {
    super.initState();
    ipController = MaskedTextController(
      text: _ipToString(ip.value),
      mask: "000.000.000.000",
      afterChange: (previous, next) => ip.value = U8Array4(Uint8List.fromList(
        _ipFromString(next).map((v) => min(v, 255)).toList()
      )),
    );
  }

  @override
  void dispose() { 
    ipController.dispose(); 
    super.dispose();
  }

  void confirm(BuildContext context) {
    headerProvider.value = DialogHeaderProvider(
      message: "Connecting, please wait...",
      backgroundColor: ThemeColors(context).infoColor()
    );
    (Actions.invoke(context, CreateIntent(Tuple2(
      name.value, 
      ConnectionConfigInterface(ipV4: IPv4ConnectionInteface(ip: ip.value, port: port.value))
    ))) as Future<DeviceDataInterface>)
      .onError((error, _) {
        headerProvider.value = DialogHeaderProvider(
          message: (error as List<DeviceDetectErrorItem>).map((e) => "${e.field0}: ${e.field1}").join("\n"),
          backgroundColor: ThemeColors(context).errorColor(),
        );
        return Future.value(DeviceDataInterface(
          id: '', name: "", capabilities: [], deviceImpl: DeviceImpl.None, deviceType: DeviceType.Bulb
        ));
      })
      .whenComplete(() => isEnabled.value = true);
    isEnabled.value = false;
  }

  U8Array4 _ipFromString(String v) => U8Array4(Uint8List.fromList(
    List.filled(4, 0)..setAll(0, v.split('.').map((e) => int.tryParse(e) ?? 0))
  ));

  String _ipToString(U8Array4 v) { 
    f(int v) => v.toString().padLeft(3, '0');
    return "${f(v[0])}.${f(v[1])}.${f(v[2])}.${f(v[3])}";
  }

  @override
  Widget build(BuildContext context) {
    return InputDialog(
      parentContext: widget.parentContext,
      title: "Add Device",
      headerProvider: headerProvider,
      formBody: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            FormFieldText.string("Device Name", name, isEnabled: isEnabled),
            FormFieldText(
              label: "IPv4",
              provider: FormFieldValueProvider<U8Array4>(
                ip, 
                fromStringVal: _ipFromString,
                toStringVal: _ipToString,
                canWrite: isEnabled
              ),
              controller: ipController,
              isEnabled: isEnabled, 
            ),
            FormFieldText(
              label: "Port",
              provider: FormFieldValueProvider(
                port, 
                fromStringVal: (v) => int.parse(v),
                toStringVal: (v) => v.toString(),
                canWrite: isEnabled
              ),
              isEnabled: isEnabled,
            ),
          ],
        ),
      ),
      confirmLabel: "Find It",
      confirm: confirm,
      isEnabled: isEnabled,
    );
  }
}
