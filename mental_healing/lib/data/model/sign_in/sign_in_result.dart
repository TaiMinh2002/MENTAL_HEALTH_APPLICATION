import 'package:mental_healing/data/model/user/user_info.dart';

class SignInResult {
  SignInResult({this.userInfo, this.token, this.refreshToken});

  factory SignInResult.fromMap(Map<String, dynamic> map) {
    return SignInResult(
      userInfo: map['user'] != null
          ? UserInfo.fromJson(map['user'] as Map<String, dynamic>)
          : null,
      token: map['token'] != null ? map['token'] as String : null,
      refreshToken:
          map['refreshToken'] != null ? map['refreshToken'] as String : null,
    );
  }
  UserInfo? userInfo;
  String? token;
  String? refreshToken;
}
