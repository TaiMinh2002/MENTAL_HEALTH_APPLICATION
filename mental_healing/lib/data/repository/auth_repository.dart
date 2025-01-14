import 'package:mental_healing/data/model/user/user_update_params.dart';
import 'package:mental_healing/data/model/sign_in/sign_in_params.dart';
import 'package:mental_healing/data/model/sign_in/sign_in_result.dart';
import 'package:mental_healing/data/model/sign_up/sign_up_params.dart';
import 'package:mental_healing/data/model/user/user_info.dart';

abstract class AuthRepository {
  Future<SignInResult> signIn({required SignInParams params});
  Future<void> signUp({required SignUpParams params});
  Future<UserInfo> updateUserInfo({required UserUpdateParams params});
  Future<void> signOut();
  Future<SignInResult> refreshToken();
}
