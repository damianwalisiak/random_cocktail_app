import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:random_cocktail_app/app/core/enums.dart';
import 'package:random_cocktail_app/domain/models/cocktail_model.dart';
import 'package:random_cocktail_app/domain/models/ingredient_model.dart';
import 'package:random_cocktail_app/domain/repositories/search_cocktail_repository.dart';

part 'search_details_state.dart';

class SearchDetailsCubit extends Cubit<SearchDetailsState> {
  SearchDetailsCubit(this._searchRepository)
      : super(const SearchDetailsState());

  final SearchCocktailRepository _searchRepository;

  Future<void> getCocktailModel({
    required String cocktailName,
  }) async {
    emit(const SearchDetailsState(status: Status.loading));
    try {
      final List<CocktailModel> cocktailModel =
          await _searchRepository.getCocktailModel(
        cocktailName: cocktailName,
      );
      emit(
        SearchDetailsState(
          model: cocktailModel,
          status: Status.success,
        ),
      );
    } catch (error) {
      emit(
        SearchDetailsState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
