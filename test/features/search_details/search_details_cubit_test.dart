import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_cocktail_app/app/core/enums.dart';
import 'package:random_cocktail_app/domain/models/cocktail_model.dart';
import 'package:random_cocktail_app/domain/repositories/search_cocktail_repository.dart';
import 'package:random_cocktail_app/features/search_details/cubit/search_details_cubit.dart';

class MockSearchCocktailRepository extends Mock
    implements SearchCocktailRepository {}

void main() {
  late SearchDetailsCubit sut;
  late MockSearchCocktailRepository repository;

  setUp(() {
    repository = MockSearchCocktailRepository();
    sut = SearchDetailsCubit(searchRepository: repository);
  });

  group('getCocktailModel', () {
    group('sucess', () {
      setUp(() {
        when(() => repository.getCocktailModel(cocktailName: 'cocktailName'))
            .thenAnswer(
          (_) async => CocktailModel(
            'name',
            'category',
            'alcoholic',
            'glassType',
            'pictureUrl',
            'instructions',
            [],
          ),
        );
      });

      blocTest<SearchDetailsCubit, SearchDetailsState>(
          'emits Statuus.loading then Status.success with results',
          build: () => sut,
          act: (cubit) => cubit.getCocktailModel(cocktailName: 'cocktailName'),
          expect: () => [
                SearchDetailsState(
                  model: null,
                  status: Status.loading,
                ),
                SearchDetailsState(
                  model: CocktailModel(
                    'name',
                    'category',
                    'alcoholic',
                    'glassType',
                    'pictureUrl',
                    'instructions',
                    [],
                  ),
                  status: Status.success,
                ),
              ]);
    });

    group('failure', () {
      setUp(() {
        when(() => repository.getCocktailModel(cocktailName: 'cocktailName'))
            .thenThrow(
          Exception('Cocktail does not exist. Please enter a valid name'),
        );
      });

      blocTest<SearchDetailsCubit, SearchDetailsState>(
          'emits Statuus.loading then Status.error with error message',
          build: () => sut,
          act: (cubit) => cubit.getCocktailModel(cocktailName: 'cocktailName'),
          expect: () => [
                SearchDetailsState(
                  model: null,
                  status: Status.loading,
                ),
                SearchDetailsState(
                  status: Status.error,
                  model: null,
                  errorMessage:
                      'Cocktail does not exist. Please enter a valid name',
                ),
              ]);
    });
  });
}
