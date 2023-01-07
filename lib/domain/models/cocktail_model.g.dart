// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CocktailModel _$$_CocktailModelFromJson(Map<String, dynamic> json) =>
    _$_CocktailModel(
      json['strDrink'] as String,
      json['strCategory'] as String,
      json['strAlcoholic'] as String,
      json['strGlass'] as String,
      json['strDrinkThumb'] as String,
      json['strInstructions'] as String,
      const IngredientsConverter()
          .fromJson(json['ingredientsList'] as Map<String?, String?>),
    );

Map<String, dynamic> _$$_CocktailModelToJson(_$_CocktailModel instance) =>
    <String, dynamic>{
      'strDrink': instance.name,
      'strCategory': instance.category,
      'strAlcoholic': instance.alcoholic,
      'strGlass': instance.glassType,
      'strDrinkThumb': instance.pictureUrl,
      'strInstructions': instance.instructions,
      'ingredientsList':
          const IngredientsConverter().toJson(instance.ingredientsList),
    };
