import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:random_cocktail_app/app/core/enums.dart';
import 'package:random_cocktail_app/domain/models/cocktail_model.dart';
import 'package:random_cocktail_app/domain/repositories/random_cocktail_repository.dart';

part 'random_details_cubit.freezed.dart';
part 'random_details_state.dart';

class RandomDetailsCubit extends Cubit<RandomDetailsState> {
  RandomDetailsCubit({required this.randomRepository})
      : super(RandomDetailsState());

  final RandomCocktailRepository randomRepository;

  Future<void> getCocktailModel() async {
    emit(
      state.copyWith(
        status: Status.loading,
      ),
    );

    try {
      final CocktailModel cocktailModel =
          await randomRepository.getRandomCocktailModel();

      emit(
        state.copyWith(
          model: cocktailModel,
          status: Status.success,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
