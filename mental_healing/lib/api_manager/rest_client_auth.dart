import 'package:dio/dio.dart';
import 'package:mental_healing/api_manager/rest_client.dart';

class RestClientAuth extends RestClient {
  factory RestClientAuth() {
    _singleton ??= RestClientAuth._internal(
        'http://172.20.10.7:6868/api/users',
        interceptors: null);
    return _singleton!;
  }

  RestClientAuth._internal(String baseUrl, {List<Interceptor>? interceptors})
      : super(baseUrl, interceptors);

  static RestClientAuth? _singleton;
}
