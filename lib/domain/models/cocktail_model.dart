import 'package:random_cocktail_app/domain/models/ingredient_model.dart';

class CocktailModel {
  final String name;
  final String category;
  final String alcoholic;
  final String glassType;
  final String pictureUrl;
  final String instructions;
  // final List<IngredientModel> ingredients;

  CocktailModel({
    required this.name,
    required this.category,
    required this.alcoholic,
    required this.glassType,
    required this.pictureUrl,
    required this.instructions,
    // required this.ingredients,
  });

//   String strIngredientName, strIngredientMeasure;
//                               List<IngredientModel> ingredientList = [];

//                               for (int i = 1; i < 16; i++) {
//                                 strIngredientName =
//                                     'strIngredient' + i.toString();
//                                 strIngredientMeasure =
//                                     'strMeasure' + i.toString();

//                                 ingredientList.add(
//                                   IngredientModel(
//                                     name: json['drinks'][0][strIngredientName],
//                                     mesure: json['drinks'][0]
//                                         [strIngredientMeasure],
//                                   ),
//                                 );
//                               }

//                               ingredientList.removeWhere((element) =>
//                                   element.name == null &&
//                                   element.mesure == null);

//                               ingredientList.forEach(
//                                 (element) {
//                                   if (element.mesure == null) {
//                                     element.mesure = ' ';
//                                   }
//                                 },
//                               );
// //
  CocktailModel.fromJson(Map<String, dynamic> json)
      : name = json['drinks']['strDrink'],
        category = json['drinks']['strCategory'],
        alcoholic = json['drinks']['strAlcoholic'],
        glassType = json['drinks']['strGlass'],
        pictureUrl = json['drinks']['strDrinkThumb'],
        instructions = json['drinks']['strInstructions'];
  //  ingredients = ingredientList;
}
