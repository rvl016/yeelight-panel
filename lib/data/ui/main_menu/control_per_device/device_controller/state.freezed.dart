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
mixin _$DeviceControlModeState {
  Rx<ControlMenuPanel> get menu => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeviceControlModeStateCopyWith<DeviceControlModeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceControlModeStateCopyWith<$Res> {
  factory $DeviceControlModeStateCopyWith(DeviceControlModeState value,
          $Res Function(DeviceControlModeState) then) =
      _$DeviceControlModeStateCopyWithImpl<$Res, DeviceControlModeState>;
  @useResult
  $Res call({Rx<ControlMenuPanel> menu});
}

/// @nodoc
class _$DeviceControlModeStateCopyWithImpl<$Res,
        $Val extends DeviceControlModeState>
    implements $DeviceControlModeStateCopyWith<$Res> {
  _$DeviceControlModeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menu = null,
  }) {
    return _then(_value.copyWith(
      menu: null == menu
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as Rx<ControlMenuPanel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeviceControlModeStateCopyWith<$Res>
    implements $DeviceControlModeStateCopyWith<$Res> {
  factory _$$_DeviceControlModeStateCopyWith(_$_DeviceControlModeState value,
          $Res Function(_$_DeviceControlModeState) then) =
      __$$_DeviceControlModeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Rx<ControlMenuPanel> menu});
}

/// @nodoc
class __$$_DeviceControlModeStateCopyWithImpl<$Res>
    extends _$DeviceControlModeStateCopyWithImpl<$Res,
        _$_DeviceControlModeState>
    implements _$$_DeviceControlModeStateCopyWith<$Res> {
  __$$_DeviceControlModeStateCopyWithImpl(_$_DeviceControlModeState _value,
      $Res Function(_$_DeviceControlModeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menu = null,
  }) {
    return _then(_$_DeviceControlModeState(
      menu: null == menu
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as Rx<ControlMenuPanel>,
    ));
  }
}

/// @nodoc

class _$_DeviceControlModeState implements _DeviceControlModeState {
  const _$_DeviceControlModeState({required this.menu});

  @override
  final Rx<ControlMenuPanel> menu;

  @override
  String toString() {
    return 'DeviceControlModeState(menu: $menu)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeviceControlModeState &&
            (identical(other.menu, menu) || other.menu == menu));
  }

  @override
  int get hashCode => Object.hash(runtimeType, menu);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeviceControlModeStateCopyWith<_$_DeviceControlModeState> get copyWith =>
      __$$_DeviceControlModeStateCopyWithImpl<_$_DeviceControlModeState>(
          this, _$identity);
}

abstract class _DeviceControlModeState implements DeviceControlModeState {
  const factory _DeviceControlModeState(
      {required final Rx<ControlMenuPanel> menu}) = _$_DeviceControlModeState;

  @override
  Rx<ControlMenuPanel> get menu;
  @override
  @JsonKey(ignore: true)
  _$$_DeviceControlModeStateCopyWith<_$_DeviceControlModeState> get copyWith =>
      throw _privateConstructorUsedError;
}
