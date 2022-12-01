part of 'random_details_cubit.dart';

class RandomDetailsState {
  const RandomDetailsState({
    required this.model,
    this.status = Status.initial,
    this.errorMessage,
  });
  final CocktailModel? model;
  final Status status;
  final String? errorMessage;
}
