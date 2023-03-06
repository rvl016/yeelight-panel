// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_menu.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MenuItemData {
  String get name => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  IconData get icon => throw _privateConstructorUsedError;
  MenuPanel? get panel => throw _privateConstructorUsedError;
  Iterable<MenuItemData>? get children => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MenuItemDataCopyWith<MenuItemData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuItemDataCopyWith<$Res> {
  factory $MenuItemDataCopyWith(
          MenuItemData value, $Res Function(MenuItemData) then) =
      _$MenuItemDataCopyWithImpl<$Res, MenuItemData>;
  @useResult
  $Res call(
      {String name,
      String label,
      IconData icon,
      MenuPanel? panel,
      Iterable<MenuItemData>? children});
}

/// @nodoc
class _$MenuItemDataCopyWithImpl<$Res, $Val extends MenuItemData>
    implements $MenuItemDataCopyWith<$Res> {
  _$MenuItemDataCopyWithImpl(this._value, this._then);

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
    Object? panel = freezed,
    Object? children = freezed,
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
      panel: freezed == panel
          ? _value.panel
          : panel // ignore: cast_nullable_to_non_nullable
              as MenuPanel?,
      children: freezed == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as Iterable<MenuItemData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MenuItemDataCopyWith<$Res>
    implements $MenuItemDataCopyWith<$Res> {
  factory _$$_MenuItemDataCopyWith(
          _$_MenuItemData value, $Res Function(_$_MenuItemData) then) =
      __$$_MenuItemDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String label,
      IconData icon,
      MenuPanel? panel,
      Iterable<MenuItemData>? children});
}

/// @nodoc
class __$$_MenuItemDataCopyWithImpl<$Res>
    extends _$MenuItemDataCopyWithImpl<$Res, _$_MenuItemData>
    implements _$$_MenuItemDataCopyWith<$Res> {
  __$$_MenuItemDataCopyWithImpl(
      _$_MenuItemData _value, $Res Function(_$_MenuItemData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? label = null,
    Object? icon = null,
    Object? panel = freezed,
    Object? children = freezed,
  }) {
    return _then(_$_MenuItemData(
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
      panel: freezed == panel
          ? _value.panel
          : panel // ignore: cast_nullable_to_non_nullable
              as MenuPanel?,
      children: freezed == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as Iterable<MenuItemData>?,
    ));
  }
}

/// @nodoc

class _$_MenuItemData implements _MenuItemData {
  const _$_MenuItemData(
      {required this.name,
      required this.label,
      required this.icon,
      this.panel,
      this.children});

  @override
  final String name;
  @override
  final String label;
  @override
  final IconData icon;
  @override
  final MenuPanel? panel;
  @override
  final Iterable<MenuItemData>? children;

  @override
  String toString() {
    return 'MenuItemData(name: $name, label: $label, icon: $icon, panel: $panel, children: $children)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MenuItemData &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.panel, panel) || other.panel == panel) &&
            const DeepCollectionEquality().equals(other.children, children));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, label, icon, panel,
      const DeepCollectionEquality().hash(children));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MenuItemDataCopyWith<_$_MenuItemData> get copyWith =>
      __$$_MenuItemDataCopyWithImpl<_$_MenuItemData>(this, _$identity);
}

abstract class _MenuItemData implements MenuItemData {
  const factory _MenuItemData(
      {required final String name,
      required final String label,
      required final IconData icon,
      final MenuPanel? panel,
      final Iterable<MenuItemData>? children}) = _$_MenuItemData;

  @override
  String get name;
  @override
  String get label;
  @override
  IconData get icon;
  @override
  MenuPanel? get panel;
  @override
  Iterable<MenuItemData>? get children;
  @override
  @JsonKey(ignore: true)
  _$$_MenuItemDataCopyWith<_$_MenuItemData> get copyWith =>
      throw _privateConstructorUsedError;
}
