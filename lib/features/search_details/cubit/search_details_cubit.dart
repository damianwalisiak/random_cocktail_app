import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:random_cocktail_app/app/core/enums.dart';
import 'package:random_cocktail_app/domain/models/cocktail_model.dart';
import 'package:random_cocktail_app/domain/repositories/search_cocktail_repository.dart';

part 'search_details_cubit.freezed.dart';
part 'search_details_state.dart';

class SearchDetailsCubit extends Cubit<SearchDetailsState> {
  SearchDetailsCubit({required this.searchRepository})
      : super(SearchDetailsState());

  final SearchCocktailRepository searchRepository;

  Future<void> getCocktailModel({
    required String cocktailName,
  }) async {
    emit(
      state.copyWith(
        status: Status.loading,
      ),
    );
    try {
      final CocktailModel cocktailModel =
          await searchRepository.getCocktailModel(
        cocktailName: cocktailName,
      );
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
          errorMessage: 'Cocktail does not exist. Please enter a valid name',
        ),
      );
    }
  }
}
