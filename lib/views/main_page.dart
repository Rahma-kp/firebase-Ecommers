import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/views/auth_page.dart';
import 'package:firebase_login/widgets/bottombar.dart';
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
            return BottomNavigation();
          }else{
            return AuthPage();
          }
        },
        )
    );
  }
}