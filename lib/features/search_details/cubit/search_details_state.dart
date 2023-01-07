part of 'search_details_cubit.dart';

@freezed
class SearchDetailsState with _$SearchDetailsState {
  const SearchDetailsState._();
  factory SearchDetailsState({
    CocktailModel? model,
    @Default(Status.initial) Status status,
    @Default('') String? errorMessage,
  }) = _SearchDetailsState;
}
