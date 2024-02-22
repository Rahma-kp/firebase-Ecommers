import 'package:flutter/material.dart';

class NavigatorWidget {
  push(context, Widget location) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return location;
      },
    ));
  }

  pushReplacement(context, Widget location) {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return location;
      },
    ));
  }

  pushRemoveUntil(context, Widget location) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => location,
        ),
        (route) => false);
  }
}