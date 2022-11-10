import 'package:random_cocktail_app/services/ingredient.dart';

class CocktailManager {
  CocktailManager(
      {required this.name,
      required this.category,
      required this.alcoholic,
      required this.glassType,
      required this.pictureUrl,
      required this.instructions,
      required this.ingredients});

  String name;
  String category;
  String alcoholic;
  String glassType;
  String pictureUrl;
  String instructions;
  List<Ingredient> ingredients;
}
