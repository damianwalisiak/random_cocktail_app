import 'package:dio/dio.dart';
import 'package:random_cocktail_app/domain/models/ingredient_model.dart';

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
    //TODO implement cocktailName and evrything with change ' " for ""

    // final response = await Dio().get<List<dynamic>>(
    //     'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=$cocktailName');

    // final listDynamic = response.data;
    // if (listDynamic == null) {
    //   return null;
    // }
    // return listDynamic.map((e) => e as Map<String, dynamic>).toList();
  }
}
