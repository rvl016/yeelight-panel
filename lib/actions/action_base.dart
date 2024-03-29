import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeelight_panel/data/model/base.dart';
import 'package:yeelight_panel/data/model_state.dart';


abstract class ListActionBase<T extends Intent, TS extends Data, TSS extends DataBinder> extends Action<T> {
  final ListPageOperator<TS, TSS> data;

  ListActionBase(this.data);
}

class ListPageOperator<T extends Data, TS extends DataBinder> {
  
  late ListPageState<T> state;
  late TS binder;

  ListPageOperator(this.binder) {
    state = ListPageState();
  }

  ListPageOperator.withData(this.state, this.binder);

  Rx<T> select(String targetId) => state.select(targetId);

  Future<void> removeSelected() {
    if (state.selectedItem.value == null) {
      return Future.value();
    }
    return binder.remove(state.selectedItem.value!.id).then((_) => state.removeSelected());
  }

}


abstract class DataBinder<T> {

  final DataSourceApi source;

  DataBinder(this.source);

  Future<void> remove(String targetId);

  Future<List<T>> fetch();

}
