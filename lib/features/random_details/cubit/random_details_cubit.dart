import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:random_cocktail_app/app/core/enums.dart';
import 'package:random_cocktail_app/domain/models/cocktail_model.dart';
import 'package:random_cocktail_app/domain/models/ingredient_model.dart';
import 'package:random_cocktail_app/domain/repositories/random_cocktail_repository.dart';

part 'random_details_state.dart';

class RandomDetailsCubit extends Cubit<RandomDetailsState> {
  RandomDetailsCubit(this._randomRepository)
      : super(const RandomDetailsState(model: null));

  final RandomCocktailRepository _randomRepository;

  Future<void> getCocktailModel() async {
    emit(const RandomDetailsState(
      model: null,
      status: Status.loading,
    ));

    try {
      final CocktailModel cocktailModel =
          await _randomRepository.getRandomCocktailModel();

      emit(
        RandomDetailsState(
          model: cocktailModel,
          status: Status.success,
        ),
      );
    } catch (error) {
      emit(
        RandomDetailsState(
          model: null,
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
