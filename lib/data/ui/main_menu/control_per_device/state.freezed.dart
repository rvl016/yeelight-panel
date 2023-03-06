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
mixin _$DeviceControllerState {
  Rx<DeviceControllerLayoutMode> get mode => throw _privateConstructorUsedError;
  RxDouble get groupsColumProportion => throw _privateConstructorUsedError;
  RxDouble get profilesColumProportion => throw _privateConstructorUsedError;
  Rx<DeviceControlModeState> get deviceStatePanel =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeviceControllerStateCopyWith<DeviceControllerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceControllerStateCopyWith<$Res> {
  factory $DeviceControllerStateCopyWith(DeviceControllerState value,
          $Res Function(DeviceControllerState) then) =
      _$DeviceControllerStateCopyWithImpl<$Res, DeviceControllerState>;
  @useResult
  $Res call(
      {Rx<DeviceControllerLayoutMode> mode,
      RxDouble groupsColumProportion,
      RxDouble profilesColumProportion,
      Rx<DeviceControlModeState> deviceStatePanel});
}

/// @nodoc
class _$DeviceControllerStateCopyWithImpl<$Res,
        $Val extends DeviceControllerState>
    implements $DeviceControllerStateCopyWith<$Res> {
  _$DeviceControllerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? groupsColumProportion = null,
    Object? profilesColumProportion = null,
    Object? deviceStatePanel = null,
  }) {
    return _then(_value.copyWith(
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as Rx<DeviceControllerLayoutMode>,
      groupsColumProportion: null == groupsColumProportion
          ? _value.groupsColumProportion
          : groupsColumProportion // ignore: cast_nullable_to_non_nullable
              as RxDouble,
      profilesColumProportion: null == profilesColumProportion
          ? _value.profilesColumProportion
          : profilesColumProportion // ignore: cast_nullable_to_non_nullable
              as RxDouble,
      deviceStatePanel: null == deviceStatePanel
          ? _value.deviceStatePanel
          : deviceStatePanel // ignore: cast_nullable_to_non_nullable
              as Rx<DeviceControlModeState>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeviceControllerStateCopyWith<$Res>
    implements $DeviceControllerStateCopyWith<$Res> {
  factory _$$_DeviceControllerStateCopyWith(_$_DeviceControllerState value,
          $Res Function(_$_DeviceControllerState) then) =
      __$$_DeviceControllerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Rx<DeviceControllerLayoutMode> mode,
      RxDouble groupsColumProportion,
      RxDouble profilesColumProportion,
      Rx<DeviceControlModeState> deviceStatePanel});
}

/// @nodoc
class __$$_DeviceControllerStateCopyWithImpl<$Res>
    extends _$DeviceControllerStateCopyWithImpl<$Res, _$_DeviceControllerState>
    implements _$$_DeviceControllerStateCopyWith<$Res> {
  __$$_DeviceControllerStateCopyWithImpl(_$_DeviceControllerState _value,
      $Res Function(_$_DeviceControllerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? groupsColumProportion = null,
    Object? profilesColumProportion = null,
    Object? deviceStatePanel = null,
  }) {
    return _then(_$_DeviceControllerState(
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as Rx<DeviceControllerLayoutMode>,
      groupsColumProportion: null == groupsColumProportion
          ? _value.groupsColumProportion
          : groupsColumProportion // ignore: cast_nullable_to_non_nullable
              as RxDouble,
      profilesColumProportion: null == profilesColumProportion
          ? _value.profilesColumProportion
          : profilesColumProportion // ignore: cast_nullable_to_non_nullable
              as RxDouble,
      deviceStatePanel: null == deviceStatePanel
          ? _value.deviceStatePanel
          : deviceStatePanel // ignore: cast_nullable_to_non_nullable
              as Rx<DeviceControlModeState>,
    ));
  }
}

/// @nodoc

class _$_DeviceControllerState implements _DeviceControllerState {
  const _$_DeviceControllerState(
      {required this.mode,
      required this.groupsColumProportion,
      required this.profilesColumProportion,
      required this.deviceStatePanel});

  @override
  final Rx<DeviceControllerLayoutMode> mode;
  @override
  final RxDouble groupsColumProportion;
  @override
  final RxDouble profilesColumProportion;
  @override
  final Rx<DeviceControlModeState> deviceStatePanel;

  @override
  String toString() {
    return 'DeviceControllerState(mode: $mode, groupsColumProportion: $groupsColumProportion, profilesColumProportion: $profilesColumProportion, deviceStatePanel: $deviceStatePanel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeviceControllerState &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.groupsColumProportion, groupsColumProportion) ||
                other.groupsColumProportion == groupsColumProportion) &&
            (identical(
                    other.profilesColumProportion, profilesColumProportion) ||
                other.profilesColumProportion == profilesColumProportion) &&
            (identical(other.deviceStatePanel, deviceStatePanel) ||
                other.deviceStatePanel == deviceStatePanel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mode, groupsColumProportion,
      profilesColumProportion, deviceStatePanel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeviceControllerStateCopyWith<_$_DeviceControllerState> get copyWith =>
      __$$_DeviceControllerStateCopyWithImpl<_$_DeviceControllerState>(
          this, _$identity);
}

abstract class _DeviceControllerState implements DeviceControllerState {
  const factory _DeviceControllerState(
          {required final Rx<DeviceControllerLayoutMode> mode,
          required final RxDouble groupsColumProportion,
          required final RxDouble profilesColumProportion,
          required final Rx<DeviceControlModeState> deviceStatePanel}) =
      _$_DeviceControllerState;

  @override
  Rx<DeviceControllerLayoutMode> get mode;
  @override
  RxDouble get groupsColumProportion;
  @override
  RxDouble get profilesColumProportion;
  @override
  Rx<DeviceControlModeState> get deviceStatePanel;
  @override
  @JsonKey(ignore: true)
  _$$_DeviceControllerStateCopyWith<_$_DeviceControllerState> get copyWith =>
      throw _privateConstructorUsedError;
}
