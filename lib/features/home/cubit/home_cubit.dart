// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:random_cocktail_app/app/core/enums.dart';
// import 'package:random_cocktail_app/domain/models/cocktail_model.dart';
// import 'package:random_cocktail_app/domain/repositories/search_cocktail_repository.dart';

// part 'home_state.dart';

// class HomeCubit extends Cubit<HomeState> {
//   HomeCubit() : super(const HomeState());

//   Future<void> getCocktailModel({
//     // required String cocktailName,
//     String? name,
//     required String category,
//     required String alcoholic,
//     required String glassType,
//     required String pictureUrl,
//     required String instructions,
//   }) async {
//     emit(const HomeState(status: Status.loading));
//     try {
//       final List<CocktailModel> cocktailModel = getCocktailModel(
//         name: name,
//         category: category,
//         alcoholic: alcoholic,
//         glassType: glassType,
//         pictureUrl: pictureUrl,
//         instructions: instructions,
//         // cocktailName: '',
//       ) as List<CocktailModel>;
//       emit(
//         HomeState(
//           model: cocktailModel,
//           status: Status.success,
//         ),
//       );
//     } catch (error) {
//       emit(
//         HomeState(
//           status: Status.error,
//           errorMessage: error.toString(),
//         ),
//       );
//     }
//   }
// }
