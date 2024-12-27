import 'package:dio/dio.dart';
import 'package:mental_healing/api_manager/rest_client.dart';

class RestClientBase extends RestClient {
  factory RestClientBase() {
    _singleton ??= RestClientBase._internal(
        'http://192.168.0.102:3000/api/users',
        interceptors: null);
    return _singleton!;
  }

  RestClientBase._internal(String baseUrl, {List<Interceptor>? interceptors})
      : super(baseUrl, interceptors);

  static RestClientBase? _singleton;
}
