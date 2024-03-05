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
    style: const TextStyle(color: Colors.white),
    decoration: InputDecoration(
      hintText: text!,
      hintStyle: const TextStyle(color: Color.fromARGB(255, 134, 133, 133)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.grey,
          
        )
      ),
      fillColor: Colors.white.withOpacity(0.070),
      filled: true,
    ),
  );
}

LinearGradient loginGradient() {
  return const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Colors.black,
        Colors.black,
      ]);
}

LinearGradient signupGradient() {
  return const LinearGradient(colors: [
    Color.fromARGB(255, 33, 79, 243),
    Color.fromARGB(255, 111, 184, 244),
  ]);
}