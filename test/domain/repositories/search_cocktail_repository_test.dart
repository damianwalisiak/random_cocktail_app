import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_cocktail_app/app/data/remote_data_sources/search_remote_data_source.dart';
import 'package:random_cocktail_app/domain/models/cocktail_model.dart';
import 'package:random_cocktail_app/domain/models/ingredient_model.dart';
import 'package:random_cocktail_app/domain/repositories/search_cocktail_repository.dart';

class MockSearchRemoteDataSource extends Mock
    implements SearchRemoteDataSource {}

void main() {
  late SearchCocktailRepository sut;
  late MockSearchRemoteDataSource dataSource;

  setUp(() {
    dataSource = MockSearchRemoteDataSource();
    sut = SearchCocktailRepository(searchRemoteDataSource: dataSource);
  });

  group('getSearchCocktailModel', () {
    test('should get data from json', () async {
      //1
      when(() => dataSource.getSearchCocktail(cocktailName: 'cocktailName'))
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
      final results = await sut.getCocktailModel(cocktailName: 'cocktailName');
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
