import 'package:random_cocktail_app/app/core/converters.dart';
import 'package:random_cocktail_app/domain/models/ingredient_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cocktail_model.g.dart';

@JsonSerializable()
class CocktailModel {
  @JsonKey(name: 'strDrink')
  final String name;

  @JsonKey(name: 'strCategory')
  final String category;

  @JsonKey(name: 'strAlcoholic')
  final String alcoholic;

  @JsonKey(name: 'strGlass')
  final String glassType;

  @JsonKey(name: 'strDrinkThumb')
  final String pictureUrl;

  @JsonKey(name: 'strInstructions')
  final String instructions;

  @IngredientsConverter()
  final List<IngredientModel> ingredientsList;

  CocktailModel({
    required this.name,
    required this.category,
    required this.alcoholic,
    required this.glassType,
    required this.pictureUrl,
    required this.instructions,
    required this.ingredientsList,
  });

  factory CocktailModel.fromJson(Map<String, dynamic> json) =>
      _$CocktailModelFromJson(json);

  Map<String, dynamic> toJson() => _$CocktailModelToJson(this);
}
