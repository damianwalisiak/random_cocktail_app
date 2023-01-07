import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:random_cocktail_app/app/core/converters.dart';
import 'package:random_cocktail_app/domain/models/ingredient_model.dart';

part 'cocktail_model.g.dart';
part 'cocktail_model.freezed.dart';

@freezed
class CocktailModel with _$CocktailModel {
  factory CocktailModel(
    @JsonKey(name: 'strDrink') String name,
    @JsonKey(name: 'strCategory') String category,
    @JsonKey(name: 'strAlcoholic') String alcoholic,
    @JsonKey(name: 'strGlass') String glassType,
    @JsonKey(name: 'strDrinkThumb') String pictureUrl,
    @JsonKey(name: 'strInstructions') String instructions,
    @IngredientsConverter() List<IngredientModel> ingredientsList,
  ) = _CocktailModel;

  factory CocktailModel.fromJson(Map<String, dynamic> json) =>
      _$CocktailModelFromJson(json);
}
