import 'package:flutter/material.dart';
import 'package:flutterpractise/pages/home_page.dart';
import 'package:flutterpractise/pages/loginpage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return  MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: false,
    
    primarySwatch: Colors.deepPurple,
    fontFamily: GoogleFonts.lato().fontFamily,
  //  textTheme: GoogleFonts.latoTextTheme()
    ),


     themeMode: ThemeMode.system,
    darkTheme: ThemeData(brightness: Brightness.dark),

    
   //  home: HomePage(),

// initialRoute: "/home",
routes: {
  "/": (context)=> LoginPage(),
  "/home" : (context)=> HomePage(),
  "/login" : (context)=> LoginPage()
},


    );
  }
}
