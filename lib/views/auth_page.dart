import 'package:firebase_login/views/login.dart';
import 'package:firebase_login/views/signup.dart';
import 'package:flutter/material.dart';


class AuthPage extends StatefulWidget {
   AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(showRegisterPage: toggleScreen);
    } else {
      return SignUpPage(showLoginPage: toggleScreen);
    }
  }

  void toggleScreen() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
}