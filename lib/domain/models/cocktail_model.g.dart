// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CocktailModel _$CocktailModelFromJson(Map<String, dynamic> json) =>
    CocktailModel(
      name: json['strDrink'] as String,
      category: json['strCategory'] as String,
      alcoholic: json['strAlcoholic'] as String,
      glassType: json['strGlass'] as String,
      pictureUrl: json['strDrinkThumb'] as String,
      instructions: json['strInstructions'] as String,
      ingredientsList: const IngredientsConverter()
          .fromJson(json['ingredientsList'] as Map<String?, String?>),
    );

Map<String, dynamic> _$CocktailModelToJson(CocktailModel instance) =>
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
