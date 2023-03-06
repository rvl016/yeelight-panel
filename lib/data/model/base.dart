import 'package:get/get.dart';

mixin Clonable<T> {
  T clone();
}

mixin Data<T> {
  String get id;
}


class Model<T extends Clonable<T>> {
  final Rx<T> original;
  Rx<T>? _modified;

  Rx<T> get modified {
    _modified ??= original.value.clone().obs;
    return _modified!;
  }
  
  Model(this.original);
}
