part of 'search_details_cubit.dart';

class SearchDetailsState {
  const SearchDetailsState({
    this.model = const [],
    this.status = Status.initial,
    this.errorMessage,
  });
  final List<CocktailModel> model;
  final Status status;
  final String? errorMessage;
}
