import 'package:flutter/material.dart';

SizedBox spacingHeight(double height) => SizedBox(
      height: height,
    );
SizedBox spacingWidth(double width) => SizedBox(
      width: width,
    );

TextFormField textFormField({TextEditingController? controller, String? text}) {
  return TextFormField(
    controller: controller!,
    style: TextStyle(color: Colors.white),
    decoration: InputDecoration(
      hintText: text!,
      hintStyle: TextStyle(color: Color.fromARGB(255, 134, 133, 133)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.grey,
          
        )
      ),
      fillColor: Colors.white.withOpacity(0.070),
      filled: true,
    ),
  );
}

LinearGradient loginGradient() {
  return LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Colors.amber,
        Color.fromARGB(255, 250, 214, 107),
      ]);
}

LinearGradient signupGradient() {
  return LinearGradient(colors: [
    const Color.fromARGB(255, 33, 79, 243),
    Color.fromARGB(255, 111, 184, 244),
  ]);
}