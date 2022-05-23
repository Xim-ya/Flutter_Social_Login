import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:social/login/social_login.dart';

class KakaoLogin implements SocialLogin {
  @override
  Future<bool> login() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();
      if (isInstalled) {
        try {
          await UserApi.instance.loginWithKakaoTalk();
          return true;
        } catch (e) {
          return false;
        }
      } else {
        try {
          UserApi.instance.loginWithKakaoAccount();
          return true;
        } catch (e) {
          return false;
        }
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    try {
      print("Kakao Login 성공");
      await UserApi.instance.unlink();
      return true;
    } catch (e) {
      print("Kakao Login 실패");
      return false;
    }
  }
}
