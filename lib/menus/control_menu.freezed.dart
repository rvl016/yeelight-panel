// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'control_menu.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ControlMenuData {
  String get name => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  IconData get icon => throw _privateConstructorUsedError;
  ControlMenuPanel get panel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ControlMenuDataCopyWith<ControlMenuData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ControlMenuDataCopyWith<$Res> {
  factory $ControlMenuDataCopyWith(
          ControlMenuData value, $Res Function(ControlMenuData) then) =
      _$ControlMenuDataCopyWithImpl<$Res, ControlMenuData>;
  @useResult
  $Res call({String name, String label, IconData icon, ControlMenuPanel panel});
}

/// @nodoc
class _$ControlMenuDataCopyWithImpl<$Res, $Val extends ControlMenuData>
    implements $ControlMenuDataCopyWith<$Res> {
  _$ControlMenuDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? label = null,
    Object? icon = null,
    Object? panel = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      panel: null == panel
          ? _value.panel
          : panel // ignore: cast_nullable_to_non_nullable
              as ControlMenuPanel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ControlMenuDataCopyWith<$Res>
    implements $ControlMenuDataCopyWith<$Res> {
  factory _$$_ControlMenuDataCopyWith(
          _$_ControlMenuData value, $Res Function(_$_ControlMenuData) then) =
      __$$_ControlMenuDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String label, IconData icon, ControlMenuPanel panel});
}

/// @nodoc
class __$$_ControlMenuDataCopyWithImpl<$Res>
    extends _$ControlMenuDataCopyWithImpl<$Res, _$_ControlMenuData>
    implements _$$_ControlMenuDataCopyWith<$Res> {
  __$$_ControlMenuDataCopyWithImpl(
      _$_ControlMenuData _value, $Res Function(_$_ControlMenuData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? label = null,
    Object? icon = null,
    Object? panel = null,
  }) {
    return _then(_$_ControlMenuData(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      panel: null == panel
          ? _value.panel
          : panel // ignore: cast_nullable_to_non_nullable
              as ControlMenuPanel,
    ));
  }
}

/// @nodoc

class _$_ControlMenuData implements _ControlMenuData {
  const _$_ControlMenuData(
      {required this.name,
      required this.label,
      required this.icon,
      required this.panel});

  @override
  final String name;
  @override
  final String label;
  @override
  final IconData icon;
  @override
  final ControlMenuPanel panel;

  @override
  String toString() {
    return 'ControlMenuData(name: $name, label: $label, icon: $icon, panel: $panel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ControlMenuData &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.panel, panel) || other.panel == panel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, label, icon, panel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ControlMenuDataCopyWith<_$_ControlMenuData> get copyWith =>
      __$$_ControlMenuDataCopyWithImpl<_$_ControlMenuData>(this, _$identity);
}

abstract class _ControlMenuData implements ControlMenuData {
  const factory _ControlMenuData(
      {required final String name,
      required final String label,
      required final IconData icon,
      required final ControlMenuPanel panel}) = _$_ControlMenuData;

  @override
  String get name;
  @override
  String get label;
  @override
  IconData get icon;
  @override
  ControlMenuPanel get panel;
  @override
  @JsonKey(ignore: true)
  _$$_ControlMenuDataCopyWith<_$_ControlMenuData> get copyWith =>
      throw _privateConstructorUsedError;
}
