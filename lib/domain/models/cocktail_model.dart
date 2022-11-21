import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:random_cocktail_app/domain/models/ingredient_model.dart';

class Ingredient {
  static List<IngredientModel> getIngridients(Map<String, dynamic> json) {
    final results = <IngredientModel>[];
    for (var i = 1; i <= 16; i++) {
      if (json['drinks']['str_ingridient$i'] == null) {
        continue;
      }
      if (json['drinks']['str_measure$i'] == null) {
        continue;
      }
      results.add(
        IngredientModel(
            name: json['drinks']['str_ingridient$i'],
            mesure: json['drinks']['str_measure$i']),
      );
    }
    return results;
  }
}

class CocktailModel {
  final String name;
  final String category;
  final String alcoholic;
  final String glassType;
  final String pictureUrl;
  final String instructions;
  final List<IngredientModel> ingredients;

  CocktailModel({
    required this.name,
    required this.category,
    required this.alcoholic,
    required this.glassType,
    required this.pictureUrl,
    required this.instructions,
    required this.ingredients,
  });

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
  // factory CocktailModel.fromJson(Map<String, dynamic> json) =>
  //     _$CocktailModelFromJson(json);

  CocktailModel.fromJson(Map<String, dynamic> json)
      : name = json['drinks']['strDrink'],
        category = json['drinks']['strCategory'],
        alcoholic = json['drinks']['strAlcoholic'],
        glassType = json['drinks']['strGlass'],
        pictureUrl = json['drinks']['strDrinkThumb'],
        instructions = json['drinks']['strInstructions'],
        ingredients = getIngredients(json);
  static List<IngredientModel> getIngredients(Map<String, dynamic> json) {
    return [];
  }

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

}
