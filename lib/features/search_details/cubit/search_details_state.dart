part of 'search_details_cubit.dart';

class SearchDetailsState {
  const SearchDetailsState({
    required this.model,
    this.status = Status.initial,
    this.errorMessage,
  });
  final CocktailModel? model;
  final Status status;
  final String? errorMessage;
}
