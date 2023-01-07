import 'package:injectable/injectable.dart';
import 'package:random_cocktail_app/app/data/remote_data_sources/random_remote_data_source.dart';
import 'package:random_cocktail_app/domain/models/cocktail_model.dart';

class RandomCocktailRepository {
  RandomCocktailRepository({required this.randomRemoteDataSource});

  final RandomRemoteDataSource randomRemoteDataSource;

  Future<CocktailModel> getRandomCocktailModel() async {
    final json = await randomRemoteDataSource.fetchDataForRandomCocktail();
    if (json == null) {
      throw Exception('Failed to get data');
    }
    return CocktailModel.fromJson(json);
  }
}
