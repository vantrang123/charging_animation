import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_template_rxdart/core/utils/network/rest_client.dart';
import 'package:flutter_template_rxdart/generated/di/di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
// ignore: implementation_imports
import 'package:dio/src/adapters/io_adapter.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'initGetIt',
  asExtension: false,
)
void configureDependencies() => initGetIt(getIt);

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio()
    // ..httpClientAdapter = _getHttpClientAdapter()
    ..interceptors.add(
      DioCacheManager(CacheConfig()).interceptor,
    );

  // set proxy
  static IOHttpClientAdapter _getHttpClientAdapter() {
    IOHttpClientAdapter httpClientAdapter;
    httpClientAdapter = IOHttpClientAdapter();
    httpClientAdapter.createHttpClient = () {
      HttpClient client = HttpClient();
      client.findProxy = (uri) {
        return 'PROXY 192.168.1.139:8888';
      };
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        return true;
      };
      return client;
    };
    return httpClientAdapter;
  }

  @lazySingleton
  @factoryMethod
  RestClient get apiService => RestClient(getIt<Dio>());
}
