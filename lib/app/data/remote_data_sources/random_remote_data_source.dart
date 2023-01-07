import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

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

      firstDrink['ingredientsList'] = <String?, String?>{
        firstDrink['strIngredient1']: firstDrink['strMeasure1'],
        firstDrink['strIngredient2']: firstDrink['strMeasure2'],
        firstDrink['strIngredient3']: firstDrink['strMeasure3'],
        firstDrink['strIngredient4']: firstDrink['strMeasure4'],
        firstDrink['strIngredient5']: firstDrink['strMeasure5'],
        firstDrink['strIngredient6']: firstDrink['strMeasure6'],
        firstDrink['strIngredient7']: firstDrink['strMeasure7'],
        firstDrink['strIngredient8']: firstDrink['strMeasure8'],
        firstDrink['strIngredient9']: firstDrink['strMeasure9'],
        firstDrink['strIngredient10']: firstDrink['strMeasure10'],
        firstDrink['strIngredient11']: firstDrink['strMeasure11'],
        firstDrink['strIngredient12']: firstDrink['strMeasure12'],
        firstDrink['strIngredient13']: firstDrink['strMeasure13'],
        firstDrink['strIngredient14']: firstDrink['strMeasure14'],
        firstDrink['strIngredient15']: firstDrink['strMeasure15'],
      };

      return firstDrink;
    } on DioError catch (error) {
      throw Exception(
          error.response?.data['error']['message'] ?? 'Unkown error');
    }
  }
}
