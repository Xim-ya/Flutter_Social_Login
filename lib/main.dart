import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:social/utils/index.dart';

const kakaoKey = "0b4be9cbe73eb463c4d63fe9099b1f27";
void main() {
  KakaoSdk.init(nativeAppKey: "0b4be9cbe73eb463c4d63fe9099b1f27");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Social Login',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginScreen());
  }
}
