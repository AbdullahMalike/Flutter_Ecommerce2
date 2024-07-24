import 'package:flutter/material.dart';
import 'package:flutterpractise/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    int age = 25;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Catalog App",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Text("Welcome to my First Mobile App\n My age is $age"),
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
