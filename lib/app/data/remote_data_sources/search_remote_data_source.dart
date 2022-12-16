import 'package:dio/dio.dart';

class SearchRemoteDataSource {
  Future<Map<String, dynamic>?> getSearchCocktail({
    required String cocktailName,
  }) async {
    try {
      final response = await Dio().get<Map<String, dynamic>>(
          'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=$cocktailName');
      return response.data;
    } on DioError catch (error) {
      throw Exception(
          error.response?.data['error']['message'] ?? 'Unkown error');
    }
  }
}
