import 'dart:developer';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class ConnectivityProvider extends ChangeNotifier {
  checkInternet() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    log(connectivityResult.toString());
    connectivityResult != ConnectivityResult.none;
  }
}
