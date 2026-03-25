// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../api/api_services.dart' as _i394;
import '../../api/data_source/remote/auth/auth_remote_data_source_impl.dart'
    as _i661;
import '../../api/data_source/remote/brand/brand_remote_data_source_impl.dart'
    as _i892;
import '../../api/data_source/remote/categoty/category_remote_data_source_impl.dart'
    as _i537;
import '../../api/dio/git_it_module.dart' as _i541;
import '../../data/data_source/remote/auth/auth_remote_data_source.dart'
    as _i155;
import '../../data/data_source/remote/brand/brand_remote_data_source.dart'
    as _i511;
import '../../data/data_source/remote/category/category_remote_data_source.dart'
    as _i653;
import '../../data/repo/auth/auth_repo_impl.dart' as _i119;
import '../../data/repo/brands/brand_repo_impl.dart' as _i207;
import '../../data/repo/categories/category_repo_impl.dart' as _i230;
import '../../domain/repo/auth/auth_repo.dart' as _i894;
import '../../domain/repo/brand/brand_repo.dart' as _i797;
import '../../domain/repo/category/category_repo.dart' as _i360;
import '../../domain/usecase/auth/login_usecase.dart' as _i781;
import '../../domain/usecase/auth/regisrer_usecase.dart' as _i298;
import '../../domain/usecase/brands/get_all_categories_use_case.dart' as _i298;
import '../../domain/usecase/category/get_all_categories_use_case.dart'
    as _i530;
import '../../features/auth/cubit/auth/login/login_view_model.dart' as _i614;
import '../../features/auth/cubit/auth/register/register_view_model.dart'
    as _i1033;
import '../../features/main_layout/home/cubit/home_tap_view_model.dart'
    as _i183;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final gitItModule = _$GitItModule();
    gh.singleton<_i361.BaseOptions>(() => gitItModule.provideBaseOptions);
    gh.singleton<_i528.PrettyDioLogger>(
      () => gitItModule.providePrettyDioLogger,
    );
    gh.singleton<_i361.Dio>(() => gitItModule.provideDio);
    gh.singleton<_i394.ApiServices>(() => gitItModule.provideApiServices);
    gh.factory<_i653.CategoryRemoteDataSource>(
      () => _i537.CategoryRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i511.BrandRemoteDataSource>(
      () => _i892.BrandRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i360.CategoryRepo>(
      () => _i230.CategoryRepoImpl(
        categoryRemoteDataSource: gh<_i653.CategoryRemoteDataSource>(),
      ),
    );
    gh.factory<_i155.AuthRemoteDataSource>(
      () => _i661.AuthRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i797.BrandRepo>(
      () => _i207.BrandRepoImpl(
        brandRemoteDataSource: gh<_i511.BrandRemoteDataSource>(),
      ),
    );
    gh.factory<_i894.AuthRepo>(
      () => _i119.AuthRepoImpl(gh<_i155.AuthRemoteDataSource>()),
    );
    gh.factory<_i298.GetAllBrandsUseCase>(
      () => _i298.GetAllBrandsUseCase(brandRepo: gh<_i797.BrandRepo>()),
    );
    gh.factory<_i781.LoginUseCase>(
      () => _i781.LoginUseCase(gh<_i894.AuthRepo>()),
    );
    gh.factory<_i298.RegisterUseCase>(
      () => _i298.RegisterUseCase(gh<_i894.AuthRepo>()),
    );
    gh.factory<_i530.GetAllCategoriesUseCase>(
      () =>
          _i530.GetAllCategoriesUseCase(categoryRepo: gh<_i360.CategoryRepo>()),
    );
    gh.factory<_i183.HomeTapViewModel>(
      () => _i183.HomeTapViewModel(
        gh<_i530.GetAllCategoriesUseCase>(),
        gh<_i298.GetAllBrandsUseCase>(),
      ),
    );
    gh.factory<_i1033.RegisterViewModel>(
      () => _i1033.RegisterViewModel(gh<_i298.RegisterUseCase>()),
    );
    gh.factory<_i614.LoginViewModel>(
      () => _i614.LoginViewModel(gh<_i781.LoginUseCase>()),
    );
    return this;
  }
}

class _$GitItModule extends _i541.GitItModule {}
