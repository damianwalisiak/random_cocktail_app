part of 'home_cubit.dart';

class HomeState {
  const HomeState({
    this.model = const [],
    this.status = Status.initial,
    this.errorMessage,
  });
  final List<CocktailModel> model;
  final Status status;
  final String? errorMessage;
}
