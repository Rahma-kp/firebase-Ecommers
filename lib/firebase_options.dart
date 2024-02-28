// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDdgVZ1fkCceUIdVMs8St-IEHZcckorAsc',
    appId: '1:794363327586:web:438e4e5e45c4332b5d8d3b',
    messagingSenderId: '794363327586',
    projectId: 'ecommerce-71f44',
    authDomain: 'ecommerce-71f44.firebaseapp.com',
    storageBucket: 'ecommerce-71f44.appspot.com',
    measurementId: 'G-2HVBPK5J00',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCrtPWBTcn4YCyyWnm9UJqS049nwFfkakY',
    appId: '1:794363327586:android:e35c9bfd84cb7b655d8d3b',
    messagingSenderId: '794363327586',
    projectId: 'ecommerce-71f44',
    storageBucket: 'ecommerce-71f44.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAR-UGt0sQaU2d2vPjzCnz5OVs4_kbsiCk',
    appId: '1:794363327586:ios:830b6e62ab18a5d25d8d3b',
    messagingSenderId: '794363327586',
    projectId: 'ecommerce-71f44',
    storageBucket: 'ecommerce-71f44.appspot.com',
    iosBundleId: 'com.example.ecommersapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAR-UGt0sQaU2d2vPjzCnz5OVs4_kbsiCk',
    appId: '1:794363327586:ios:b8f3dab707dada2f5d8d3b',
    messagingSenderId: '794363327586',
    projectId: 'ecommerce-71f44',
    storageBucket: 'ecommerce-71f44.appspot.com',
    iosBundleId: 'com.example.ecommersapp.RunnerTests',
  );
}
