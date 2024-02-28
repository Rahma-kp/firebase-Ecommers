
import 'package:ecommersapp/views/authentication/login.dart';
import 'package:ecommersapp/widgets/bottombar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return BottomBarScreen();
          }else{
            return LoginPage();
          }
        },
        )
    );
  }
}