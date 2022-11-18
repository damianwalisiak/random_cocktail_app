import 'package:random_cocktail_app/app/data/remote_data_sources/search_remote_data_source.dart';
import 'package:random_cocktail_app/domain/models/cocktail_model.dart';

class SearchCocktailRepository {
  SearchCocktailRepository(this._searchRemoteDataSource);
  final SearchRemoteDataSource _searchRemoteDataSource;

  Future<List<CocktailModel>> getCocktailModel({
    required String cocktailName,
    required String name,
    required String category,
    required String alcoholic,
    required String glassType,
    required String pictureUrl,
    required String instructions,
  }) async {
    final json = await _searchRemoteDataSource.getSearchCocktail(
      cocktailName: cocktailName,
    );
    if (json == null) {
      return [];
    }
    return json.map((item) => CocktailModel.fromJson(item)).toList();
  }
}
