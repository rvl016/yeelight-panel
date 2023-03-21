// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bridge_definitions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ColorInterface {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(HSVInterface field0) hsv,
    required TResult Function(RGBInterface field0) rgb,
    required TResult Function(CTInterface field0) ct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(HSVInterface field0)? hsv,
    TResult? Function(RGBInterface field0)? rgb,
    TResult? Function(CTInterface field0)? ct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(HSVInterface field0)? hsv,
    TResult Function(RGBInterface field0)? rgb,
    TResult Function(CTInterface field0)? ct,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ColorInterface_None value) none,
    required TResult Function(ColorInterface_HSV value) hsv,
    required TResult Function(ColorInterface_RGB value) rgb,
    required TResult Function(ColorInterface_CT value) ct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ColorInterface_None value)? none,
    TResult? Function(ColorInterface_HSV value)? hsv,
    TResult? Function(ColorInterface_RGB value)? rgb,
    TResult? Function(ColorInterface_CT value)? ct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ColorInterface_None value)? none,
    TResult Function(ColorInterface_HSV value)? hsv,
    TResult Function(ColorInterface_RGB value)? rgb,
    TResult Function(ColorInterface_CT value)? ct,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorInterfaceCopyWith<$Res> {
  factory $ColorInterfaceCopyWith(
          ColorInterface value, $Res Function(ColorInterface) then) =
      _$ColorInterfaceCopyWithImpl<$Res, ColorInterface>;
}

/// @nodoc
class _$ColorInterfaceCopyWithImpl<$Res, $Val extends ColorInterface>
    implements $ColorInterfaceCopyWith<$Res> {
  _$ColorInterfaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ColorInterface_NoneCopyWith<$Res> {
  factory _$$ColorInterface_NoneCopyWith(_$ColorInterface_None value,
          $Res Function(_$ColorInterface_None) then) =
      __$$ColorInterface_NoneCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ColorInterface_NoneCopyWithImpl<$Res>
    extends _$ColorInterfaceCopyWithImpl<$Res, _$ColorInterface_None>
    implements _$$ColorInterface_NoneCopyWith<$Res> {
  __$$ColorInterface_NoneCopyWithImpl(
      _$ColorInterface_None _value, $Res Function(_$ColorInterface_None) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ColorInterface_None implements ColorInterface_None {
  const _$ColorInterface_None();

  @override
  String toString() {
    return 'ColorInterface.none()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ColorInterface_None);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(HSVInterface field0) hsv,
    required TResult Function(RGBInterface field0) rgb,
    required TResult Function(CTInterface field0) ct,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(HSVInterface field0)? hsv,
    TResult? Function(RGBInterface field0)? rgb,
    TResult? Function(CTInterface field0)? ct,
  }) {
    return none?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(HSVInterface field0)? hsv,
    TResult Function(RGBInterface field0)? rgb,
    TResult Function(CTInterface field0)? ct,
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
    required TResult Function(ColorInterface_None value) none,
    required TResult Function(ColorInterface_HSV value) hsv,
    required TResult Function(ColorInterface_RGB value) rgb,
    required TResult Function(ColorInterface_CT value) ct,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ColorInterface_None value)? none,
    TResult? Function(ColorInterface_HSV value)? hsv,
    TResult? Function(ColorInterface_RGB value)? rgb,
    TResult? Function(ColorInterface_CT value)? ct,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ColorInterface_None value)? none,
    TResult Function(ColorInterface_HSV value)? hsv,
    TResult Function(ColorInterface_RGB value)? rgb,
    TResult Function(ColorInterface_CT value)? ct,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class ColorInterface_None implements ColorInterface {
  const factory ColorInterface_None() = _$ColorInterface_None;
}

/// @nodoc
abstract class _$$ColorInterface_HSVCopyWith<$Res> {
  factory _$$ColorInterface_HSVCopyWith(_$ColorInterface_HSV value,
          $Res Function(_$ColorInterface_HSV) then) =
      __$$ColorInterface_HSVCopyWithImpl<$Res>;
  @useResult
  $Res call({HSVInterface field0});
}

/// @nodoc
class __$$ColorInterface_HSVCopyWithImpl<$Res>
    extends _$ColorInterfaceCopyWithImpl<$Res, _$ColorInterface_HSV>
    implements _$$ColorInterface_HSVCopyWith<$Res> {
  __$$ColorInterface_HSVCopyWithImpl(
      _$ColorInterface_HSV _value, $Res Function(_$ColorInterface_HSV) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$ColorInterface_HSV(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as HSVInterface,
    ));
  }
}

/// @nodoc

class _$ColorInterface_HSV implements ColorInterface_HSV {
  const _$ColorInterface_HSV(this.field0);

  @override
  final HSVInterface field0;

  @override
  String toString() {
    return 'ColorInterface.hsv(field0: $field0)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorInterface_HSV &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ColorInterface_HSVCopyWith<_$ColorInterface_HSV> get copyWith =>
      __$$ColorInterface_HSVCopyWithImpl<_$ColorInterface_HSV>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(HSVInterface field0) hsv,
    required TResult Function(RGBInterface field0) rgb,
    required TResult Function(CTInterface field0) ct,
  }) {
    return hsv(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(HSVInterface field0)? hsv,
    TResult? Function(RGBInterface field0)? rgb,
    TResult? Function(CTInterface field0)? ct,
  }) {
    return hsv?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(HSVInterface field0)? hsv,
    TResult Function(RGBInterface field0)? rgb,
    TResult Function(CTInterface field0)? ct,
    required TResult orElse(),
  }) {
    if (hsv != null) {
      return hsv(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ColorInterface_None value) none,
    required TResult Function(ColorInterface_HSV value) hsv,
    required TResult Function(ColorInterface_RGB value) rgb,
    required TResult Function(ColorInterface_CT value) ct,
  }) {
    return hsv(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ColorInterface_None value)? none,
    TResult? Function(ColorInterface_HSV value)? hsv,
    TResult? Function(ColorInterface_RGB value)? rgb,
    TResult? Function(ColorInterface_CT value)? ct,
  }) {
    return hsv?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ColorInterface_None value)? none,
    TResult Function(ColorInterface_HSV value)? hsv,
    TResult Function(ColorInterface_RGB value)? rgb,
    TResult Function(ColorInterface_CT value)? ct,
    required TResult orElse(),
  }) {
    if (hsv != null) {
      return hsv(this);
    }
    return orElse();
  }
}

abstract class ColorInterface_HSV implements ColorInterface {
  const factory ColorInterface_HSV(final HSVInterface field0) =
      _$ColorInterface_HSV;

  HSVInterface get field0;
  @JsonKey(ignore: true)
  _$$ColorInterface_HSVCopyWith<_$ColorInterface_HSV> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ColorInterface_RGBCopyWith<$Res> {
  factory _$$ColorInterface_RGBCopyWith(_$ColorInterface_RGB value,
          $Res Function(_$ColorInterface_RGB) then) =
      __$$ColorInterface_RGBCopyWithImpl<$Res>;
  @useResult
  $Res call({RGBInterface field0});
}

/// @nodoc
class __$$ColorInterface_RGBCopyWithImpl<$Res>
    extends _$ColorInterfaceCopyWithImpl<$Res, _$ColorInterface_RGB>
    implements _$$ColorInterface_RGBCopyWith<$Res> {
  __$$ColorInterface_RGBCopyWithImpl(
      _$ColorInterface_RGB _value, $Res Function(_$ColorInterface_RGB) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$ColorInterface_RGB(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as RGBInterface,
    ));
  }
}

/// @nodoc

class _$ColorInterface_RGB implements ColorInterface_RGB {
  const _$ColorInterface_RGB(this.field0);

  @override
  final RGBInterface field0;

  @override
  String toString() {
    return 'ColorInterface.rgb(field0: $field0)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorInterface_RGB &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ColorInterface_RGBCopyWith<_$ColorInterface_RGB> get copyWith =>
      __$$ColorInterface_RGBCopyWithImpl<_$ColorInterface_RGB>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(HSVInterface field0) hsv,
    required TResult Function(RGBInterface field0) rgb,
    required TResult Function(CTInterface field0) ct,
  }) {
    return rgb(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(HSVInterface field0)? hsv,
    TResult? Function(RGBInterface field0)? rgb,
    TResult? Function(CTInterface field0)? ct,
  }) {
    return rgb?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(HSVInterface field0)? hsv,
    TResult Function(RGBInterface field0)? rgb,
    TResult Function(CTInterface field0)? ct,
    required TResult orElse(),
  }) {
    if (rgb != null) {
      return rgb(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ColorInterface_None value) none,
    required TResult Function(ColorInterface_HSV value) hsv,
    required TResult Function(ColorInterface_RGB value) rgb,
    required TResult Function(ColorInterface_CT value) ct,
  }) {
    return rgb(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ColorInterface_None value)? none,
    TResult? Function(ColorInterface_HSV value)? hsv,
    TResult? Function(ColorInterface_RGB value)? rgb,
    TResult? Function(ColorInterface_CT value)? ct,
  }) {
    return rgb?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ColorInterface_None value)? none,
    TResult Function(ColorInterface_HSV value)? hsv,
    TResult Function(ColorInterface_RGB value)? rgb,
    TResult Function(ColorInterface_CT value)? ct,
    required TResult orElse(),
  }) {
    if (rgb != null) {
      return rgb(this);
    }
    return orElse();
  }
}

abstract class ColorInterface_RGB implements ColorInterface {
  const factory ColorInterface_RGB(final RGBInterface field0) =
      _$ColorInterface_RGB;

  RGBInterface get field0;
  @JsonKey(ignore: true)
  _$$ColorInterface_RGBCopyWith<_$ColorInterface_RGB> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ColorInterface_CTCopyWith<$Res> {
  factory _$$ColorInterface_CTCopyWith(
          _$ColorInterface_CT value, $Res Function(_$ColorInterface_CT) then) =
      __$$ColorInterface_CTCopyWithImpl<$Res>;
  @useResult
  $Res call({CTInterface field0});
}

/// @nodoc
class __$$ColorInterface_CTCopyWithImpl<$Res>
    extends _$ColorInterfaceCopyWithImpl<$Res, _$ColorInterface_CT>
    implements _$$ColorInterface_CTCopyWith<$Res> {
  __$$ColorInterface_CTCopyWithImpl(
      _$ColorInterface_CT _value, $Res Function(_$ColorInterface_CT) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$ColorInterface_CT(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as CTInterface,
    ));
  }
}

/// @nodoc

class _$ColorInterface_CT implements ColorInterface_CT {
  const _$ColorInterface_CT(this.field0);

  @override
  final CTInterface field0;

  @override
  String toString() {
    return 'ColorInterface.ct(field0: $field0)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorInterface_CT &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ColorInterface_CTCopyWith<_$ColorInterface_CT> get copyWith =>
      __$$ColorInterface_CTCopyWithImpl<_$ColorInterface_CT>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(HSVInterface field0) hsv,
    required TResult Function(RGBInterface field0) rgb,
    required TResult Function(CTInterface field0) ct,
  }) {
    return ct(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(HSVInterface field0)? hsv,
    TResult? Function(RGBInterface field0)? rgb,
    TResult? Function(CTInterface field0)? ct,
  }) {
    return ct?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(HSVInterface field0)? hsv,
    TResult Function(RGBInterface field0)? rgb,
    TResult Function(CTInterface field0)? ct,
    required TResult orElse(),
  }) {
    if (ct != null) {
      return ct(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ColorInterface_None value) none,
    required TResult Function(ColorInterface_HSV value) hsv,
    required TResult Function(ColorInterface_RGB value) rgb,
    required TResult Function(ColorInterface_CT value) ct,
  }) {
    return ct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ColorInterface_None value)? none,
    TResult? Function(ColorInterface_HSV value)? hsv,
    TResult? Function(ColorInterface_RGB value)? rgb,
    TResult? Function(ColorInterface_CT value)? ct,
  }) {
    return ct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ColorInterface_None value)? none,
    TResult Function(ColorInterface_HSV value)? hsv,
    TResult Function(ColorInterface_RGB value)? rgb,
    TResult Function(ColorInterface_CT value)? ct,
    required TResult orElse(),
  }) {
    if (ct != null) {
      return ct(this);
    }
    return orElse();
  }
}

abstract class ColorInterface_CT implements ColorInterface {
  const factory ColorInterface_CT(final CTInterface field0) =
      _$ColorInterface_CT;

  CTInterface get field0;
  @JsonKey(ignore: true)
  _$$ColorInterface_CTCopyWith<_$ColorInterface_CT> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DeviceDetectResultInterface {
  Object get field0 => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DeviceDataInterface field0) ok,
    required TResult Function(List<DeviceDetectErrorItemInterface> field0)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DeviceDataInterface field0)? ok,
    TResult? Function(List<DeviceDetectErrorItemInterface> field0)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DeviceDataInterface field0)? ok,
    TResult Function(List<DeviceDetectErrorItemInterface> field0)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceDetectResultInterface_Ok value) ok,
    required TResult Function(DeviceDetectResultInterface_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceDetectResultInterface_Ok value)? ok,
    TResult? Function(DeviceDetectResultInterface_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceDetectResultInterface_Ok value)? ok,
    TResult Function(DeviceDetectResultInterface_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceDetectResultInterfaceCopyWith<$Res> {
  factory $DeviceDetectResultInterfaceCopyWith(
          DeviceDetectResultInterface value,
          $Res Function(DeviceDetectResultInterface) then) =
      _$DeviceDetectResultInterfaceCopyWithImpl<$Res,
          DeviceDetectResultInterface>;
}

/// @nodoc
class _$DeviceDetectResultInterfaceCopyWithImpl<$Res,
        $Val extends DeviceDetectResultInterface>
    implements $DeviceDetectResultInterfaceCopyWith<$Res> {
  _$DeviceDetectResultInterfaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DeviceDetectResultInterface_OkCopyWith<$Res> {
  factory _$$DeviceDetectResultInterface_OkCopyWith(
          _$DeviceDetectResultInterface_Ok value,
          $Res Function(_$DeviceDetectResultInterface_Ok) then) =
      __$$DeviceDetectResultInterface_OkCopyWithImpl<$Res>;
  @useResult
  $Res call({DeviceDataInterface field0});
}

/// @nodoc
class __$$DeviceDetectResultInterface_OkCopyWithImpl<$Res>
    extends _$DeviceDetectResultInterfaceCopyWithImpl<$Res,
        _$DeviceDetectResultInterface_Ok>
    implements _$$DeviceDetectResultInterface_OkCopyWith<$Res> {
  __$$DeviceDetectResultInterface_OkCopyWithImpl(
      _$DeviceDetectResultInterface_Ok _value,
      $Res Function(_$DeviceDetectResultInterface_Ok) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$DeviceDetectResultInterface_Ok(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as DeviceDataInterface,
    ));
  }
}

/// @nodoc

class _$DeviceDetectResultInterface_Ok
    implements DeviceDetectResultInterface_Ok {
  const _$DeviceDetectResultInterface_Ok(this.field0);

  @override
  final DeviceDataInterface field0;

  @override
  String toString() {
    return 'DeviceDetectResultInterface.ok(field0: $field0)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceDetectResultInterface_Ok &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceDetectResultInterface_OkCopyWith<_$DeviceDetectResultInterface_Ok>
      get copyWith => __$$DeviceDetectResultInterface_OkCopyWithImpl<
          _$DeviceDetectResultInterface_Ok>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DeviceDataInterface field0) ok,
    required TResult Function(List<DeviceDetectErrorItemInterface> field0)
        error,
  }) {
    return ok(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DeviceDataInterface field0)? ok,
    TResult? Function(List<DeviceDetectErrorItemInterface> field0)? error,
  }) {
    return ok?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DeviceDataInterface field0)? ok,
    TResult Function(List<DeviceDetectErrorItemInterface> field0)? error,
    required TResult orElse(),
  }) {
    if (ok != null) {
      return ok(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceDetectResultInterface_Ok value) ok,
    required TResult Function(DeviceDetectResultInterface_Error value) error,
  }) {
    return ok(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceDetectResultInterface_Ok value)? ok,
    TResult? Function(DeviceDetectResultInterface_Error value)? error,
  }) {
    return ok?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceDetectResultInterface_Ok value)? ok,
    TResult Function(DeviceDetectResultInterface_Error value)? error,
    required TResult orElse(),
  }) {
    if (ok != null) {
      return ok(this);
    }
    return orElse();
  }
}

abstract class DeviceDetectResultInterface_Ok
    implements DeviceDetectResultInterface {
  const factory DeviceDetectResultInterface_Ok(
      final DeviceDataInterface field0) = _$DeviceDetectResultInterface_Ok;

  @override
  DeviceDataInterface get field0;
  @JsonKey(ignore: true)
  _$$DeviceDetectResultInterface_OkCopyWith<_$DeviceDetectResultInterface_Ok>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceDetectResultInterface_ErrorCopyWith<$Res> {
  factory _$$DeviceDetectResultInterface_ErrorCopyWith(
          _$DeviceDetectResultInterface_Error value,
          $Res Function(_$DeviceDetectResultInterface_Error) then) =
      __$$DeviceDetectResultInterface_ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({List<DeviceDetectErrorItemInterface> field0});
}

/// @nodoc
class __$$DeviceDetectResultInterface_ErrorCopyWithImpl<$Res>
    extends _$DeviceDetectResultInterfaceCopyWithImpl<$Res,
        _$DeviceDetectResultInterface_Error>
    implements _$$DeviceDetectResultInterface_ErrorCopyWith<$Res> {
  __$$DeviceDetectResultInterface_ErrorCopyWithImpl(
      _$DeviceDetectResultInterface_Error _value,
      $Res Function(_$DeviceDetectResultInterface_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$DeviceDetectResultInterface_Error(
      null == field0
          ? _value._field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as List<DeviceDetectErrorItemInterface>,
    ));
  }
}

/// @nodoc

class _$DeviceDetectResultInterface_Error
    implements DeviceDetectResultInterface_Error {
  const _$DeviceDetectResultInterface_Error(
      final List<DeviceDetectErrorItemInterface> field0)
      : _field0 = field0;

  final List<DeviceDetectErrorItemInterface> _field0;
  @override
  List<DeviceDetectErrorItemInterface> get field0 {
    if (_field0 is EqualUnmodifiableListView) return _field0;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_field0);
  }

  @override
  String toString() {
    return 'DeviceDetectResultInterface.error(field0: $field0)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceDetectResultInterface_Error &&
            const DeepCollectionEquality().equals(other._field0, _field0));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_field0));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceDetectResultInterface_ErrorCopyWith<
          _$DeviceDetectResultInterface_Error>
      get copyWith => __$$DeviceDetectResultInterface_ErrorCopyWithImpl<
          _$DeviceDetectResultInterface_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DeviceDataInterface field0) ok,
    required TResult Function(List<DeviceDetectErrorItemInterface> field0)
        error,
  }) {
    return error(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DeviceDataInterface field0)? ok,
    TResult? Function(List<DeviceDetectErrorItemInterface> field0)? error,
  }) {
    return error?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DeviceDataInterface field0)? ok,
    TResult Function(List<DeviceDetectErrorItemInterface> field0)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceDetectResultInterface_Ok value) ok,
    required TResult Function(DeviceDetectResultInterface_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceDetectResultInterface_Ok value)? ok,
    TResult? Function(DeviceDetectResultInterface_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceDetectResultInterface_Ok value)? ok,
    TResult Function(DeviceDetectResultInterface_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class DeviceDetectResultInterface_Error
    implements DeviceDetectResultInterface {
  const factory DeviceDetectResultInterface_Error(
          final List<DeviceDetectErrorItemInterface> field0) =
      _$DeviceDetectResultInterface_Error;

  @override
  List<DeviceDetectErrorItemInterface> get field0;
  @JsonKey(ignore: true)
  _$$DeviceDetectResultInterface_ErrorCopyWith<
          _$DeviceDetectResultInterface_Error>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DeviceStateUpdateResult {
  Object get field0 => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DeviceStateInterface field0) ok,
    required TResult Function(DeviceActionResultMetaInterface field0) err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DeviceStateInterface field0)? ok,
    TResult? Function(DeviceActionResultMetaInterface field0)? err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DeviceStateInterface field0)? ok,
    TResult Function(DeviceActionResultMetaInterface field0)? err,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceStateUpdateResult_Ok value) ok,
    required TResult Function(DeviceStateUpdateResult_Err value) err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceStateUpdateResult_Ok value)? ok,
    TResult? Function(DeviceStateUpdateResult_Err value)? err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceStateUpdateResult_Ok value)? ok,
    TResult Function(DeviceStateUpdateResult_Err value)? err,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceStateUpdateResultCopyWith<$Res> {
  factory $DeviceStateUpdateResultCopyWith(DeviceStateUpdateResult value,
          $Res Function(DeviceStateUpdateResult) then) =
      _$DeviceStateUpdateResultCopyWithImpl<$Res, DeviceStateUpdateResult>;
}

/// @nodoc
class _$DeviceStateUpdateResultCopyWithImpl<$Res,
        $Val extends DeviceStateUpdateResult>
    implements $DeviceStateUpdateResultCopyWith<$Res> {
  _$DeviceStateUpdateResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DeviceStateUpdateResult_OkCopyWith<$Res> {
  factory _$$DeviceStateUpdateResult_OkCopyWith(
          _$DeviceStateUpdateResult_Ok value,
          $Res Function(_$DeviceStateUpdateResult_Ok) then) =
      __$$DeviceStateUpdateResult_OkCopyWithImpl<$Res>;
  @useResult
  $Res call({DeviceStateInterface field0});
}

/// @nodoc
class __$$DeviceStateUpdateResult_OkCopyWithImpl<$Res>
    extends _$DeviceStateUpdateResultCopyWithImpl<$Res,
        _$DeviceStateUpdateResult_Ok>
    implements _$$DeviceStateUpdateResult_OkCopyWith<$Res> {
  __$$DeviceStateUpdateResult_OkCopyWithImpl(
      _$DeviceStateUpdateResult_Ok _value,
      $Res Function(_$DeviceStateUpdateResult_Ok) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$DeviceStateUpdateResult_Ok(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as DeviceStateInterface,
    ));
  }
}

/// @nodoc

class _$DeviceStateUpdateResult_Ok implements DeviceStateUpdateResult_Ok {
  const _$DeviceStateUpdateResult_Ok(this.field0);

  @override
  final DeviceStateInterface field0;

  @override
  String toString() {
    return 'DeviceStateUpdateResult.ok(field0: $field0)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceStateUpdateResult_Ok &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceStateUpdateResult_OkCopyWith<_$DeviceStateUpdateResult_Ok>
      get copyWith => __$$DeviceStateUpdateResult_OkCopyWithImpl<
          _$DeviceStateUpdateResult_Ok>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DeviceStateInterface field0) ok,
    required TResult Function(DeviceActionResultMetaInterface field0) err,
  }) {
    return ok(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DeviceStateInterface field0)? ok,
    TResult? Function(DeviceActionResultMetaInterface field0)? err,
  }) {
    return ok?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DeviceStateInterface field0)? ok,
    TResult Function(DeviceActionResultMetaInterface field0)? err,
    required TResult orElse(),
  }) {
    if (ok != null) {
      return ok(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceStateUpdateResult_Ok value) ok,
    required TResult Function(DeviceStateUpdateResult_Err value) err,
  }) {
    return ok(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceStateUpdateResult_Ok value)? ok,
    TResult? Function(DeviceStateUpdateResult_Err value)? err,
  }) {
    return ok?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceStateUpdateResult_Ok value)? ok,
    TResult Function(DeviceStateUpdateResult_Err value)? err,
    required TResult orElse(),
  }) {
    if (ok != null) {
      return ok(this);
    }
    return orElse();
  }
}

abstract class DeviceStateUpdateResult_Ok implements DeviceStateUpdateResult {
  const factory DeviceStateUpdateResult_Ok(final DeviceStateInterface field0) =
      _$DeviceStateUpdateResult_Ok;

  @override
  DeviceStateInterface get field0;
  @JsonKey(ignore: true)
  _$$DeviceStateUpdateResult_OkCopyWith<_$DeviceStateUpdateResult_Ok>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceStateUpdateResult_ErrCopyWith<$Res> {
  factory _$$DeviceStateUpdateResult_ErrCopyWith(
          _$DeviceStateUpdateResult_Err value,
          $Res Function(_$DeviceStateUpdateResult_Err) then) =
      __$$DeviceStateUpdateResult_ErrCopyWithImpl<$Res>;
  @useResult
  $Res call({DeviceActionResultMetaInterface field0});
}

/// @nodoc
class __$$DeviceStateUpdateResult_ErrCopyWithImpl<$Res>
    extends _$DeviceStateUpdateResultCopyWithImpl<$Res,
        _$DeviceStateUpdateResult_Err>
    implements _$$DeviceStateUpdateResult_ErrCopyWith<$Res> {
  __$$DeviceStateUpdateResult_ErrCopyWithImpl(
      _$DeviceStateUpdateResult_Err _value,
      $Res Function(_$DeviceStateUpdateResult_Err) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$DeviceStateUpdateResult_Err(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as DeviceActionResultMetaInterface,
    ));
  }
}

/// @nodoc

class _$DeviceStateUpdateResult_Err implements DeviceStateUpdateResult_Err {
  const _$DeviceStateUpdateResult_Err(this.field0);

  @override
  final DeviceActionResultMetaInterface field0;

  @override
  String toString() {
    return 'DeviceStateUpdateResult.err(field0: $field0)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceStateUpdateResult_Err &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceStateUpdateResult_ErrCopyWith<_$DeviceStateUpdateResult_Err>
      get copyWith => __$$DeviceStateUpdateResult_ErrCopyWithImpl<
          _$DeviceStateUpdateResult_Err>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DeviceStateInterface field0) ok,
    required TResult Function(DeviceActionResultMetaInterface field0) err,
  }) {
    return err(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DeviceStateInterface field0)? ok,
    TResult? Function(DeviceActionResultMetaInterface field0)? err,
  }) {
    return err?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DeviceStateInterface field0)? ok,
    TResult Function(DeviceActionResultMetaInterface field0)? err,
    required TResult orElse(),
  }) {
    if (err != null) {
      return err(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceStateUpdateResult_Ok value) ok,
    required TResult Function(DeviceStateUpdateResult_Err value) err,
  }) {
    return err(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceStateUpdateResult_Ok value)? ok,
    TResult? Function(DeviceStateUpdateResult_Err value)? err,
  }) {
    return err?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceStateUpdateResult_Ok value)? ok,
    TResult Function(DeviceStateUpdateResult_Err value)? err,
    required TResult orElse(),
  }) {
    if (err != null) {
      return err(this);
    }
    return orElse();
  }
}

abstract class DeviceStateUpdateResult_Err implements DeviceStateUpdateResult {
  const factory DeviceStateUpdateResult_Err(
          final DeviceActionResultMetaInterface field0) =
      _$DeviceStateUpdateResult_Err;

  @override
  DeviceActionResultMetaInterface get field0;
  @JsonKey(ignore: true)
  _$$DeviceStateUpdateResult_ErrCopyWith<_$DeviceStateUpdateResult_Err>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProfileDataInterface {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(ProfileSingleInterface field0) single,
    required TResult Function(ProfileMultipleInterface field0) multiple,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(ProfileSingleInterface field0)? single,
    TResult? Function(ProfileMultipleInterface field0)? multiple,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(ProfileSingleInterface field0)? single,
    TResult Function(ProfileMultipleInterface field0)? multiple,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileDataInterface_None value) none,
    required TResult Function(ProfileDataInterface_Single value) single,
    required TResult Function(ProfileDataInterface_Multiple value) multiple,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileDataInterface_None value)? none,
    TResult? Function(ProfileDataInterface_Single value)? single,
    TResult? Function(ProfileDataInterface_Multiple value)? multiple,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileDataInterface_None value)? none,
    TResult Function(ProfileDataInterface_Single value)? single,
    TResult Function(ProfileDataInterface_Multiple value)? multiple,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileDataInterfaceCopyWith<$Res> {
  factory $ProfileDataInterfaceCopyWith(ProfileDataInterface value,
          $Res Function(ProfileDataInterface) then) =
      _$ProfileDataInterfaceCopyWithImpl<$Res, ProfileDataInterface>;
}

/// @nodoc
class _$ProfileDataInterfaceCopyWithImpl<$Res,
        $Val extends ProfileDataInterface>
    implements $ProfileDataInterfaceCopyWith<$Res> {
  _$ProfileDataInterfaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ProfileDataInterface_NoneCopyWith<$Res> {
  factory _$$ProfileDataInterface_NoneCopyWith(
          _$ProfileDataInterface_None value,
          $Res Function(_$ProfileDataInterface_None) then) =
      __$$ProfileDataInterface_NoneCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileDataInterface_NoneCopyWithImpl<$Res>
    extends _$ProfileDataInterfaceCopyWithImpl<$Res,
        _$ProfileDataInterface_None>
    implements _$$ProfileDataInterface_NoneCopyWith<$Res> {
  __$$ProfileDataInterface_NoneCopyWithImpl(_$ProfileDataInterface_None _value,
      $Res Function(_$ProfileDataInterface_None) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProfileDataInterface_None implements ProfileDataInterface_None {
  const _$ProfileDataInterface_None();

  @override
  String toString() {
    return 'ProfileDataInterface.none()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileDataInterface_None);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(ProfileSingleInterface field0) single,
    required TResult Function(ProfileMultipleInterface field0) multiple,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(ProfileSingleInterface field0)? single,
    TResult? Function(ProfileMultipleInterface field0)? multiple,
  }) {
    return none?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(ProfileSingleInterface field0)? single,
    TResult Function(ProfileMultipleInterface field0)? multiple,
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
    required TResult Function(ProfileDataInterface_None value) none,
    required TResult Function(ProfileDataInterface_Single value) single,
    required TResult Function(ProfileDataInterface_Multiple value) multiple,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileDataInterface_None value)? none,
    TResult? Function(ProfileDataInterface_Single value)? single,
    TResult? Function(ProfileDataInterface_Multiple value)? multiple,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileDataInterface_None value)? none,
    TResult Function(ProfileDataInterface_Single value)? single,
    TResult Function(ProfileDataInterface_Multiple value)? multiple,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class ProfileDataInterface_None implements ProfileDataInterface {
  const factory ProfileDataInterface_None() = _$ProfileDataInterface_None;
}

/// @nodoc
abstract class _$$ProfileDataInterface_SingleCopyWith<$Res> {
  factory _$$ProfileDataInterface_SingleCopyWith(
          _$ProfileDataInterface_Single value,
          $Res Function(_$ProfileDataInterface_Single) then) =
      __$$ProfileDataInterface_SingleCopyWithImpl<$Res>;
  @useResult
  $Res call({ProfileSingleInterface field0});
}

/// @nodoc
class __$$ProfileDataInterface_SingleCopyWithImpl<$Res>
    extends _$ProfileDataInterfaceCopyWithImpl<$Res,
        _$ProfileDataInterface_Single>
    implements _$$ProfileDataInterface_SingleCopyWith<$Res> {
  __$$ProfileDataInterface_SingleCopyWithImpl(
      _$ProfileDataInterface_Single _value,
      $Res Function(_$ProfileDataInterface_Single) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$ProfileDataInterface_Single(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as ProfileSingleInterface,
    ));
  }
}

/// @nodoc

class _$ProfileDataInterface_Single implements ProfileDataInterface_Single {
  const _$ProfileDataInterface_Single(this.field0);

  @override
  final ProfileSingleInterface field0;

  @override
  String toString() {
    return 'ProfileDataInterface.single(field0: $field0)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileDataInterface_Single &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileDataInterface_SingleCopyWith<_$ProfileDataInterface_Single>
      get copyWith => __$$ProfileDataInterface_SingleCopyWithImpl<
          _$ProfileDataInterface_Single>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(ProfileSingleInterface field0) single,
    required TResult Function(ProfileMultipleInterface field0) multiple,
  }) {
    return single(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(ProfileSingleInterface field0)? single,
    TResult? Function(ProfileMultipleInterface field0)? multiple,
  }) {
    return single?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(ProfileSingleInterface field0)? single,
    TResult Function(ProfileMultipleInterface field0)? multiple,
    required TResult orElse(),
  }) {
    if (single != null) {
      return single(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileDataInterface_None value) none,
    required TResult Function(ProfileDataInterface_Single value) single,
    required TResult Function(ProfileDataInterface_Multiple value) multiple,
  }) {
    return single(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileDataInterface_None value)? none,
    TResult? Function(ProfileDataInterface_Single value)? single,
    TResult? Function(ProfileDataInterface_Multiple value)? multiple,
  }) {
    return single?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileDataInterface_None value)? none,
    TResult Function(ProfileDataInterface_Single value)? single,
    TResult Function(ProfileDataInterface_Multiple value)? multiple,
    required TResult orElse(),
  }) {
    if (single != null) {
      return single(this);
    }
    return orElse();
  }
}

abstract class ProfileDataInterface_Single implements ProfileDataInterface {
  const factory ProfileDataInterface_Single(
      final ProfileSingleInterface field0) = _$ProfileDataInterface_Single;

  ProfileSingleInterface get field0;
  @JsonKey(ignore: true)
  _$$ProfileDataInterface_SingleCopyWith<_$ProfileDataInterface_Single>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProfileDataInterface_MultipleCopyWith<$Res> {
  factory _$$ProfileDataInterface_MultipleCopyWith(
          _$ProfileDataInterface_Multiple value,
          $Res Function(_$ProfileDataInterface_Multiple) then) =
      __$$ProfileDataInterface_MultipleCopyWithImpl<$Res>;
  @useResult
  $Res call({ProfileMultipleInterface field0});
}

/// @nodoc
class __$$ProfileDataInterface_MultipleCopyWithImpl<$Res>
    extends _$ProfileDataInterfaceCopyWithImpl<$Res,
        _$ProfileDataInterface_Multiple>
    implements _$$ProfileDataInterface_MultipleCopyWith<$Res> {
  __$$ProfileDataInterface_MultipleCopyWithImpl(
      _$ProfileDataInterface_Multiple _value,
      $Res Function(_$ProfileDataInterface_Multiple) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$ProfileDataInterface_Multiple(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as ProfileMultipleInterface,
    ));
  }
}

/// @nodoc

class _$ProfileDataInterface_Multiple implements ProfileDataInterface_Multiple {
  const _$ProfileDataInterface_Multiple(this.field0);

  @override
  final ProfileMultipleInterface field0;

  @override
  String toString() {
    return 'ProfileDataInterface.multiple(field0: $field0)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileDataInterface_Multiple &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileDataInterface_MultipleCopyWith<_$ProfileDataInterface_Multiple>
      get copyWith => __$$ProfileDataInterface_MultipleCopyWithImpl<
          _$ProfileDataInterface_Multiple>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(ProfileSingleInterface field0) single,
    required TResult Function(ProfileMultipleInterface field0) multiple,
  }) {
    return multiple(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(ProfileSingleInterface field0)? single,
    TResult? Function(ProfileMultipleInterface field0)? multiple,
  }) {
    return multiple?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(ProfileSingleInterface field0)? single,
    TResult Function(ProfileMultipleInterface field0)? multiple,
    required TResult orElse(),
  }) {
    if (multiple != null) {
      return multiple(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileDataInterface_None value) none,
    required TResult Function(ProfileDataInterface_Single value) single,
    required TResult Function(ProfileDataInterface_Multiple value) multiple,
  }) {
    return multiple(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileDataInterface_None value)? none,
    TResult? Function(ProfileDataInterface_Single value)? single,
    TResult? Function(ProfileDataInterface_Multiple value)? multiple,
  }) {
    return multiple?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileDataInterface_None value)? none,
    TResult Function(ProfileDataInterface_Single value)? single,
    TResult Function(ProfileDataInterface_Multiple value)? multiple,
    required TResult orElse(),
  }) {
    if (multiple != null) {
      return multiple(this);
    }
    return orElse();
  }
}

abstract class ProfileDataInterface_Multiple implements ProfileDataInterface {
  const factory ProfileDataInterface_Multiple(
      final ProfileMultipleInterface field0) = _$ProfileDataInterface_Multiple;

  ProfileMultipleInterface get field0;
  @JsonKey(ignore: true)
  _$$ProfileDataInterface_MultipleCopyWith<_$ProfileDataInterface_Multiple>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RunningStateInterface {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(ColorStateInterface field0) color,
    required TResult Function(AnimationStateInteface field0) animation,
    required TResult Function(DirectModeStateInterface field0) directMode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(ColorStateInterface field0)? color,
    TResult? Function(AnimationStateInteface field0)? animation,
    TResult? Function(DirectModeStateInterface field0)? directMode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(ColorStateInterface field0)? color,
    TResult Function(AnimationStateInteface field0)? animation,
    TResult Function(DirectModeStateInterface field0)? directMode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RunningStateInterface_None value) none,
    required TResult Function(RunningStateInterface_Color value) color,
    required TResult Function(RunningStateInterface_Animation value) animation,
    required TResult Function(RunningStateInterface_DirectMode value)
        directMode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RunningStateInterface_None value)? none,
    TResult? Function(RunningStateInterface_Color value)? color,
    TResult? Function(RunningStateInterface_Animation value)? animation,
    TResult? Function(RunningStateInterface_DirectMode value)? directMode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RunningStateInterface_None value)? none,
    TResult Function(RunningStateInterface_Color value)? color,
    TResult Function(RunningStateInterface_Animation value)? animation,
    TResult Function(RunningStateInterface_DirectMode value)? directMode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RunningStateInterfaceCopyWith<$Res> {
  factory $RunningStateInterfaceCopyWith(RunningStateInterface value,
          $Res Function(RunningStateInterface) then) =
      _$RunningStateInterfaceCopyWithImpl<$Res, RunningStateInterface>;
}

/// @nodoc
class _$RunningStateInterfaceCopyWithImpl<$Res,
        $Val extends RunningStateInterface>
    implements $RunningStateInterfaceCopyWith<$Res> {
  _$RunningStateInterfaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RunningStateInterface_NoneCopyWith<$Res> {
  factory _$$RunningStateInterface_NoneCopyWith(
          _$RunningStateInterface_None value,
          $Res Function(_$RunningStateInterface_None) then) =
      __$$RunningStateInterface_NoneCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RunningStateInterface_NoneCopyWithImpl<$Res>
    extends _$RunningStateInterfaceCopyWithImpl<$Res,
        _$RunningStateInterface_None>
    implements _$$RunningStateInterface_NoneCopyWith<$Res> {
  __$$RunningStateInterface_NoneCopyWithImpl(
      _$RunningStateInterface_None _value,
      $Res Function(_$RunningStateInterface_None) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RunningStateInterface_None implements RunningStateInterface_None {
  const _$RunningStateInterface_None();

  @override
  String toString() {
    return 'RunningStateInterface.none()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RunningStateInterface_None);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(ColorStateInterface field0) color,
    required TResult Function(AnimationStateInteface field0) animation,
    required TResult Function(DirectModeStateInterface field0) directMode,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(ColorStateInterface field0)? color,
    TResult? Function(AnimationStateInteface field0)? animation,
    TResult? Function(DirectModeStateInterface field0)? directMode,
  }) {
    return none?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(ColorStateInterface field0)? color,
    TResult Function(AnimationStateInteface field0)? animation,
    TResult Function(DirectModeStateInterface field0)? directMode,
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
    required TResult Function(RunningStateInterface_None value) none,
    required TResult Function(RunningStateInterface_Color value) color,
    required TResult Function(RunningStateInterface_Animation value) animation,
    required TResult Function(RunningStateInterface_DirectMode value)
        directMode,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RunningStateInterface_None value)? none,
    TResult? Function(RunningStateInterface_Color value)? color,
    TResult? Function(RunningStateInterface_Animation value)? animation,
    TResult? Function(RunningStateInterface_DirectMode value)? directMode,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RunningStateInterface_None value)? none,
    TResult Function(RunningStateInterface_Color value)? color,
    TResult Function(RunningStateInterface_Animation value)? animation,
    TResult Function(RunningStateInterface_DirectMode value)? directMode,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class RunningStateInterface_None implements RunningStateInterface {
  const factory RunningStateInterface_None() = _$RunningStateInterface_None;
}

/// @nodoc
abstract class _$$RunningStateInterface_ColorCopyWith<$Res> {
  factory _$$RunningStateInterface_ColorCopyWith(
          _$RunningStateInterface_Color value,
          $Res Function(_$RunningStateInterface_Color) then) =
      __$$RunningStateInterface_ColorCopyWithImpl<$Res>;
  @useResult
  $Res call({ColorStateInterface field0});
}

/// @nodoc
class __$$RunningStateInterface_ColorCopyWithImpl<$Res>
    extends _$RunningStateInterfaceCopyWithImpl<$Res,
        _$RunningStateInterface_Color>
    implements _$$RunningStateInterface_ColorCopyWith<$Res> {
  __$$RunningStateInterface_ColorCopyWithImpl(
      _$RunningStateInterface_Color _value,
      $Res Function(_$RunningStateInterface_Color) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$RunningStateInterface_Color(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as ColorStateInterface,
    ));
  }
}

/// @nodoc

class _$RunningStateInterface_Color implements RunningStateInterface_Color {
  const _$RunningStateInterface_Color(this.field0);

  @override
  final ColorStateInterface field0;

  @override
  String toString() {
    return 'RunningStateInterface.color(field0: $field0)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RunningStateInterface_Color &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RunningStateInterface_ColorCopyWith<_$RunningStateInterface_Color>
      get copyWith => __$$RunningStateInterface_ColorCopyWithImpl<
          _$RunningStateInterface_Color>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(ColorStateInterface field0) color,
    required TResult Function(AnimationStateInteface field0) animation,
    required TResult Function(DirectModeStateInterface field0) directMode,
  }) {
    return color(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(ColorStateInterface field0)? color,
    TResult? Function(AnimationStateInteface field0)? animation,
    TResult? Function(DirectModeStateInterface field0)? directMode,
  }) {
    return color?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(ColorStateInterface field0)? color,
    TResult Function(AnimationStateInteface field0)? animation,
    TResult Function(DirectModeStateInterface field0)? directMode,
    required TResult orElse(),
  }) {
    if (color != null) {
      return color(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RunningStateInterface_None value) none,
    required TResult Function(RunningStateInterface_Color value) color,
    required TResult Function(RunningStateInterface_Animation value) animation,
    required TResult Function(RunningStateInterface_DirectMode value)
        directMode,
  }) {
    return color(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RunningStateInterface_None value)? none,
    TResult? Function(RunningStateInterface_Color value)? color,
    TResult? Function(RunningStateInterface_Animation value)? animation,
    TResult? Function(RunningStateInterface_DirectMode value)? directMode,
  }) {
    return color?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RunningStateInterface_None value)? none,
    TResult Function(RunningStateInterface_Color value)? color,
    TResult Function(RunningStateInterface_Animation value)? animation,
    TResult Function(RunningStateInterface_DirectMode value)? directMode,
    required TResult orElse(),
  }) {
    if (color != null) {
      return color(this);
    }
    return orElse();
  }
}

abstract class RunningStateInterface_Color implements RunningStateInterface {
  const factory RunningStateInterface_Color(final ColorStateInterface field0) =
      _$RunningStateInterface_Color;

  ColorStateInterface get field0;
  @JsonKey(ignore: true)
  _$$RunningStateInterface_ColorCopyWith<_$RunningStateInterface_Color>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RunningStateInterface_AnimationCopyWith<$Res> {
  factory _$$RunningStateInterface_AnimationCopyWith(
          _$RunningStateInterface_Animation value,
          $Res Function(_$RunningStateInterface_Animation) then) =
      __$$RunningStateInterface_AnimationCopyWithImpl<$Res>;
  @useResult
  $Res call({AnimationStateInteface field0});
}

/// @nodoc
class __$$RunningStateInterface_AnimationCopyWithImpl<$Res>
    extends _$RunningStateInterfaceCopyWithImpl<$Res,
        _$RunningStateInterface_Animation>
    implements _$$RunningStateInterface_AnimationCopyWith<$Res> {
  __$$RunningStateInterface_AnimationCopyWithImpl(
      _$RunningStateInterface_Animation _value,
      $Res Function(_$RunningStateInterface_Animation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$RunningStateInterface_Animation(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as AnimationStateInteface,
    ));
  }
}

/// @nodoc

class _$RunningStateInterface_Animation
    implements RunningStateInterface_Animation {
  const _$RunningStateInterface_Animation(this.field0);

  @override
  final AnimationStateInteface field0;

  @override
  String toString() {
    return 'RunningStateInterface.animation(field0: $field0)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RunningStateInterface_Animation &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RunningStateInterface_AnimationCopyWith<_$RunningStateInterface_Animation>
      get copyWith => __$$RunningStateInterface_AnimationCopyWithImpl<
          _$RunningStateInterface_Animation>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(ColorStateInterface field0) color,
    required TResult Function(AnimationStateInteface field0) animation,
    required TResult Function(DirectModeStateInterface field0) directMode,
  }) {
    return animation(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(ColorStateInterface field0)? color,
    TResult? Function(AnimationStateInteface field0)? animation,
    TResult? Function(DirectModeStateInterface field0)? directMode,
  }) {
    return animation?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(ColorStateInterface field0)? color,
    TResult Function(AnimationStateInteface field0)? animation,
    TResult Function(DirectModeStateInterface field0)? directMode,
    required TResult orElse(),
  }) {
    if (animation != null) {
      return animation(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RunningStateInterface_None value) none,
    required TResult Function(RunningStateInterface_Color value) color,
    required TResult Function(RunningStateInterface_Animation value) animation,
    required TResult Function(RunningStateInterface_DirectMode value)
        directMode,
  }) {
    return animation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RunningStateInterface_None value)? none,
    TResult? Function(RunningStateInterface_Color value)? color,
    TResult? Function(RunningStateInterface_Animation value)? animation,
    TResult? Function(RunningStateInterface_DirectMode value)? directMode,
  }) {
    return animation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RunningStateInterface_None value)? none,
    TResult Function(RunningStateInterface_Color value)? color,
    TResult Function(RunningStateInterface_Animation value)? animation,
    TResult Function(RunningStateInterface_DirectMode value)? directMode,
    required TResult orElse(),
  }) {
    if (animation != null) {
      return animation(this);
    }
    return orElse();
  }
}

abstract class RunningStateInterface_Animation
    implements RunningStateInterface {
  const factory RunningStateInterface_Animation(
      final AnimationStateInteface field0) = _$RunningStateInterface_Animation;

  AnimationStateInteface get field0;
  @JsonKey(ignore: true)
  _$$RunningStateInterface_AnimationCopyWith<_$RunningStateInterface_Animation>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RunningStateInterface_DirectModeCopyWith<$Res> {
  factory _$$RunningStateInterface_DirectModeCopyWith(
          _$RunningStateInterface_DirectMode value,
          $Res Function(_$RunningStateInterface_DirectMode) then) =
      __$$RunningStateInterface_DirectModeCopyWithImpl<$Res>;
  @useResult
  $Res call({DirectModeStateInterface field0});
}

/// @nodoc
class __$$RunningStateInterface_DirectModeCopyWithImpl<$Res>
    extends _$RunningStateInterfaceCopyWithImpl<$Res,
        _$RunningStateInterface_DirectMode>
    implements _$$RunningStateInterface_DirectModeCopyWith<$Res> {
  __$$RunningStateInterface_DirectModeCopyWithImpl(
      _$RunningStateInterface_DirectMode _value,
      $Res Function(_$RunningStateInterface_DirectMode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$RunningStateInterface_DirectMode(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as DirectModeStateInterface,
    ));
  }
}

/// @nodoc

class _$RunningStateInterface_DirectMode
    implements RunningStateInterface_DirectMode {
  const _$RunningStateInterface_DirectMode(this.field0);

  @override
  final DirectModeStateInterface field0;

  @override
  String toString() {
    return 'RunningStateInterface.directMode(field0: $field0)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RunningStateInterface_DirectMode &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RunningStateInterface_DirectModeCopyWith<
          _$RunningStateInterface_DirectMode>
      get copyWith => __$$RunningStateInterface_DirectModeCopyWithImpl<
          _$RunningStateInterface_DirectMode>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(ColorStateInterface field0) color,
    required TResult Function(AnimationStateInteface field0) animation,
    required TResult Function(DirectModeStateInterface field0) directMode,
  }) {
    return directMode(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(ColorStateInterface field0)? color,
    TResult? Function(AnimationStateInteface field0)? animation,
    TResult? Function(DirectModeStateInterface field0)? directMode,
  }) {
    return directMode?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(ColorStateInterface field0)? color,
    TResult Function(AnimationStateInteface field0)? animation,
    TResult Function(DirectModeStateInterface field0)? directMode,
    required TResult orElse(),
  }) {
    if (directMode != null) {
      return directMode(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RunningStateInterface_None value) none,
    required TResult Function(RunningStateInterface_Color value) color,
    required TResult Function(RunningStateInterface_Animation value) animation,
    required TResult Function(RunningStateInterface_DirectMode value)
        directMode,
  }) {
    return directMode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RunningStateInterface_None value)? none,
    TResult? Function(RunningStateInterface_Color value)? color,
    TResult? Function(RunningStateInterface_Animation value)? animation,
    TResult? Function(RunningStateInterface_DirectMode value)? directMode,
  }) {
    return directMode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RunningStateInterface_None value)? none,
    TResult Function(RunningStateInterface_Color value)? color,
    TResult Function(RunningStateInterface_Animation value)? animation,
    TResult Function(RunningStateInterface_DirectMode value)? directMode,
    required TResult orElse(),
  }) {
    if (directMode != null) {
      return directMode(this);
    }
    return orElse();
  }
}

abstract class RunningStateInterface_DirectMode
    implements RunningStateInterface {
  const factory RunningStateInterface_DirectMode(
          final DirectModeStateInterface field0) =
      _$RunningStateInterface_DirectMode;

  DirectModeStateInterface get field0;
  @JsonKey(ignore: true)
  _$$RunningStateInterface_DirectModeCopyWith<
          _$RunningStateInterface_DirectMode>
      get copyWith => throw _privateConstructorUsedError;
}
