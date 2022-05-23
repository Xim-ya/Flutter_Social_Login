import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:social/login/social_login.dart';

class LoginViewModel {
  final SocialLogin _socialLogin;
  bool isLogined = false;
  User? user;

  LoginViewModel(this._socialLogin);

  Future login() async {
    isLogined = await _socialLogin.login();
    if (isLogined) {
      user = await UserApi.instance.me();
      print(user?.kakaoAccount);
    }
  }

  Future logout() async {
    await _socialLogin.logout();
    isLogined = false;
    user = null;
  }
}
