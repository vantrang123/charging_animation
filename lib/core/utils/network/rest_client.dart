import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter_template_rxdart/models/todo.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @Extra({
    DIO_CACHE_KEY_TRY_CACHE: true,
    DIO_CACHE_KEY_MAX_AGE: Duration(hours: 1),
    DIO_CACHE_KEY_FORCE_REFRESH: false,
  })
  @GET('/todos')
  Future<List<Todo>> getTodos();
}
