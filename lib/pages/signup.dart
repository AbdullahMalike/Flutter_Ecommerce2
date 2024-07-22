import 'package:flutter/material.dart';
import 'package:flutterpractise/utilies/routes.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool buttonchanged = false;
  final _keyform = GlobalKey<FormState>();

  movetologin(BuildContext context) async {
    if (_keyform.currentState!.validate()) {
      setState(() {
        buttonchanged = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.loginRoute);
      setState(() {
        buttonchanged = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Form(
                  key: _keyform,
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
                        "SignUp Page",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 40),
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                  hintText: "Enter First Name",
                                  labelText: "First Name"),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "please enter your first name";
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                  hintText: "Enter Last Name",
                                  labelText: "Last Name"),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "please enter your last name";
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                  hintText: "Enter Email", labelText: "Email"),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "please enter your email";
                                } else if (!value.contains("@")) {
                                  return "please type correct email using @";
                                } else if (!value.contains(".")) {
                                  return "please type correct email using .";
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              obscureText: true,
                              decoration: const InputDecoration(
                                  hintText: "Enter Password",
                                  labelText: "Password"),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "please enter your password";
                                } else if (value.length < 6) {
                                  return "make sure your password length greater then 6";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () => movetologin(context),
                              child: AnimatedContainer(
                                duration: Duration(seconds: 1),
                                height: 50,
                                width: buttonchanged ? 50 : 150,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple,
                                    borderRadius: BorderRadius.circular(
                                        buttonchanged ? 50 : 10)),
                                child: buttonchanged
                                    ? Icon(
                                        Icons.done,
                                        color: Colors.white,
                                      )
                                    : Text(
                                        "SignUp",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      )),
    );
  }
}
