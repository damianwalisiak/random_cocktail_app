// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:random_cocktail_app/app/data/remote_data_sources/random_remote_data_source.dart'
    as _i3;
import 'package:random_cocktail_app/app/data/remote_data_sources/search_remote_data_source.dart'
    as _i4;
import 'package:random_cocktail_app/domain/repositories/random_cocktail_repository.dart'
    as _i5;
import 'package:random_cocktail_app/domain/repositories/search_cocktail_repository.dart'
    as _i7;
import 'package:random_cocktail_app/features/random_details/cubit/random_details_cubit.dart'
    as _i6;
import 'package:random_cocktail_app/features/search_details/cubit/search_details_cubit.dart'
    as _i8;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.RandomRemoteDataSource>(() => _i3.RandomRemoteDataSource());
    gh.factory<_i4.SearchRemoteDataSource>(() => _i4.SearchRemoteDataSource());
    gh.factory<_i5.RandomCocktailRepository>(() => _i5.RandomCocktailRepository(
        randomRemoteDataSource: gh<_i3.RandomRemoteDataSource>()));
    gh.factory<_i6.RandomDetailsCubit>(() => _i6.RandomDetailsCubit(
        randomRepository: gh<_i5.RandomCocktailRepository>()));
    gh.factory<_i7.SearchCocktailRepository>(() => _i7.SearchCocktailRepository(
        searchRemoteDataSource: gh<_i4.SearchRemoteDataSource>()));
    gh.factory<_i8.SearchDetailsCubit>(() => _i8.SearchDetailsCubit(
        searchRepository: gh<_i7.SearchCocktailRepository>()));
    return this;
  }
}
