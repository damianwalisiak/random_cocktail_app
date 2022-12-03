import 'package:random_cocktail_app/app/data/remote_data_sources/search_remote_data_source.dart';
import 'package:random_cocktail_app/domain/models/cocktail_model.dart';

class SearchCocktailRepository {
  SearchCocktailRepository(this._searchRemoteDataSource);

  final SearchRemoteDataSource _searchRemoteDataSource;

  Future<CocktailModel> getCocktailModel({
    required String cocktailName,
  }) async {
    final json = await _searchRemoteDataSource.getSearchCocktail(
      cocktailName: cocktailName,
    );
    if (json == null) {
      throw Exception('');
    }
    return CocktailModel.fromJson(json);
  }
}
