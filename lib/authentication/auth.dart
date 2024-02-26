import 'package:ecommersapp/view/authentication%20screens/login_screen.dart';
import 'package:ecommersapp/view/home%20screens/bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: currentUser != null ? BottomBarScreen() : LoginPage(),
    );
  }
}
