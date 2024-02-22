import 'package:ecommers/controller/authontication_provider.dart';
import 'package:ecommers/widget/bottombar.dart';
import 'package:ecommers/widget/navigator.dart';
import 'package:ecommers/widget/popup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final getpro = Provider.of<AuthenticationProvider>(context, listen: false);
    return Scaffold(
      body: Form(key: formKey,
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Sign-Up",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: getpro.emailController,
                decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: getpro.passwordController,
                decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: getpro.confirmPasswordController,
                decoration: InputDecoration(
                    hintText: "confirm-Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            MaterialButton(
              onPressed: ()async {
                if (formKey.currentState!.validate()) {
                              try {
                                getpro.signUpWithEmail(
                                    getpro.emailController.text,
                                    getpro.passwordController.text);
                                NavigatorWidget().pushReplacement(
                                    context, BottomBarScreen());
                                PopupWidgets().showSuccessSnackbar(
                                    context, 'Account has been created');
                                getpro.clearControllers();
                              } catch (e) {
                                PopupWidgets().showErrorSnackbar(
                                    context, 'Account not created, try again');
                              }
                            }
                          },
              child: Text(
                "Sign-Up",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.black,
            ),
          ]),
        ),
      ),
    );
  }
}
