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

  // @JsonKey(fromJson: _getIngredients)
  // final List<IngredientModel> ingredientsList;

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

  // static List<IngredientModel> _getIngredients(
  //   Map<String, dynamic> json,
  // ) {
  //   List<IngredientModel> ingredientsList = [];

  //   for (var i = 1; i <= 16; i++) {
  //     if (json['strIngredient$i'] == null) {
  //       continue;
  //     }
  //     if (json['strMeasure$i'] == null) {
  //       continue;
  //     }
  //     ingredientsList.add(
  //       IngredientModel(
  //         name: json['strIngredient$i'],
  //         mesure: json['strMeasure$i'],
  //       ),
  //     );
  //   }
  //   return ingredientsList;
  // }
}



// 
// class IngredientsConverter
//     implements JsonConverter<List<IngredientModel>, List<String>> {
//   const IngredientsConverter();

//   @override
//   List<IngredientModel> fromJson(List<String> ingredientsRaw) {
//     return [];
//   }

//   @override
//   List<String> toJson(List<IngredientModel> ingredientModels) {
//     return [];
//   }
// }
