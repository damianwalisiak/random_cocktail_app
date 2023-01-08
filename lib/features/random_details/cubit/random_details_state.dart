part of 'random_details_cubit.dart';

@freezed
class RandomDetailsState with _$RandomDetailsState {
  const RandomDetailsState._();
  factory RandomDetailsState({
    @Default(null) CocktailModel? model,
    @Default(Status.initial) Status status,
    @Default('') String? errorMessage,
  }) = _RandomDetailsState;
}
