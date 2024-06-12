import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page"),
      centerTitle: true,),
      body: Center(
        child: Container(
          child: const Text("Login Form",style: TextStyle(
            fontSize: 20,
           color: Colors.deepPurple,
           fontWeight: FontWeight.bold,
           
          ),
         
          ),
        ),
      ),
    );
  }
}