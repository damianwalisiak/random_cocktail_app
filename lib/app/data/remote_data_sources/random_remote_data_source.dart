import 'package:dio/dio.dart';

class RandomRemoteDataSource {
  Future<Map<String, dynamic>?> fetchDataForRandomCocktail() async {
    try {
      final response = await Dio().get<Map<String, dynamic>>(
          'https://www.thecocktaildb.com/api/json/v1/1/random.php');

      final data = response.data;
      if (data == null) {
        return null;
      }
      final Map<String, dynamic> firstDrink = data['drinks'][0];

      firstDrink['ingredientsList'] = [
        firstDrink['strIngredient1'],
        firstDrink['strIngredient2'],
        firstDrink['strIngredient3'],
        firstDrink['strIngredient4'],
        firstDrink['strIngredient5'],
        firstDrink['strIngredient6'],
        firstDrink['strIngredient7'],
      ];

      firstDrink['measure'] = [
        firstDrink['strMeasure1'],
        firstDrink['strMeasure2'],
        firstDrink['strMeasure3'],
        firstDrink['strMeasure4'],
        firstDrink['strMeasure5'],
        firstDrink['strMeasure6'],
        firstDrink['strMeasure7'],
      ];

      return firstDrink;
    } on DioError catch (error) {
      throw Exception(
          error.response?.data['error']['message'] ?? 'Unkown error');
    }
  }
}
