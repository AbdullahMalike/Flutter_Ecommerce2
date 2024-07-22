import 'package:flutter/material.dart';
import 'package:flutterpractise/pages/home_page.dart';
import 'package:flutterpractise/pages/loginpage.dart';
import 'package:flutterpractise/pages/signup.dart';
import 'package:flutterpractise/utilies/routes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: "/", // or use "/"
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.signup: (context) => SignUp()
      },
    );
  }
}
