// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cocktail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CocktailModel _$CocktailModelFromJson(Map<String, dynamic> json) {
  return _CocktailModel.fromJson(json);
}

/// @nodoc
mixin _$CocktailModel {
  @JsonKey(name: 'strDrink')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'strCategory')
  String get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'strAlcoholic')
  String get alcoholic => throw _privateConstructorUsedError;
  @JsonKey(name: 'strGlass')
  String get glassType => throw _privateConstructorUsedError;
  @JsonKey(name: 'strDrinkThumb')
  String get pictureUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'strInstructions')
  String get instructions => throw _privateConstructorUsedError;
  @IngredientsConverter()
  List<IngredientModel> get ingredientsList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CocktailModelCopyWith<CocktailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CocktailModelCopyWith<$Res> {
  factory $CocktailModelCopyWith(
          CocktailModel value, $Res Function(CocktailModel) then) =
      _$CocktailModelCopyWithImpl<$Res, CocktailModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'strDrink') String name,
      @JsonKey(name: 'strCategory') String category,
      @JsonKey(name: 'strAlcoholic') String alcoholic,
      @JsonKey(name: 'strGlass') String glassType,
      @JsonKey(name: 'strDrinkThumb') String pictureUrl,
      @JsonKey(name: 'strInstructions') String instructions,
      @IngredientsConverter() List<IngredientModel> ingredientsList});
}

/// @nodoc
class _$CocktailModelCopyWithImpl<$Res, $Val extends CocktailModel>
    implements $CocktailModelCopyWith<$Res> {
  _$CocktailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? category = null,
    Object? alcoholic = null,
    Object? glassType = null,
    Object? pictureUrl = null,
    Object? instructions = null,
    Object? ingredientsList = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      alcoholic: null == alcoholic
          ? _value.alcoholic
          : alcoholic // ignore: cast_nullable_to_non_nullable
              as String,
      glassType: null == glassType
          ? _value.glassType
          : glassType // ignore: cast_nullable_to_non_nullable
              as String,
      pictureUrl: null == pictureUrl
          ? _value.pictureUrl
          : pictureUrl // ignore: cast_nullable_to_non_nullable
              as String,
      instructions: null == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String,
      ingredientsList: null == ingredientsList
          ? _value.ingredientsList
          : ingredientsList // ignore: cast_nullable_to_non_nullable
              as List<IngredientModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CocktailModelCopyWith<$Res>
    implements $CocktailModelCopyWith<$Res> {
  factory _$$_CocktailModelCopyWith(
          _$_CocktailModel value, $Res Function(_$_CocktailModel) then) =
      __$$_CocktailModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'strDrink') String name,
      @JsonKey(name: 'strCategory') String category,
      @JsonKey(name: 'strAlcoholic') String alcoholic,
      @JsonKey(name: 'strGlass') String glassType,
      @JsonKey(name: 'strDrinkThumb') String pictureUrl,
      @JsonKey(name: 'strInstructions') String instructions,
      @IngredientsConverter() List<IngredientModel> ingredientsList});
}

/// @nodoc
class __$$_CocktailModelCopyWithImpl<$Res>
    extends _$CocktailModelCopyWithImpl<$Res, _$_CocktailModel>
    implements _$$_CocktailModelCopyWith<$Res> {
  __$$_CocktailModelCopyWithImpl(
      _$_CocktailModel _value, $Res Function(_$_CocktailModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? category = null,
    Object? alcoholic = null,
    Object? glassType = null,
    Object? pictureUrl = null,
    Object? instructions = null,
    Object? ingredientsList = null,
  }) {
    return _then(_$_CocktailModel(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      null == alcoholic
          ? _value.alcoholic
          : alcoholic // ignore: cast_nullable_to_non_nullable
              as String,
      null == glassType
          ? _value.glassType
          : glassType // ignore: cast_nullable_to_non_nullable
              as String,
      null == pictureUrl
          ? _value.pictureUrl
          : pictureUrl // ignore: cast_nullable_to_non_nullable
              as String,
      null == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String,
      null == ingredientsList
          ? _value._ingredientsList
          : ingredientsList // ignore: cast_nullable_to_non_nullable
              as List<IngredientModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CocktailModel implements _CocktailModel {
  _$_CocktailModel(
      @JsonKey(name: 'strDrink') this.name,
      @JsonKey(name: 'strCategory') this.category,
      @JsonKey(name: 'strAlcoholic') this.alcoholic,
      @JsonKey(name: 'strGlass') this.glassType,
      @JsonKey(name: 'strDrinkThumb') this.pictureUrl,
      @JsonKey(name: 'strInstructions') this.instructions,
      @IngredientsConverter() final List<IngredientModel> ingredientsList)
      : _ingredientsList = ingredientsList;

  factory _$_CocktailModel.fromJson(Map<String, dynamic> json) =>
      _$$_CocktailModelFromJson(json);

  @override
  @JsonKey(name: 'strDrink')
  final String name;
  @override
  @JsonKey(name: 'strCategory')
  final String category;
  @override
  @JsonKey(name: 'strAlcoholic')
  final String alcoholic;
  @override
  @JsonKey(name: 'strGlass')
  final String glassType;
  @override
  @JsonKey(name: 'strDrinkThumb')
  final String pictureUrl;
  @override
  @JsonKey(name: 'strInstructions')
  final String instructions;
  final List<IngredientModel> _ingredientsList;
  @override
  @IngredientsConverter()
  List<IngredientModel> get ingredientsList {
    if (_ingredientsList is EqualUnmodifiableListView) return _ingredientsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredientsList);
  }

  @override
  String toString() {
    return 'CocktailModel(name: $name, category: $category, alcoholic: $alcoholic, glassType: $glassType, pictureUrl: $pictureUrl, instructions: $instructions, ingredientsList: $ingredientsList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CocktailModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.alcoholic, alcoholic) ||
                other.alcoholic == alcoholic) &&
            (identical(other.glassType, glassType) ||
                other.glassType == glassType) &&
            (identical(other.pictureUrl, pictureUrl) ||
                other.pictureUrl == pictureUrl) &&
            (identical(other.instructions, instructions) ||
                other.instructions == instructions) &&
            const DeepCollectionEquality()
                .equals(other._ingredientsList, _ingredientsList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      category,
      alcoholic,
      glassType,
      pictureUrl,
      instructions,
      const DeepCollectionEquality().hash(_ingredientsList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CocktailModelCopyWith<_$_CocktailModel> get copyWith =>
      __$$_CocktailModelCopyWithImpl<_$_CocktailModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CocktailModelToJson(
      this,
    );
  }
}

abstract class _CocktailModel implements CocktailModel {
  factory _CocktailModel(
          @JsonKey(name: 'strDrink') final String name,
          @JsonKey(name: 'strCategory') final String category,
          @JsonKey(name: 'strAlcoholic') final String alcoholic,
          @JsonKey(name: 'strGlass') final String glassType,
          @JsonKey(name: 'strDrinkThumb') final String pictureUrl,
          @JsonKey(name: 'strInstructions') final String instructions,
          @IngredientsConverter() final List<IngredientModel> ingredientsList) =
      _$_CocktailModel;

  factory _CocktailModel.fromJson(Map<String, dynamic> json) =
      _$_CocktailModel.fromJson;

  @override
  @JsonKey(name: 'strDrink')
  String get name;
  @override
  @JsonKey(name: 'strCategory')
  String get category;
  @override
  @JsonKey(name: 'strAlcoholic')
  String get alcoholic;
  @override
  @JsonKey(name: 'strGlass')
  String get glassType;
  @override
  @JsonKey(name: 'strDrinkThumb')
  String get pictureUrl;
  @override
  @JsonKey(name: 'strInstructions')
  String get instructions;
  @override
  @IngredientsConverter()
  List<IngredientModel> get ingredientsList;
  @override
  @JsonKey(ignore: true)
  _$$_CocktailModelCopyWith<_$_CocktailModel> get copyWith =>
      throw _privateConstructorUsedError;
}
