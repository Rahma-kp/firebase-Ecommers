import 'package:ecommers/widget/button_widget.dart';
import 'package:ecommers/widget/text_widget.dart';
import 'package:flutter/material.dart';

class PopupWidgets {
  void showSuccessSnackbar(BuildContext context, String message) {
    final snackbar = SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Text(message),
      duration: const Duration(seconds: 3),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void showErrorSnackbar(BuildContext context, String message) {
    final snackbar = SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Text(message),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  Future<void> showLoadingIndicator(context) async {
    showDialog(
      context: context,
      builder: (context) => Container(
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
    await Future.delayed(const Duration(seconds: 2));
  }

  Future<void> showLoadingIndicatorWithoutColor(context) async {
    showDialog(
      context: context,
      builder: (context) => Container(
        color: Color.fromARGB(106, 0, 0, 0),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
    await Future.delayed(const Duration(seconds: 2));
  }

  Future<void> showLoadingIndicatorWithFunction(BuildContext context,
      {required Future<void> Function() function}) async {
    showDialog(
      context: context,
      builder: (context) => Container(
        color: Color.fromARGB(76, 0, 0, 0),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
    await function();
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pop(context);
  }

  Future<void> showWarningDialog(BuildContext context,
      {required String label,
      required VoidCallback onPressed,
      required String text,
      String? title}) {
    final Size size = MediaQuery.of(context).size;
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextWidgets().BodyText(context, text: text),
        surfaceTintColor: Colors.white,
        title: Center(
          child: TextWidgets().titleText2(
            context,
            text: title ?? 'Warning',
            color: Colors.red,
          ),
        ),
        actions: [
          ButtonWidgets().textButtonWidget(
            size,
            context,
            label: 'Cancel',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          ButtonWidgets().textButtonWidget(
            size,
            context,
            color: Colors.red,
            label: label,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}