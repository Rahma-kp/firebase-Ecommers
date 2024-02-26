import 'dart:developer';
import 'package:ecommersapp/service/authentication_service.dart';
import 'package:ecommersapp/view/home%20screens/bottom_bar.dart';
import 'package:ecommersapp/view/widgets/navigator.dart';
import 'package:ecommersapp/view/widgets/popup_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationProvider extends ChangeNotifier {
  final AuthService emailAuthService = AuthService();
  TextEditingController otpController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<UserCredential> signUpWithEmail(String email, String password) async {
    return await emailAuthService.signUpWithEmail(email, password);
  }

  Future<UserCredential> signInWithEmail(String email, String password) async {
    return await emailAuthService.signInWithEmail(email, password);
  }

  Future<void> signOutWithEmail() async {
    return await emailAuthService.signOutWithEmail();
  }

  Future<void> googleSignIn() async {
    await emailAuthService.googleSignIn();
    notifyListeners();
  }

  Future<void> googleSignOut() async {
    await GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    notifyListeners();
  }

  Future<void> gitHubSignIn() async {
    await emailAuthService.gitHubSign();
    notifyListeners();
  }

  Future<void> getOTP(phoneNumber) async {
    await emailAuthService.getOTP(phoneNumber);
    notifyListeners();
  }

  User? getCurrentUser() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {}
    // notifyListeners();
    return currentUser;
  }

  Future<void> verifyOTP(otp, context) async {
    final credential = await emailAuthService.verifyOTP(otp);
    log(credential.toString());
    if (credential != null) {
      NavigatorWidget().pushReplacement(context, BottomBarScreen());
      PopupWidgets().showSuccessSnackbar(context, 'You are logged In');
    } else {
      print('OTP verification failed');
      PopupWidgets().showErrorSnackbar(context, 'Please enter the correct Otp');
    }
    notifyListeners();
  }

  clearControllers() {
    otpController.clear();
    phoneController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    notifyListeners();
  }
}
