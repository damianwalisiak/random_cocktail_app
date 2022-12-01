import 'package:random_cocktail_app/domain/models/ingredient_model.dart';

// class Ingredient {
//   static List<IngredientModel> getIngridients(Map<String, dynamic> json) {
//     final ingredientsList = <IngredientModel>[];
//     for (var i = 1; i <= 16; i++) {
//       if (json['drinks']['str_ingridient$i'] == null) {
//         continue;
//       }
//       if (json['drinks']['str_measure$i'] == null) {
//         continue;
//       }
//       ingredientsList.add(
//         IngredientModel(
//             name: json['drinks']['str_ingridient$i'],
//             mesure: json['drinks']['str_measure$i']),
//       );
//     }
//     return ingredientsList;
//   }
// }

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

  // factory CocktailModel.fromJson(Map<String, dynamic> json) =>
  //     _$CocktailModelFromJson(json)

  factory CocktailModel.fromJson(Map<String, dynamic> json) {
    return CocktailModel(
      name: json['strDrink'],
      category: json['strCategory'],
      alcoholic: json['strAlcoholic'],
      glassType: json['strGlass'],
      pictureUrl: json['strDrinkThumb'],
      instructions: json['strInstructions'],
      ingredientsList: _getIngredients(json),
    );
  }

  // CocktailModel.fromJson(Map<String, dynamic> json)
  //     : name = json['strDrink'],
  //       category = json['strCategory'],
  //       alcoholic = json['strAlcoholic'],
  //       glassType = json['strGlass'],
  //       pictureUrl = json['strDrinkThumb'],
  //       instructions = json['strInstructions'],
  //       ingredientsList = _getIngredients(json);

  static List<IngredientModel> _getIngredients(
    Map<String, dynamic> json,
  ) {
    List<IngredientModel> ingredientsList = [];
    // {
    // final ingredientsList = <IngredientModel>[];
    for (var i = 1; i <= 15; i++) {
      if (json['strIngridient$i'].toString() != 'null' &&
          json['strIngridient$i'].toString().isNotEmpty) {
        var ingredient = IngredientModel(
          name: json['strIngridient$i'].toString(),
          mesure: json['strMeasure$i'].toString(),
        );
        ingredientsList.add(ingredient);
      }
    }
    return ingredientsList;
  }
}

//kod adama
    // for (var i = 1; i <= 16; i++) {
    //   if (json['strIngridient$i'] == null) {
    //     continue;
    //   }
    //   if (json['strMeasure$i'] == null) {
    //     continue;
    //   }
    // ingredientsList.add(
    //   IngredientModel(
    //     name: json['strIngridient$i'],
    //     mesure: json['strMeasure$i'],
    //   ),
    // );
  // }
  // return ingredientsList;
// }
// }





//kod z youtube
// String strIngredientName, strIngredientMeasure;

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




//moje modyfikowanie z youtube


// List<IngredientModel> nextIngredient(){
//  String strIngredientName;
//  String strIngredientMeasure;

//      final List<IngredientModel> ingredientList = [];
//       final myjson = json.encode(json);

//          for (int i = 1; i < 16; i++) {
//                strIngredientName =
//                'strIngredient' + i.toString();
//                                 strIngredientMeasure =
//                                     'strMeasure' + i.toString();

//                                         // var json = CocktailModel.fromJson(Map<String, dynamic> nextIngredient, strIngredientMeasure);
//                                      ingredientList.add(
//                                   IngredientModel(
//                                     name: myjson['drinks'][strIngredientName] ,
//                                     mesure: myjson['drinks']
//                                         [strIngredientMeasure],
//                                   ),
//                                 );

//                               //   ingredientList.add(
//                               //     IngredientModel.fromJson(Map<String, dynamic> json)
//                               //      : name: json['drinks'][strIngredientName],
//                               //        mesure: json['drinks']
//                               //           [strIngredientMeasure],
//                               //   );
//                               // }

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

//            }
// return List<IngredientModel> ingredientList;

// }

