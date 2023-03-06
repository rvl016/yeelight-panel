import 'package:flutter/material.dart';

class SelectIntent<T> extends Intent {
  final T data;

  const SelectIntent(this.data);
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