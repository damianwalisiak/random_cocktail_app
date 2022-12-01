import 'package:random_cocktail_app/app/data/remote_data_sources/random_remote_data_source.dart';
import 'package:random_cocktail_app/domain/models/cocktail_model.dart';

class RandomCocktailRepository {
  RandomCocktailRepository(this._randomRemoteDataSource);

  final RandomRemoteDataSource _randomRemoteDataSource;

  Future<CocktailModel> getRandomCocktailModel() async {
    final json = await _randomRemoteDataSource.fetchDataForRandomCocktail();
    if (json == null) {
      throw Exception('');
    }
    return CocktailModel.fromJson(json);
  }
}
