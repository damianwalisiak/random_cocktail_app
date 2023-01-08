import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ingredient_model.freezed.dart';
part 'ingredient_model.g.dart';

@freezed
@JsonSerializable()
class IngredientModel with _$IngredientModel {
  factory IngredientModel({
    required String name,
    required String mesure,
  }) = _IngredientModel;
}
