import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';

part 'state.freezed.dart';

@freezed
class DevicesState with _$DevicesState {
  const factory DevicesState({
    required final RxBool deviceDetailsOpen,
    required final RxDouble deviceDetailsProportion,
  }) = _DevicesState;
}

