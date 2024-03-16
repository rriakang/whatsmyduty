import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:myduty/screens/start_page.dart';
import 'package:myduty/screens/login_page.dart';
import 'package:myduty/screens/main_page.dart';


void main() async {
  runApp(const MyApp());
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          page: () => StartPage(), //로그인,회원가입 라우터
        ),
        GetPage(
          name: "/login",
          page: () => LoginPage(),
        ),
        GetPage(
          name: "/main",
          page: () => Myduty(),
        ),
        // GetPage(
        //   name: "/main",
        //   page: () => MainPage(),
        // ),
      ],
    );
  }
}