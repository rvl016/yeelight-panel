import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';
import 'package:yeelight_panel/actions/data_binders.dart';
import 'package:yeelight_panel/data/model/device.dart';

import '../bridge_definitions.dart';
import 'action_base.dart';
import 'common/list_intents.dart' as list_intents;


class TestConnectionIntent extends Intent {}

class DeviceTableSelect extends ListActionBase<
  list_intents.SelectIntent<DeviceDataInterface>, DeviceDataInterface, DeviceDataBinder
> {
  DeviceTableSelect(super.data);

  @override
  void invoke(list_intents.SelectIntent<DeviceDataInterface> intent) {
    data.state.selecteditem.value = intent.data;
  }
}

class DeviceTableAdd extends ListActionBase<list_intents.AddIntent, DeviceDataInterface, DeviceDataBinder> {
  DeviceTableAdd(super.data);

  @override
  Object? invoke(list_intents.AddIntent intent) {
    // TODO: implement invoke
    throw UnimplementedError();
  }
}

class DeviceTableDelete extends ListActionBase<list_intents.DeleteIntent, DeviceDataInterface, DeviceDataBinder> {
  DeviceTableDelete(super.data);

  @override
  Object? invoke(list_intents.DeleteIntent intent) {
    // TODO: implement invoke
    throw UnimplementedError();
  }
}

class DeviceTableEdit extends ListActionBase<list_intents.EditIntent, DeviceDataInterface, DeviceDataBinder> {
  DeviceTableEdit(super.data);

  @override
  Object? invoke(list_intents.EditIntent intent) {
    // TODO: implement invoke
    throw UnimplementedError();
  }
}

class DeviceTableSave extends ListActionBase<list_intents.SaveIntent, DeviceDataInterface, DeviceDataBinder> {
  
  DeviceTableSave(super.data);

  @override
  Object? invoke(list_intents.SaveIntent intent) {
    // TODO: implement invoke
    throw UnimplementedError();
  }

}

class DeviceTableFetch extends ListActionBase<list_intents.FetchAllIntent, DeviceDataInterface, DeviceDataBinder> {
  
  DeviceTableFetch(super.data);

  @override
  Future<List<DeviceDataInterface>> invoke(list_intents.FetchAllIntent intent) {
    return data.binder.fetch().then((value) {
      data.state.replaceWith(value);
      data.state.doNeedFetch.value = false;
      return value;
    });
  }

}

class DeviceTableCreate extends ListActionBase<
  list_intents.CreateIntent<Tuple2<String, ConnectionConfigInterface>>, DeviceDataInterface, DeviceDataBinder
> {
  
  DeviceTableCreate(super.data);

  @override
  Future<DeviceDataInterface> invoke(list_intents.CreateIntent<Tuple2<String, ConnectionConfigInterface>> intent) {
    return data.binder.create(intent.data).then((value) {
      data.state.add(value);
      return value;
    });
  }

}