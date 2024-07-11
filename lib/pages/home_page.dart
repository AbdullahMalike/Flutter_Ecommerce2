import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    int age = 25;
    return Scaffold(
      appBar: AppBar(
        title : const Text("Demo App"),
        centerTitle: true,
        
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to my First Mobile App\n My age is $age"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
