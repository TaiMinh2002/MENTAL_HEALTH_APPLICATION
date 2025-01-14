import 'package:dio/dio.dart';
import 'package:mental_healing/api_manager/rest_client.dart';

class RestClientBase extends RestClient {
  factory RestClientBase() {
    _singleton ??= RestClientBase._internal(
        'http://172.20.10.7:6868/api/users',
        interceptors: null);
    return _singleton!;
  }

  RestClientBase._internal(String baseUrl, {List<Interceptor>? interceptors})
      : super(baseUrl, interceptors);

  static RestClientBase? _singleton;
}
