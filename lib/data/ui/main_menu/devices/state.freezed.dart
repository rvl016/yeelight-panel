// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DevicesState {
  RxBool get deviceDetailsOpen => throw _privateConstructorUsedError;
  RxDouble get deviceDetailsProportion => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DevicesStateCopyWith<DevicesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DevicesStateCopyWith<$Res> {
  factory $DevicesStateCopyWith(
          DevicesState value, $Res Function(DevicesState) then) =
      _$DevicesStateCopyWithImpl<$Res, DevicesState>;
  @useResult
  $Res call({RxBool deviceDetailsOpen, RxDouble deviceDetailsProportion});
}

/// @nodoc
class _$DevicesStateCopyWithImpl<$Res, $Val extends DevicesState>
    implements $DevicesStateCopyWith<$Res> {
  _$DevicesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceDetailsOpen = null,
    Object? deviceDetailsProportion = null,
  }) {
    return _then(_value.copyWith(
      deviceDetailsOpen: null == deviceDetailsOpen
          ? _value.deviceDetailsOpen
          : deviceDetailsOpen // ignore: cast_nullable_to_non_nullable
              as RxBool,
      deviceDetailsProportion: null == deviceDetailsProportion
          ? _value.deviceDetailsProportion
          : deviceDetailsProportion // ignore: cast_nullable_to_non_nullable
              as RxDouble,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DevicesStateCopyWith<$Res>
    implements $DevicesStateCopyWith<$Res> {
  factory _$$_DevicesStateCopyWith(
          _$_DevicesState value, $Res Function(_$_DevicesState) then) =
      __$$_DevicesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RxBool deviceDetailsOpen, RxDouble deviceDetailsProportion});
}

/// @nodoc
class __$$_DevicesStateCopyWithImpl<$Res>
    extends _$DevicesStateCopyWithImpl<$Res, _$_DevicesState>
    implements _$$_DevicesStateCopyWith<$Res> {
  __$$_DevicesStateCopyWithImpl(
      _$_DevicesState _value, $Res Function(_$_DevicesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceDetailsOpen = null,
    Object? deviceDetailsProportion = null,
  }) {
    return _then(_$_DevicesState(
      deviceDetailsOpen: null == deviceDetailsOpen
          ? _value.deviceDetailsOpen
          : deviceDetailsOpen // ignore: cast_nullable_to_non_nullable
              as RxBool,
      deviceDetailsProportion: null == deviceDetailsProportion
          ? _value.deviceDetailsProportion
          : deviceDetailsProportion // ignore: cast_nullable_to_non_nullable
              as RxDouble,
    ));
  }
}

/// @nodoc

class _$_DevicesState implements _DevicesState {
  const _$_DevicesState(
      {required this.deviceDetailsOpen, required this.deviceDetailsProportion});

  @override
  final RxBool deviceDetailsOpen;
  @override
  final RxDouble deviceDetailsProportion;

  @override
  String toString() {
    return 'DevicesState(deviceDetailsOpen: $deviceDetailsOpen, deviceDetailsProportion: $deviceDetailsProportion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DevicesState &&
            (identical(other.deviceDetailsOpen, deviceDetailsOpen) ||
                other.deviceDetailsOpen == deviceDetailsOpen) &&
            (identical(
                    other.deviceDetailsProportion, deviceDetailsProportion) ||
                other.deviceDetailsProportion == deviceDetailsProportion));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, deviceDetailsOpen, deviceDetailsProportion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DevicesStateCopyWith<_$_DevicesState> get copyWith =>
      __$$_DevicesStateCopyWithImpl<_$_DevicesState>(this, _$identity);
}

abstract class _DevicesState implements DevicesState {
  const factory _DevicesState(
      {required final RxBool deviceDetailsOpen,
      required final RxDouble deviceDetailsProportion}) = _$_DevicesState;

  @override
  RxBool get deviceDetailsOpen;
  @override
  RxDouble get deviceDetailsProportion;
  @override
  @JsonKey(ignore: true)
  _$$_DevicesStateCopyWith<_$_DevicesState> get copyWith =>
      throw _privateConstructorUsedError;
}
