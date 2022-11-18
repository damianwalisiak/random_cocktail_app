import 'package:random_cocktail_app/domain/models/cocktail_model.dart';

class RandomCocktailRepository {
  Future<CocktailModel> getCocktailModel({
    required String name,
    required String category,
    required String alcoholic,
    required String glassType,
    required String pictureUrl,
    required String instructions,
  }) async {
    return CocktailModel(
        name: 'name',
        category: 'category',
        alcoholic: 'alcoholic',
        glassType: 'glassType',
        pictureUrl: 'pictureUrl',
        instructions: 'instructions');
  }
}
