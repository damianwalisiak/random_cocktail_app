import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class IngredientModel {
  IngredientModel({
    required this.name,
    // required this.mesure,
  });

  String name;
  // String mesure;
}
