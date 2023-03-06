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
mixin _$MainMenuState {
  Rx<MenuPanel> get menu => throw _privateConstructorUsedError;
  Rx<DeviceControllerState> get controlPerDevice =>
      throw _privateConstructorUsedError;
  Rx<DeviceControllerState> get controlPerGroup =>
      throw _privateConstructorUsedError;
  Rx<DevicesState> get devices => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainMenuStateCopyWith<MainMenuState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainMenuStateCopyWith<$Res> {
  factory $MainMenuStateCopyWith(
          MainMenuState value, $Res Function(MainMenuState) then) =
      _$MainMenuStateCopyWithImpl<$Res, MainMenuState>;
  @useResult
  $Res call(
      {Rx<MenuPanel> menu,
      Rx<DeviceControllerState> controlPerDevice,
      Rx<DeviceControllerState> controlPerGroup,
      Rx<DevicesState> devices});
}

/// @nodoc
class _$MainMenuStateCopyWithImpl<$Res, $Val extends MainMenuState>
    implements $MainMenuStateCopyWith<$Res> {
  _$MainMenuStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menu = null,
    Object? controlPerDevice = null,
    Object? controlPerGroup = null,
    Object? devices = null,
  }) {
    return _then(_value.copyWith(
      menu: null == menu
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as Rx<MenuPanel>,
      controlPerDevice: null == controlPerDevice
          ? _value.controlPerDevice
          : controlPerDevice // ignore: cast_nullable_to_non_nullable
              as Rx<DeviceControllerState>,
      controlPerGroup: null == controlPerGroup
          ? _value.controlPerGroup
          : controlPerGroup // ignore: cast_nullable_to_non_nullable
              as Rx<DeviceControllerState>,
      devices: null == devices
          ? _value.devices
          : devices // ignore: cast_nullable_to_non_nullable
              as Rx<DevicesState>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MainMenuStateCopyWith<$Res>
    implements $MainMenuStateCopyWith<$Res> {
  factory _$$_MainMenuStateCopyWith(
          _$_MainMenuState value, $Res Function(_$_MainMenuState) then) =
      __$$_MainMenuStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Rx<MenuPanel> menu,
      Rx<DeviceControllerState> controlPerDevice,
      Rx<DeviceControllerState> controlPerGroup,
      Rx<DevicesState> devices});
}

/// @nodoc
class __$$_MainMenuStateCopyWithImpl<$Res>
    extends _$MainMenuStateCopyWithImpl<$Res, _$_MainMenuState>
    implements _$$_MainMenuStateCopyWith<$Res> {
  __$$_MainMenuStateCopyWithImpl(
      _$_MainMenuState _value, $Res Function(_$_MainMenuState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menu = null,
    Object? controlPerDevice = null,
    Object? controlPerGroup = null,
    Object? devices = null,
  }) {
    return _then(_$_MainMenuState(
      menu: null == menu
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as Rx<MenuPanel>,
      controlPerDevice: null == controlPerDevice
          ? _value.controlPerDevice
          : controlPerDevice // ignore: cast_nullable_to_non_nullable
              as Rx<DeviceControllerState>,
      controlPerGroup: null == controlPerGroup
          ? _value.controlPerGroup
          : controlPerGroup // ignore: cast_nullable_to_non_nullable
              as Rx<DeviceControllerState>,
      devices: null == devices
          ? _value.devices
          : devices // ignore: cast_nullable_to_non_nullable
              as Rx<DevicesState>,
    ));
  }
}

/// @nodoc

class _$_MainMenuState implements _MainMenuState {
  const _$_MainMenuState(
      {required this.menu,
      required this.controlPerDevice,
      required this.controlPerGroup,
      required this.devices});

  @override
  final Rx<MenuPanel> menu;
  @override
  final Rx<DeviceControllerState> controlPerDevice;
  @override
  final Rx<DeviceControllerState> controlPerGroup;
  @override
  final Rx<DevicesState> devices;

  @override
  String toString() {
    return 'MainMenuState(menu: $menu, controlPerDevice: $controlPerDevice, controlPerGroup: $controlPerGroup, devices: $devices)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MainMenuState &&
            (identical(other.menu, menu) || other.menu == menu) &&
            (identical(other.controlPerDevice, controlPerDevice) ||
                other.controlPerDevice == controlPerDevice) &&
            (identical(other.controlPerGroup, controlPerGroup) ||
                other.controlPerGroup == controlPerGroup) &&
            (identical(other.devices, devices) || other.devices == devices));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, menu, controlPerDevice, controlPerGroup, devices);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MainMenuStateCopyWith<_$_MainMenuState> get copyWith =>
      __$$_MainMenuStateCopyWithImpl<_$_MainMenuState>(this, _$identity);
}

abstract class _MainMenuState implements MainMenuState {
  const factory _MainMenuState(
      {required final Rx<MenuPanel> menu,
      required final Rx<DeviceControllerState> controlPerDevice,
      required final Rx<DeviceControllerState> controlPerGroup,
      required final Rx<DevicesState> devices}) = _$_MainMenuState;

  @override
  Rx<MenuPanel> get menu;
  @override
  Rx<DeviceControllerState> get controlPerDevice;
  @override
  Rx<DeviceControllerState> get controlPerGroup;
  @override
  Rx<DevicesState> get devices;
  @override
  @JsonKey(ignore: true)
  _$$_MainMenuStateCopyWith<_$_MainMenuState> get copyWith =>
      throw _privateConstructorUsedError;
}
