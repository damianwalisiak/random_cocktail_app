import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_cocktail_app/app/data/remote_data_sources/random_remote_data_source.dart';
import 'package:random_cocktail_app/domain/models/cocktail_model.dart';
import 'package:random_cocktail_app/domain/models/ingredient_model.dart';
import 'package:random_cocktail_app/domain/repositories/random_cocktail_repository.dart';

class MockRandomRemoteDataSource extends Mock
    implements RandomRemoteDataSource {}

void main() {
  late RandomCocktailRepository sut;
  late MockRandomRemoteDataSource dataSource;

  setUp(() {
    dataSource = MockRandomRemoteDataSource();
    sut = RandomCocktailRepository(randomRemoteDataSource: dataSource);
  });

  group('getRandomCocktailModel', () {
    test('should get data from json', () async {
      //1
      when(() => dataSource.fetchDataForRandomCocktail())
          .thenAnswer((_) async => <String, dynamic>{
                'strDrink': 'scooter',
                'strCategory': 'ordinary',
                'strAlcoholic': 'alcoholic',
                'strGlass': 'cocktail glass',
                'strDrinkThumb': 'image',
                'strInstructions': 'shake all ingredients',
                'ingredientsList': <String?, String?>{
                  'brandy': '1 oz',
                  'rum': '1 oz',
                },
              });
      //2
      final results = await sut.getRandomCocktailModel();
      //3
      expect(
        results,
        CocktailModel(
          'scooter',
          'ordinary',
          'alcoholic',
          'cocktail glass',
          'image',
          'shake all ingredients',
          [
            IngredientModel(
              name: 'brandy',
              mesure: '1 oz',
            ),
            IngredientModel(
              name: 'rum',
              mesure: '1 oz',
            ),
          ],
        ),
      );
    });
  });
}
