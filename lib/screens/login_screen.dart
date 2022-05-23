import '../utils/index.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                onPressed: () {},
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
            ],
          ),
        ),
      ),
    );
  }
}
