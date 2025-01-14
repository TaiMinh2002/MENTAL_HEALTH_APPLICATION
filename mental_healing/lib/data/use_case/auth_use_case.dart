import 'package:dio/dio.dart';
import 'package:mental_healing/api_manager/api_error.dart';
import 'package:mental_healing/data/model/sign_in/sign_in_params.dart';
import 'package:mental_healing/data/model/sign_in/sign_in_result.dart';
import 'package:mental_healing/data/model/sign_up/sign_up_params.dart';
import 'package:mental_healing/data/model/user/user_info.dart';
import 'package:mental_healing/data/model/user/user_update_params.dart';
import 'package:mental_healing/data/repository/auth_repository.dart';
import 'package:mental_healing/data/repository_impl/auth_repository_impl.dart';

class AuthUseCase {
  final AuthRepository _repository = AuthRepositoryImpl();
  final CancelToken cancelTokenDeleteAccount = CancelToken();
  Future<void> signIn({
    required SignInParams params,
    required Function(SignInResult data) onSuccess,
    required Function(ApiError err) onFailure,
  }) async {
    try {
      final data = await _repository.signIn(params: params);
      onSuccess(data);
    } catch (exception) {
      onFailure(exception as ApiError);
    }
  }

  Future<void> signUp({
    required SignUpParams params,
    required Function() onSuccess,
    required Function(ApiError err) onFailure,
  }) async {
    try {
      await _repository.signUp(params: params);
      onSuccess();
    } catch (exception) {
      onFailure(exception as ApiError);
    }
  }

  Future<void> signOut({
    required Function() onSuccess,
    required Function(ApiError err) onFailure,
  }) async {
    try {
      await _repository.signOut();
      onSuccess();
    } catch (exception) {
      onFailure(exception as ApiError);
    }
  }

  Future<void> refreshToken({
    required Function(SignInResult data) onSuccess,
    required Function(ApiError err) onFailure,
  }) async {
    try {
      final data = await _repository.refreshToken();
      onSuccess(data);
    } catch (exception) {
      onFailure(exception as ApiError);
    }
  }

  Future<void> updateUserInfo({
    required UserUpdateParams param,
    required Function(UserInfo data) onSuccess,
    required Function(ApiError err) onFailure,
  }) async {
    try {
      final data = await _repository.updateUserInfo(params: param);
      onSuccess(data);
    } catch (exception) {
      onFailure(exception as ApiError);
    }
  }
}
