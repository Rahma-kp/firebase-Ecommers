import 'dart:developer';

import 'package:connectivity/connectivity.dart';

class ConnectivityServices {
  Future<bool> checkInternet() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    log(connectivityResult.toString());
    return connectivityResult != ConnectivityResult.none;
  }
}
