import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:random_cocktail_app/app/core/enums.dart';
import 'package:random_cocktail_app/domain/models/cocktail_model.dart';
import 'package:random_cocktail_app/domain/repositories/random_cocktail_repository.dart';

part 'random_details_cubit.freezed.dart';
part 'random_details_state.dart';

class RandomDetailsCubit extends Cubit<RandomDetailsState> {
  RandomDetailsCubit({required this.randomRepository})
      : super(RandomDetailsState(model: null));

  final RandomCocktailRepository randomRepository;

  Future<void> getCocktailModel() async {
    emit(RandomDetailsState(
      model: null,
      status: Status.loading,
    ));

    try {
      final CocktailModel cocktailModel =
          await randomRepository.getRandomCocktailModel();

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
