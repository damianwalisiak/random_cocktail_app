import 'package:random_cocktail_app/app/data/remote_data_sources/random_remote_data_source.dart';
import 'package:random_cocktail_app/domain/models/cocktail_model.dart';

class RandomCocktailRepository {
  RandomCocktailRepository(this._randomRemoteDataSource);
  final RandomRemoteDataSource _randomRemoteDataSource;

  Future<List<CocktailModel>> getCocktailModel(
      {required String name,
      required String category,
      required String alcoholic,
      required String glassType,
      required String pictureUrl,
      required String instructions}) async {
    final json = await _randomRemoteDataSource.getRandomCocktail();
    if (json == null) {
      return [];
    }
    return json.map((item) => CocktailModel.fromJson(item)).toList();
  }
}
