import 'package:dio/dio.dart';

class RandomRemoteDataSource {
  Future<Map<String, dynamic>?> fetchDataForRandomCocktail() async {
    final response = await Dio().get<Map<String, dynamic>>(
        'https://www.thecocktaildb.com/api/json/v1/1/random.php');

    final data = response.data;
    if (data == null) {
      return null;
    }
    return data['drinks'][0];
  }
}
