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
mixin _$DeviceDetectResult {
  Object get field0 => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DeviceDataInterface field0) ok,
    required TResult Function(List<DeviceDetectErrorItem> field0) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DeviceDataInterface field0)? ok,
    TResult? Function(List<DeviceDetectErrorItem> field0)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DeviceDataInterface field0)? ok,
    TResult Function(List<DeviceDetectErrorItem> field0)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceDetectResult_Ok value) ok,
    required TResult Function(DeviceDetectResult_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceDetectResult_Ok value)? ok,
    TResult? Function(DeviceDetectResult_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceDetectResult_Ok value)? ok,
    TResult Function(DeviceDetectResult_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceDetectResultCopyWith<$Res> {
  factory $DeviceDetectResultCopyWith(
          DeviceDetectResult value, $Res Function(DeviceDetectResult) then) =
      _$DeviceDetectResultCopyWithImpl<$Res, DeviceDetectResult>;
}

/// @nodoc
class _$DeviceDetectResultCopyWithImpl<$Res, $Val extends DeviceDetectResult>
    implements $DeviceDetectResultCopyWith<$Res> {
  _$DeviceDetectResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DeviceDetectResult_OkCopyWith<$Res> {
  factory _$$DeviceDetectResult_OkCopyWith(_$DeviceDetectResult_Ok value,
          $Res Function(_$DeviceDetectResult_Ok) then) =
      __$$DeviceDetectResult_OkCopyWithImpl<$Res>;
  @useResult
  $Res call({DeviceDataInterface field0});
}

/// @nodoc
class __$$DeviceDetectResult_OkCopyWithImpl<$Res>
    extends _$DeviceDetectResultCopyWithImpl<$Res, _$DeviceDetectResult_Ok>
    implements _$$DeviceDetectResult_OkCopyWith<$Res> {
  __$$DeviceDetectResult_OkCopyWithImpl(_$DeviceDetectResult_Ok _value,
      $Res Function(_$DeviceDetectResult_Ok) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$DeviceDetectResult_Ok(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as DeviceDataInterface,
    ));
  }
}

/// @nodoc

class _$DeviceDetectResult_Ok implements DeviceDetectResult_Ok {
  const _$DeviceDetectResult_Ok(this.field0);

  @override
  final DeviceDataInterface field0;

  @override
  String toString() {
    return 'DeviceDetectResult.ok(field0: $field0)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceDetectResult_Ok &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceDetectResult_OkCopyWith<_$DeviceDetectResult_Ok> get copyWith =>
      __$$DeviceDetectResult_OkCopyWithImpl<_$DeviceDetectResult_Ok>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DeviceDataInterface field0) ok,
    required TResult Function(List<DeviceDetectErrorItem> field0) error,
  }) {
    return ok(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DeviceDataInterface field0)? ok,
    TResult? Function(List<DeviceDetectErrorItem> field0)? error,
  }) {
    return ok?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DeviceDataInterface field0)? ok,
    TResult Function(List<DeviceDetectErrorItem> field0)? error,
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
    required TResult Function(DeviceDetectResult_Ok value) ok,
    required TResult Function(DeviceDetectResult_Error value) error,
  }) {
    return ok(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceDetectResult_Ok value)? ok,
    TResult? Function(DeviceDetectResult_Error value)? error,
  }) {
    return ok?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceDetectResult_Ok value)? ok,
    TResult Function(DeviceDetectResult_Error value)? error,
    required TResult orElse(),
  }) {
    if (ok != null) {
      return ok(this);
    }
    return orElse();
  }
}

abstract class DeviceDetectResult_Ok implements DeviceDetectResult {
  const factory DeviceDetectResult_Ok(final DeviceDataInterface field0) =
      _$DeviceDetectResult_Ok;

  @override
  DeviceDataInterface get field0;
  @JsonKey(ignore: true)
  _$$DeviceDetectResult_OkCopyWith<_$DeviceDetectResult_Ok> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceDetectResult_ErrorCopyWith<$Res> {
  factory _$$DeviceDetectResult_ErrorCopyWith(_$DeviceDetectResult_Error value,
          $Res Function(_$DeviceDetectResult_Error) then) =
      __$$DeviceDetectResult_ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({List<DeviceDetectErrorItem> field0});
}

/// @nodoc
class __$$DeviceDetectResult_ErrorCopyWithImpl<$Res>
    extends _$DeviceDetectResultCopyWithImpl<$Res, _$DeviceDetectResult_Error>
    implements _$$DeviceDetectResult_ErrorCopyWith<$Res> {
  __$$DeviceDetectResult_ErrorCopyWithImpl(_$DeviceDetectResult_Error _value,
      $Res Function(_$DeviceDetectResult_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$DeviceDetectResult_Error(
      null == field0
          ? _value._field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as List<DeviceDetectErrorItem>,
    ));
  }
}

/// @nodoc

class _$DeviceDetectResult_Error implements DeviceDetectResult_Error {
  const _$DeviceDetectResult_Error(final List<DeviceDetectErrorItem> field0)
      : _field0 = field0;

  final List<DeviceDetectErrorItem> _field0;
  @override
  List<DeviceDetectErrorItem> get field0 {
    if (_field0 is EqualUnmodifiableListView) return _field0;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_field0);
  }

  @override
  String toString() {
    return 'DeviceDetectResult.error(field0: $field0)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceDetectResult_Error &&
            const DeepCollectionEquality().equals(other._field0, _field0));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_field0));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceDetectResult_ErrorCopyWith<_$DeviceDetectResult_Error>
      get copyWith =>
          __$$DeviceDetectResult_ErrorCopyWithImpl<_$DeviceDetectResult_Error>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DeviceDataInterface field0) ok,
    required TResult Function(List<DeviceDetectErrorItem> field0) error,
  }) {
    return error(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DeviceDataInterface field0)? ok,
    TResult? Function(List<DeviceDetectErrorItem> field0)? error,
  }) {
    return error?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DeviceDataInterface field0)? ok,
    TResult Function(List<DeviceDetectErrorItem> field0)? error,
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
    required TResult Function(DeviceDetectResult_Ok value) ok,
    required TResult Function(DeviceDetectResult_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceDetectResult_Ok value)? ok,
    TResult? Function(DeviceDetectResult_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceDetectResult_Ok value)? ok,
    TResult Function(DeviceDetectResult_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class DeviceDetectResult_Error implements DeviceDetectResult {
  const factory DeviceDetectResult_Error(
      final List<DeviceDetectErrorItem> field0) = _$DeviceDetectResult_Error;

  @override
  List<DeviceDetectErrorItem> get field0;
  @JsonKey(ignore: true)
  _$$DeviceDetectResult_ErrorCopyWith<_$DeviceDetectResult_Error>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RunningStateInterface {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(ColorStateInteface field0) color,
    required TResult Function(AnimationStateInteface field0) animation,
    required TResult Function(DirectModeStateInterface field0) directMode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(ColorStateInteface field0)? color,
    TResult? Function(AnimationStateInteface field0)? animation,
    TResult? Function(DirectModeStateInterface field0)? directMode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(ColorStateInteface field0)? color,
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
    required TResult Function(ColorStateInteface field0) color,
    required TResult Function(AnimationStateInteface field0) animation,
    required TResult Function(DirectModeStateInterface field0) directMode,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(ColorStateInteface field0)? color,
    TResult? Function(AnimationStateInteface field0)? animation,
    TResult? Function(DirectModeStateInterface field0)? directMode,
  }) {
    return none?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(ColorStateInteface field0)? color,
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
  $Res call({ColorStateInteface field0});
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
              as ColorStateInteface,
    ));
  }
}

/// @nodoc

class _$RunningStateInterface_Color implements RunningStateInterface_Color {
  const _$RunningStateInterface_Color(this.field0);

  @override
  final ColorStateInteface field0;

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
    required TResult Function(ColorStateInteface field0) color,
    required TResult Function(AnimationStateInteface field0) animation,
    required TResult Function(DirectModeStateInterface field0) directMode,
  }) {
    return color(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(ColorStateInteface field0)? color,
    TResult? Function(AnimationStateInteface field0)? animation,
    TResult? Function(DirectModeStateInterface field0)? directMode,
  }) {
    return color?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(ColorStateInteface field0)? color,
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
  const factory RunningStateInterface_Color(final ColorStateInteface field0) =
      _$RunningStateInterface_Color;

  ColorStateInteface get field0;
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
    required TResult Function(ColorStateInteface field0) color,
    required TResult Function(AnimationStateInteface field0) animation,
    required TResult Function(DirectModeStateInterface field0) directMode,
  }) {
    return animation(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(ColorStateInteface field0)? color,
    TResult? Function(AnimationStateInteface field0)? animation,
    TResult? Function(DirectModeStateInterface field0)? directMode,
  }) {
    return animation?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(ColorStateInteface field0)? color,
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
    required TResult Function(ColorStateInteface field0) color,
    required TResult Function(AnimationStateInteface field0) animation,
    required TResult Function(DirectModeStateInterface field0) directMode,
  }) {
    return directMode(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(ColorStateInteface field0)? color,
    TResult? Function(AnimationStateInteface field0)? animation,
    TResult? Function(DirectModeStateInterface field0)? directMode,
  }) {
    return directMode?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(ColorStateInteface field0)? color,
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
