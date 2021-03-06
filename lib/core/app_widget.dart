import 'package:flutter/material.dart';
import 'package:split_it/pages/home/home_page.dart';
import 'package:split_it/pages/login/login_page.dart';
import 'package:split_it/pages/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Split.it",
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashPage(),
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage(),
        "/error": (context) => LoginPage(),
      },
    );
  }
}
