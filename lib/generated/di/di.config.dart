// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:flutter_template_rxdart/core/utils/helpers/loading_helper.dart'
    as _i6;
import 'package:flutter_template_rxdart/core/utils/network/rest_client.dart'
    as _i7;
import 'package:flutter_template_rxdart/core/utils/validators/validators.dart'
    as _i4;
import 'package:flutter_template_rxdart/generated/di/di.dart' as _i8;
import 'package:flutter_template_rxdart/routes/router.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.AppRouter>(() => _i3.AppRouter());
  gh.lazySingleton<_i4.AppValidators>(() => _i4.AppValidators());
  gh.lazySingleton<_i5.Dio>(() => registerModule.dio);
  gh.lazySingleton<_i6.LoadingHelper>(() => _i6.LoadingHelper());
  gh.lazySingleton<_i7.RestClient>(() => registerModule.apiService);
  return getIt;
}

class _$RegisterModule extends _i8.RegisterModule {}
