import 'package:dio/dio.dart';
import 'package:random_cocktail_app/domain/models/ingredient_model.dart';

class RandomRemoteDataSource {
  Future<List<Map<String, dynamic>>?> getRandomCocktail() async {
    final response = await Dio().get<List<dynamic>>(
        'https://www.thecocktaildb.com/api/json/v1/1/random.php');

    final listDynamic = response.data;
    if (listDynamic == null) {
      return null;
    }
    return listDynamic.map((e) => e as Map<String, dynamic>).toList();
  }
}
