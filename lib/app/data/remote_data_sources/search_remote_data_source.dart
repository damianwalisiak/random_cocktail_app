import 'package:dio/dio.dart';
import 'package:random_cocktail_app/domain/models/ingredient_model.dart';

class SearchRemoteDataSource {
  Future<List<Map<String, dynamic>>?> getSearchCocktail({
    required String cocktailName,
  }) async {
    //TODO implement cocktailName and evrything with change ' " for ""
    final response = await Dio().get<List<dynamic>>(
        'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=$cocktailName');

    final listDynamic = response.data;
    if (listDynamic == null) {
      return null;
    }
    return listDynamic.map((e) => e as Map<String, dynamic>).toList();
  }
}
