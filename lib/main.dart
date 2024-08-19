import 'package:flutter/material.dart';
import 'package:flutterpractise/pages/home_detailed_page.dart';
import 'package:flutterpractise/pages/home_page.dart';
import 'package:flutterpractise/pages/loginpage.dart';
import 'package:flutterpractise/pages/signup.dart';
import 'package:flutterpractise/utilies/routes.dart';
import 'package:flutterpractise/widgets/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme(),
      themeMode: ThemeMode.system,
      darkTheme: MyTheme.darkTheme(),
      initialRoute: MyRoutes.homeRoute, // or use "/"
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.signup: (context) => SignUp(),
        // MyRoutes.homedetailRoute: (context) => HomeDetail()
      },
    );
  }
}
