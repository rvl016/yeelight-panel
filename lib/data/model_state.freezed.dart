// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ControlState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(
            Rxn<DeviceInterface> device, Rxn<DeviceStateInterface> state)
        one,
    required TResult Function(
            RxList<DeviceInterface> devices, Rxn<DeviceStateInterface> state)
        multi,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(
            Rxn<DeviceInterface> device, Rxn<DeviceStateInterface> state)?
        one,
    TResult? Function(
            RxList<DeviceInterface> devices, Rxn<DeviceStateInterface> state)?
        multi,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(
            Rxn<DeviceInterface> device, Rxn<DeviceStateInterface> state)?
        one,
    TResult Function(
            RxList<DeviceInterface> devices, Rxn<DeviceStateInterface> state)?
        multi,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ControlStateNone value) none,
    required TResult Function(ControlStateOne value) one,
    required TResult Function(ControlStateMulti value) multi,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ControlStateNone value)? none,
    TResult? Function(ControlStateOne value)? one,
    TResult? Function(ControlStateMulti value)? multi,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ControlStateNone value)? none,
    TResult Function(ControlStateOne value)? one,
    TResult Function(ControlStateMulti value)? multi,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ControlStateCopyWith<$Res> {
  factory $ControlStateCopyWith(
          ControlState value, $Res Function(ControlState) then) =
      _$ControlStateCopyWithImpl<$Res, ControlState>;
}

/// @nodoc
class _$ControlStateCopyWithImpl<$Res, $Val extends ControlState>
    implements $ControlStateCopyWith<$Res> {
  _$ControlStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ControlStateNoneCopyWith<$Res> {
  factory _$$ControlStateNoneCopyWith(
          _$ControlStateNone value, $Res Function(_$ControlStateNone) then) =
      __$$ControlStateNoneCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ControlStateNoneCopyWithImpl<$Res>
    extends _$ControlStateCopyWithImpl<$Res, _$ControlStateNone>
    implements _$$ControlStateNoneCopyWith<$Res> {
  __$$ControlStateNoneCopyWithImpl(
      _$ControlStateNone _value, $Res Function(_$ControlStateNone) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ControlStateNone implements ControlStateNone {
  const _$ControlStateNone();

  @override
  String toString() {
    return 'ControlState.none()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ControlStateNone);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(
            Rxn<DeviceInterface> device, Rxn<DeviceStateInterface> state)
        one,
    required TResult Function(
            RxList<DeviceInterface> devices, Rxn<DeviceStateInterface> state)
        multi,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(
            Rxn<DeviceInterface> device, Rxn<DeviceStateInterface> state)?
        one,
    TResult? Function(
            RxList<DeviceInterface> devices, Rxn<DeviceStateInterface> state)?
        multi,
  }) {
    return none?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(
            Rxn<DeviceInterface> device, Rxn<DeviceStateInterface> state)?
        one,
    TResult Function(
            RxList<DeviceInterface> devices, Rxn<DeviceStateInterface> state)?
        multi,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ControlStateNone value) none,
    required TResult Function(ControlStateOne value) one,
    required TResult Function(ControlStateMulti value) multi,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ControlStateNone value)? none,
    TResult? Function(ControlStateOne value)? one,
    TResult? Function(ControlStateMulti value)? multi,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ControlStateNone value)? none,
    TResult Function(ControlStateOne value)? one,
    TResult Function(ControlStateMulti value)? multi,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class ControlStateNone implements ControlState {
  const factory ControlStateNone() = _$ControlStateNone;
}

/// @nodoc
abstract class _$$ControlStateOneCopyWith<$Res> {
  factory _$$ControlStateOneCopyWith(
          _$ControlStateOne value, $Res Function(_$ControlStateOne) then) =
      __$$ControlStateOneCopyWithImpl<$Res>;
  @useResult
  $Res call({Rxn<DeviceInterface> device, Rxn<DeviceStateInterface> state});
}

/// @nodoc
class __$$ControlStateOneCopyWithImpl<$Res>
    extends _$ControlStateCopyWithImpl<$Res, _$ControlStateOne>
    implements _$$ControlStateOneCopyWith<$Res> {
  __$$ControlStateOneCopyWithImpl(
      _$ControlStateOne _value, $Res Function(_$ControlStateOne) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = null,
    Object? state = null,
  }) {
    return _then(_$ControlStateOne(
      null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as Rxn<DeviceInterface>,
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as Rxn<DeviceStateInterface>,
    ));
  }
}

/// @nodoc

class _$ControlStateOne implements ControlStateOne {
  const _$ControlStateOne(this.device, this.state);

  @override
  final Rxn<DeviceInterface> device;
  @override
  final Rxn<DeviceStateInterface> state;

  @override
  String toString() {
    return 'ControlState.one(device: $device, state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ControlStateOne &&
            (identical(other.device, device) || other.device == device) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, device, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ControlStateOneCopyWith<_$ControlStateOne> get copyWith =>
      __$$ControlStateOneCopyWithImpl<_$ControlStateOne>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(
            Rxn<DeviceInterface> device, Rxn<DeviceStateInterface> state)
        one,
    required TResult Function(
            RxList<DeviceInterface> devices, Rxn<DeviceStateInterface> state)
        multi,
  }) {
    return one(device, state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(
            Rxn<DeviceInterface> device, Rxn<DeviceStateInterface> state)?
        one,
    TResult? Function(
            RxList<DeviceInterface> devices, Rxn<DeviceStateInterface> state)?
        multi,
  }) {
    return one?.call(device, state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(
            Rxn<DeviceInterface> device, Rxn<DeviceStateInterface> state)?
        one,
    TResult Function(
            RxList<DeviceInterface> devices, Rxn<DeviceStateInterface> state)?
        multi,
    required TResult orElse(),
  }) {
    if (one != null) {
      return one(device, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ControlStateNone value) none,
    required TResult Function(ControlStateOne value) one,
    required TResult Function(ControlStateMulti value) multi,
  }) {
    return one(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ControlStateNone value)? none,
    TResult? Function(ControlStateOne value)? one,
    TResult? Function(ControlStateMulti value)? multi,
  }) {
    return one?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ControlStateNone value)? none,
    TResult Function(ControlStateOne value)? one,
    TResult Function(ControlStateMulti value)? multi,
    required TResult orElse(),
  }) {
    if (one != null) {
      return one(this);
    }
    return orElse();
  }
}

abstract class ControlStateOne implements ControlState {
  const factory ControlStateOne(final Rxn<DeviceInterface> device,
      final Rxn<DeviceStateInterface> state) = _$ControlStateOne;

  Rxn<DeviceInterface> get device;
  Rxn<DeviceStateInterface> get state;
  @JsonKey(ignore: true)
  _$$ControlStateOneCopyWith<_$ControlStateOne> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ControlStateMultiCopyWith<$Res> {
  factory _$$ControlStateMultiCopyWith(
          _$ControlStateMulti value, $Res Function(_$ControlStateMulti) then) =
      __$$ControlStateMultiCopyWithImpl<$Res>;
  @useResult
  $Res call({RxList<DeviceInterface> devices, Rxn<DeviceStateInterface> state});
}

/// @nodoc
class __$$ControlStateMultiCopyWithImpl<$Res>
    extends _$ControlStateCopyWithImpl<$Res, _$ControlStateMulti>
    implements _$$ControlStateMultiCopyWith<$Res> {
  __$$ControlStateMultiCopyWithImpl(
      _$ControlStateMulti _value, $Res Function(_$ControlStateMulti) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? devices = null,
    Object? state = null,
  }) {
    return _then(_$ControlStateMulti(
      null == devices
          ? _value.devices
          : devices // ignore: cast_nullable_to_non_nullable
              as RxList<DeviceInterface>,
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as Rxn<DeviceStateInterface>,
    ));
  }
}

/// @nodoc

class _$ControlStateMulti implements ControlStateMulti {
  const _$ControlStateMulti(this.devices, this.state);

  @override
  final RxList<DeviceInterface> devices;
  @override
  final Rxn<DeviceStateInterface> state;

  @override
  String toString() {
    return 'ControlState.multi(devices: $devices, state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ControlStateMulti &&
            const DeepCollectionEquality().equals(other.devices, devices) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(devices), state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ControlStateMultiCopyWith<_$ControlStateMulti> get copyWith =>
      __$$ControlStateMultiCopyWithImpl<_$ControlStateMulti>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(
            Rxn<DeviceInterface> device, Rxn<DeviceStateInterface> state)
        one,
    required TResult Function(
            RxList<DeviceInterface> devices, Rxn<DeviceStateInterface> state)
        multi,
  }) {
    return multi(devices, state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(
            Rxn<DeviceInterface> device, Rxn<DeviceStateInterface> state)?
        one,
    TResult? Function(
            RxList<DeviceInterface> devices, Rxn<DeviceStateInterface> state)?
        multi,
  }) {
    return multi?.call(devices, state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(
            Rxn<DeviceInterface> device, Rxn<DeviceStateInterface> state)?
        one,
    TResult Function(
            RxList<DeviceInterface> devices, Rxn<DeviceStateInterface> state)?
        multi,
    required TResult orElse(),
  }) {
    if (multi != null) {
      return multi(devices, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ControlStateNone value) none,
    required TResult Function(ControlStateOne value) one,
    required TResult Function(ControlStateMulti value) multi,
  }) {
    return multi(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ControlStateNone value)? none,
    TResult? Function(ControlStateOne value)? one,
    TResult? Function(ControlStateMulti value)? multi,
  }) {
    return multi?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ControlStateNone value)? none,
    TResult Function(ControlStateOne value)? one,
    TResult Function(ControlStateMulti value)? multi,
    required TResult orElse(),
  }) {
    if (multi != null) {
      return multi(this);
    }
    return orElse();
  }
}

abstract class ControlStateMulti implements ControlState {
  const factory ControlStateMulti(final RxList<DeviceInterface> devices,
      final Rxn<DeviceStateInterface> state) = _$ControlStateMulti;

  RxList<DeviceInterface> get devices;
  Rxn<DeviceStateInterface> get state;
  @JsonKey(ignore: true)
  _$$ControlStateMultiCopyWith<_$ControlStateMulti> get copyWith =>
      throw _privateConstructorUsedError;
}
