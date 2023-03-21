import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';
import 'package:yeelight_panel/actions/data_binders.dart';
import 'package:yeelight_panel/data/model/base.dart';
import 'package:yeelight_panel/data/model/device.dart';
import 'package:yeelight_panel/data/model_state.dart';

import '../bridge_definitions.dart';
import '../data/app_state.dart';
import 'action_base.dart';
import 'common/list_intents.dart' as list_intents;


class TestConnectionIntent extends Intent {}

class DataTableSelect<DtInterf extends Data, DtBind extends DataBinder> 
  extends ListActionBase<list_intents.SelectIntent<DtInterf>, DtInterf, DtBind> 
{
  DataTableSelect(super.data);

  @override
  void invoke(list_intents.SelectIntent<DtInterf> intent) {
    data.select(intent.data.id);
  }
}

class DeviceTableChooseSelected extends ListActionBase<
  list_intents.ChooseSelectedIntent, DeviceInterface, DeviceBinder
> {

  DeviceTableChooseSelected(super.data);

  @override
  Future<DeviceStateInterface> invoke(list_intents.ChooseSelectedIntent intent) {
    final dev = data.state.selectedItem.value!;
    final controlState = intent.controlState;
    return controlState.value.maybeWhen(
      one: (device, state) {
        device.value = dev;
        return data.binder.getDeviceState(dev).then((value) => state.value = value);
      }, 
      multi: (devices, state) {
        devices.addIf(devices.firstWhereOrNull((d) => d.id == dev.id) == null, dev);
        return Future.value(state.value);
      },
      orElse: () => throw UnimplementedError()
    );
  }
}

class DeviceDataTableAdd extends ListActionBase<list_intents.AddIntent, DeviceDataInterface, DeviceDataBinder> {
  DeviceDataTableAdd(super.data);

  @override
  Object? invoke(list_intents.AddIntent intent) {
    // TODO: implement invoke
    throw UnimplementedError();
  }
}

class DataTableDelete<DtInterf extends Data, DtBind extends DataBinder> 
  extends ListActionBase<list_intents.DeleteIntent, DtInterf, DtBind> 
{
  DataTableDelete(super.data);

  @override
  Future<void> invoke(list_intents.DeleteIntent intent) {
    return data.removeSelected();
  }
}


class DeviceDataTableEdit extends ListActionBase<list_intents.EditIntent, DeviceDataInterface, DeviceDataBinder> {
  DeviceDataTableEdit(super.data);

  @override
  Object? invoke(list_intents.EditIntent intent) {
    // TODO: implement invoke
    throw UnimplementedError();
  }
}

class DeviceDataTableSave extends ListActionBase<list_intents.SaveIntent, DeviceDataInterface, DeviceDataBinder> {
  
  DeviceDataTableSave(super.data);

  @override
  Object? invoke(list_intents.SaveIntent intent) {
    // TODO: implement invoke
    throw UnimplementedError();
  }

}

class DataTableFetch<DtInterf extends Data, DtBind extends DataBinder<DtInterf>> 
  extends ListActionBase<list_intents.FetchAllIntent, DtInterf, DtBind> 
{
  
  DataTableFetch(super.data);

  @override
  Future<List<DtInterf>> invoke(list_intents.FetchAllIntent intent) {
    return data.binder.fetch().then((value) {
      data.state.replaceWith(value);
      data.state.doNeedFetch.value = false;
      return value;
    }).onError((error, stackTrace) => throw Exception(error));
  }

}

class DeviceDataTableCreate extends ListActionBase<
  list_intents.CreateIntent<Tuple2<String, ConnectionConfigInterface>>, DeviceDataInterface, DeviceDataBinder
> {
  
  DeviceDataTableCreate(super.data);

  @override
  Future<DeviceDataInterface> invoke(list_intents.CreateIntent<Tuple2<String, ConnectionConfigInterface>> intent) {
    return data.binder.create(intent.data).then((value) {
      data.state.add(value);
      return value;
    });
  }

}