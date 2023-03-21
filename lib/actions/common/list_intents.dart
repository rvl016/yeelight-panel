import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model_state.dart';

class SelectIntent<T> extends Intent {
  final T data;

  const SelectIntent(this.data);
}

class ChooseSelectedIntent<T> extends Intent {
  final Rx<ControlState> controlState;

  const ChooseSelectedIntent(this.controlState);
}

class DeleteIntent extends Intent {}

class AddIntent extends Intent {}

class CreateIntent<T> extends Intent {
  final T data;

  const CreateIntent(this.data);
}

class EditIntent extends Intent {}

class SaveIntent extends Intent {}

class FetchAllIntent extends Intent {}