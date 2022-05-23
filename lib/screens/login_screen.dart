import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:social/login/kakao_login.dart';
import 'package:social/viewModel/login_view_model.dart';

import '../utils/index.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginVM = LoginViewModel(KakaoLogin());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () async {
                  loginVM.login();
                },
                child: Container(
                  height: 54,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kYellow,
                  ),
                  child: Row(
                    children: [
                      // Logo
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Image.asset(
                          "assets/images/kakaotalk_logo.png",
                          width: 24,
                        ),
                      ),
                      const Text(
                        "Sign In with Kakao",
                        style: TextStyle(color: kBrown),
                      ),
                    ],
                  ),
                ),
              ),
              TextButton(
                  onPressed: () async {
                    loginVM.logout();
                  },
                  child: Text("LogOut"))
            ],
          ),
        ),
      ),
    );
  }
}
