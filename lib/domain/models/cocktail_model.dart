import 'package:random_cocktail_app/domain/models/ingredient_model.dart';

class CocktailModel {
  final String name;
  final String category;
  final String alcoholic;
  final String glassType;
  final String pictureUrl;
  final String instructions;
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

  CocktailModel.fromJson(Map<String, dynamic> json)
      : name = json['strDrink'],
        category = json['strCategory'],
        alcoholic = json['strAlcoholic'],
        glassType = json['strGlass'],
        pictureUrl = json['strDrinkThumb'],
        instructions = json['strInstructions'],
        ingredientsList = _getIngredients(json);

  static List<IngredientModel> _getIngredients(
    Map<String, dynamic> json,
  ) {
    List<IngredientModel> ingredientsList = [];

    for (var i = 1; i <= 16; i++) {
      if (json['strIngredient$i'] == null) {
        continue;
      }
      if (json['strMeasure$i'] == null) {
        continue;
      }
      ingredientsList.add(
        IngredientModel(
          name: json['strIngredient$i'],
          mesure: json['strMeasure$i'],
        ),
      );
    }
    return ingredientsList;
  }
}
