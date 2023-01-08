import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_cocktail_app/app/core/enums.dart';
import 'package:random_cocktail_app/domain/models/cocktail_model.dart';
import 'package:random_cocktail_app/domain/repositories/random_cocktail_repository.dart';
import 'package:random_cocktail_app/features/random_details/cubit/random_details_cubit.dart';

class MockRandomCocktailRepository extends Mock
    implements RandomCocktailRepository {}

void main() {
  late RandomDetailsCubit sut;
  late MockRandomCocktailRepository repository;

  setUp(() {
    repository = MockRandomCocktailRepository();
    sut = RandomDetailsCubit(randomRepository: repository);
  });

  group('getCocktailModel', () {
    group('sucess', () {
      setUp(() {
        when(() => repository.getRandomCocktailModel()).thenAnswer(
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

      blocTest<RandomDetailsCubit, RandomDetailsState>(
          'emits Statuus.loading then Status.success with results',
          build: () => sut,
          act: (cubit) => cubit.getCocktailModel(),
          expect: () => [
                RandomDetailsState(
                  model: null,
                  status: Status.loading,
                ),
                RandomDetailsState(
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
        when(() => repository.getRandomCocktailModel()).thenThrow(
          Exception('test-exception-errror'),
        );
      });

      blocTest<RandomDetailsCubit, RandomDetailsState>(
          'emits Statuus.loading then Status.error with error message',
          build: () => sut,
          act: (cubit) => cubit.getCocktailModel(),
          expect: () => [
                RandomDetailsState(
                  model: null,
                  status: Status.loading,
                ),
                RandomDetailsState(
                  status: Status.error,
                  errorMessage: 'Exception: test-exception-errror',
                ),
              ]);
    });
  });
}
