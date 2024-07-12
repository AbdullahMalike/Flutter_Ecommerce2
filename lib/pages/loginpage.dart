import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset(
            "assets/images/logo.png",
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Welcome",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 32),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Enter Your Name",
                    labelText: "UserName",
                  ),
                ),
                TextFormField(
                  obscureText: true, // es se password hide ho jaen ga
                  decoration: InputDecoration(
                      hintText: "Enter Password", labelText: "Password"),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    print("Clicked");
                  },
                  child: Text("Login"),

                  style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),

                  
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
