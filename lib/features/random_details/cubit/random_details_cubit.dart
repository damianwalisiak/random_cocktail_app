import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:random_cocktail_app/app/core/enums.dart';
import 'package:random_cocktail_app/domain/models/cocktail_model.dart';
import 'package:random_cocktail_app/domain/models/ingredient_model.dart';
import 'package:random_cocktail_app/domain/repositories/random_cocktail_repository.dart';

part 'random_details_state.dart';

class RandomDetailsCubit extends Cubit<RandomDetailsState> {
  RandomDetailsCubit(this._randomRepository)
      : super(const RandomDetailsState());

  final RandomCocktailRepository _randomRepository;

  Future<void> getCocktailModel({
    // required String cocktailName,
    required String name,
    required String category,
    required String alcoholic,
    required String glassType,
    required String pictureUrl,
    required String instructions,
    required List<IngredientModel> ingredients,
  }) async {
    emit(const RandomDetailsState(status: Status.loading));
    try {
      final List<CocktailModel> cocktailModel =
          (await _randomRepository.getCocktailModel(
        name: name,
        category: category,
        alcoholic: alcoholic,
        glassType: glassType,
        pictureUrl: pictureUrl,
        instructions: instructions,
        ingredients: ingredients,
      ));
      emit(
        RandomDetailsState(
          model: cocktailModel,
          status: Status.success,
        ),
      );
    } catch (error) {
      emit(
        RandomDetailsState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
