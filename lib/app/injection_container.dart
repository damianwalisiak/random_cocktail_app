import 'package:get_it/get_it.dart';
import 'package:random_cocktail_app/app/data/remote_data_sources/random_remote_data_source.dart';
import 'package:random_cocktail_app/app/data/remote_data_sources/search_remote_data_source.dart';
import 'package:random_cocktail_app/domain/repositories/random_cocktail_repository.dart';
import 'package:random_cocktail_app/domain/repositories/search_cocktail_repository.dart';
import 'package:random_cocktail_app/features/random_details/cubit/random_details_cubit.dart';
import 'package:random_cocktail_app/features/search_details/cubit/search_details_cubit.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  //Bloc
  getIt.registerFactory(() => RandomDetailsCubit(randomRepository: getIt()));
  getIt.registerFactory(() => SearchDetailsCubit(searchRepository: getIt()));

  //Repositories
  getIt.registerFactory(
      () => RandomCocktailRepository(randomRemoteDataSource: getIt()));
  getIt.registerFactory(
      () => SearchCocktailRepository(searchRemoteDataSource: getIt()));

  //DataSources
  getIt.registerFactory(() => RandomRemoteDataSource());
  getIt.registerFactory(() => SearchRemoteDataSource());
}
