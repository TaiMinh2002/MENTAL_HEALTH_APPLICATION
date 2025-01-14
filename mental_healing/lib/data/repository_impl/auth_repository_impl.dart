import 'package:mental_healing/api_manager/rest_client_base.dart';
import 'package:mental_healing/data/model/user/user_update_params.dart';
import 'package:mental_healing/data/model/sign_in/sign_in_params.dart';
import 'package:mental_healing/data/model/sign_in/sign_in_result.dart';
import 'package:mental_healing/data/model/sign_up/sign_up_params.dart';
import 'package:mental_healing/data/model/user/user_info.dart';
import 'package:mental_healing/data/repository/auth_repository.dart';
import 'package:mental_healing/global/app_url.dart';

class AuthRepositoryImpl extends AuthRepository {
  final RestClientBase _client = RestClientBase();

  @override
  Future<SignInResult> signIn({
    required SignInParams params,
  }) async {
    final response = await _client.post(
      AppUrl.apiSignIn,
      queryParameters: params.toJson(),
    );
    return SignInResult.fromMap(response);
  }

  @override
  Future<void> signUp({required SignUpParams params}) async {
    await _client.post(
      AppUrl.apiSignUp,
      queryParameters: params.toJson(),
    );
  }

  @override
  Future<void> signOut() async {
    await _client.post(AppUrl.apiLogout);
  }

  @override
  Future<SignInResult> refreshToken() async {
    final response = await _client.post(AppUrl.apiRefreshToken);
    return SignInResult.fromMap(response);
  }

  @override
  Future<UserInfo> updateUserInfo({required UserUpdateParams params}) async {
    final response =
        await _client.post(AppUrl.apiUserInfo, formData: params.toJson());
    return UserInfo.fromJson(response['user']);
  }
}
