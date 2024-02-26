import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommersapp/model/auth_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  String collection = 'UserPost';
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<UserCredential> signUpWithEmail(String email, String password) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      log('Account created');
      return userCredential;
    } on FirebaseAuthMultiFactorException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<UserCredential> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      log('User loged in');
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<void> signOutWithEmail() async {
    await firebaseAuth.signOut();
  }

  Future<void> googleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth == null) {
        log('Google authentication failed');
        throw Exception('Google authentication failed');
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final User? guser = userCredential.user;
      log("${guser?.displayName}");

      final authenticationModel = AuthenticationModel(
        email: guser?.email,
        name: guser?.displayName,
        phoneNumber: guser?.phoneNumber,
        uId: guser?.uid,
      );
      await firestore.collection(collection).doc(guser?.uid).set(
            authenticationModel.toJson(),
          );
    } catch (e) {
      print('Google Sign-In Error: $e');
      throw e;
    }
  }

  Future<UserCredential?> gitHubSign() async {
    if (firebaseAuth.currentUser != null) {
      return null;
    }

    GithubAuthProvider githubAuthProvider = GithubAuthProvider();
    try {
      UserCredential user =
          await firebaseAuth.signInWithProvider(githubAuthProvider);
      User gituser = user.user!;
      final AuthenticationModel userData = AuthenticationModel(
          email: gituser.email, name: gituser.displayName, uId: gituser.uid);
      firestore.collection(collection).doc(gituser.uid).set(userData.toJson());
      return user;
    } catch (e) {
      rethrow;
    }
  }

  String? _verificationId;

  Future<void> getOTP(String phoneNumber) async {
    try {
      await firebaseAuth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await firebaseAuth.signInWithCredential(credential);
          },
          verificationFailed: (error) {
            log("verificationFailed ${error.message}");
          },
          codeSent: (String verificationId, int? forceResendingToken) {
            _verificationId = verificationId;
            log(verificationId);
          },
          codeAutoRetrievalTimeout: (verificationId) {
            _verificationId = verificationId;
          },
          timeout: Duration(seconds: 60));
    } catch (e) {
      log("phoneSignIn error: $e");
    }
  }

  Future<PhoneAuthCredential?> verifyOTP(String otp) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: otp,
      );
      return credential;
    } catch (e) {
      log("verifyOTP error: $e");
      return null;
    }
  }
}
