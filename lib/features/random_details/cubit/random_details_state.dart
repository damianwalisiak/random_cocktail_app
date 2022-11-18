part of 'random_details_cubit.dart';

class RandomDetailsState {
  const RandomDetailsState({
    this.model = const [],
    this.status = Status.initial,
    this.errorMessage,
  });
  final List<CocktailModel> model;
  final Status status;
  final String? errorMessage;
}
