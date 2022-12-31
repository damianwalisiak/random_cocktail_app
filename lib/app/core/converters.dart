import 'package:json_annotation/json_annotation.dart';
import 'package:random_cocktail_app/domain/models/ingredient_model.dart';

class IngredientsConverter
    implements JsonConverter<List<IngredientModel>, Map<String?, String?>> {
  const IngredientsConverter();

  @override
  List<IngredientModel> fromJson(Map<String?, String?> ingredientsList) {
    return ingredientsList.entries
        .map(
          (mapEntry) => IngredientModel(
            name: mapEntry.key ?? '',
            mesure: mapEntry.value ?? '',
          ),
        )
        .toList();
  }

  @override
  Map<String?, String?> toJson(List<IngredientModel> ingredientsModels) {
    return {};
  }
}



 //static List<IngredientModel> _getIngredients(
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