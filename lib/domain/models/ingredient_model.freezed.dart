// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ingredient_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IngredientModel {
  String get name => throw _privateConstructorUsedError;
  String get mesure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IngredientModelCopyWith<IngredientModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientModelCopyWith<$Res> {
  factory $IngredientModelCopyWith(
          IngredientModel value, $Res Function(IngredientModel) then) =
      _$IngredientModelCopyWithImpl<$Res, IngredientModel>;
  @useResult
  $Res call({String name, String mesure});
}

/// @nodoc
class _$IngredientModelCopyWithImpl<$Res, $Val extends IngredientModel>
    implements $IngredientModelCopyWith<$Res> {
  _$IngredientModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? mesure = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mesure: null == mesure
          ? _value.mesure
          : mesure // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IngredientModelCopyWith<$Res>
    implements $IngredientModelCopyWith<$Res> {
  factory _$$_IngredientModelCopyWith(
          _$_IngredientModel value, $Res Function(_$_IngredientModel) then) =
      __$$_IngredientModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String mesure});
}

/// @nodoc
class __$$_IngredientModelCopyWithImpl<$Res>
    extends _$IngredientModelCopyWithImpl<$Res, _$_IngredientModel>
    implements _$$_IngredientModelCopyWith<$Res> {
  __$$_IngredientModelCopyWithImpl(
      _$_IngredientModel _value, $Res Function(_$_IngredientModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? mesure = null,
  }) {
    return _then(_$_IngredientModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mesure: null == mesure
          ? _value.mesure
          : mesure // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_IngredientModel implements _IngredientModel {
  _$_IngredientModel({required this.name, required this.mesure});

  @override
  final String name;
  @override
  final String mesure;

  @override
  String toString() {
    return 'IngredientModel(name: $name, mesure: $mesure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IngredientModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mesure, mesure) || other.mesure == mesure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, mesure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IngredientModelCopyWith<_$_IngredientModel> get copyWith =>
      __$$_IngredientModelCopyWithImpl<_$_IngredientModel>(this, _$identity);
}

abstract class _IngredientModel implements IngredientModel {
  factory _IngredientModel(
      {required final String name,
      required final String mesure}) = _$_IngredientModel;

  @override
  String get name;
  @override
  String get mesure;
  @override
  @JsonKey(ignore: true)
  _$$_IngredientModelCopyWith<_$_IngredientModel> get copyWith =>
      throw _privateConstructorUsedError;
}
