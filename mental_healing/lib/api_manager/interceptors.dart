import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:mental_healing/api_manager/api_error.dart';
import 'package:mental_healing/base/cache_manager.dart';
import 'package:mental_healing/data/model/sign_in/sign_in_result.dart';
import 'package:mental_healing/data/use_case/auth_use_case.dart';
import 'package:mental_healing/global/app_log.dart';
import 'package:mental_healing/global/app_router.dart';
import 'package:mental_healing/utils/functions.dart';

class SessionInterceptor with CacheManager implements InterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      if (err.response?.statusCode != 500) {
        AppLog.dbPrint(
            '=======> [DioError][${err.response?.statusCode}][${err.response?.realUri.path}] ${err.response} <=======');
      } else {
        AppLog.dbPrint(
            '=======> #[DioError][${err.response?.statusCode}][${err.response?.realUri.path}] ${err.response} <=======');
      }
    }

    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    AppLog.dbPrint(
        '=======> ${options.method} ${options.baseUrl}${options.path}');
    options.headers.addAll(
      <String, dynamic>{'Accept': 'application/json'},
    );
    if (getToken() != null) {
      options.headers.addAll(
        <String, dynamic>{'Authorization': 'Bearer ${getToken()}'},
      );
    }
    AppLog.dbPrint('=======> HEADER: ${options.headers}');

    if (options.data != null) {
      AppLog.dbPrint('=======> [REQUEST DATA]: ${options.data}');
    } else if (options.queryParameters.isNotEmpty) {
      AppLog.dbPrint(
          '=======> [REQUEST queryParameters]: ${options.queryParameters}');
    }
    return handler.next(options);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    AppLog.dbPrint(
        '<=== ${response.statusCode} [${response.requestOptions.method}] ${response.requestOptions.baseUrl}${response.requestOptions.path}');
    if (response.requestOptions.data != null) {
      AppLog.dbPrint('<=== [RESPONSE DATA]: ${response.requestOptions.data}');
    } else if (response.requestOptions.queryParameters.isNotEmpty) {
      AppLog.dbPrint(
          '<=== [RESPONSE queryParameters]: ${response.requestOptions.queryParameters}');
    }

    if (response.data is String && isNotNullOrEmpty(response.data)) {
      response.data = jsonDecode(response.data as String);
    }
    if (response.data is Map || response.data is List) {
      AppLog.dbPrint(jsonEncode(response.data));
    } else {
      AppLog.dbPrint('${response.data}');
    }

    return handler.next(response);
  }
}

class RefreshTokenInterceptor extends Interceptor with CacheManager {
  RefreshTokenInterceptor(this.dio);

  final Dio dio;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      if (err.response?.statusCode == 500) {
        AppLog.dbPrint('=======> [Server Error][${err.message}] <=======');
      }
      if (err.response?.statusCode == 401) {
        if (getToken() != null &&
            err.response?.data['message'] == 'Token invalid') {
          _onRefreshToken(onSuccess: (String token) {
            _retry(requestOptions: err.requestOptions, token: token);
          });
        }
      }
    }
    return handler.next(err);
  }

  Future<Response<dynamic>> _retry({
    required RequestOptions requestOptions,
    required String token,
  }) {
    final options = Options(method: requestOptions.method);
    options.headers?.addAll(
      <String, dynamic>{'content-type': 'application/json'},
    );
    options.headers?.addAll(
      <String, dynamic>{'Authorization': 'Bearer $token'},
    );
    return dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  void handleError({required int code, String path = ''}) {
    switch (code) {}
  }

  Future<void> _onRefreshToken(
      {required Function(String token) onSuccess}) async {
    final AuthUseCase authUseCase = AuthUseCase();
    authUseCase.refreshToken(
      onSuccess: (SignInResult data) {
        if (isNotNullOrEmpty(data.token)) {
          saveToken(data.token);
          onSuccess(data.token!);
        }
      },
      onFailure: (ApiError err) async {
        await removeAllCache();
        if (g.Get.currentRoute != AppRouter.routerSignIn) {
          g.Get.offAllNamed(AppRouter.routerSignIn);
        }
      },
    );
  }
}
