import 'package:ecommers/controller/authontication_provider.dart';
import 'package:ecommers/view/authentication/signup_screen.dart';
import 'package:ecommers/view/authentication/widgets/login_widget.dart';
import 'package:ecommers/widget/bottombar.dart';
import 'package:ecommers/widget/button_widget.dart';
import 'package:ecommers/widget/navigator.dart';
import 'package:ecommers/widget/popup.dart';
import 'package:ecommers/widget/textfiled_widet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final getpro = Provider.of<AuthenticationProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Log-in",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    TextFieldWidgets().textFormField(
                      size,
                      label: "Email",
                      controller: getpro.emailController,
                    ),
                    TextFieldWidgets().textFormField(size,
                        controller: getpro.passwordController,
                        label: "Password",
                        type: "Password"),
                    SizedBox(
                      height: size.width * .1,
                    ),
                    MaterialButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            try {
                              await getpro.signInWithEmail(
                                  getpro.emailController.text,
                                  getpro.passwordController.text);
                              PopupWidgets().showSuccessSnackbar(
                                  context, 'user logid in');
                              NavigatorWidget()
                                  .pushReplacement(context, BottomBarScreen());
                            } catch (e) {
                              PopupWidgets().showErrorSnackbar(
                                  context, 'User not found!');
                            }
                          }
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.black),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    AuthPagesWidget().loginIcons(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Create a account?'),
                        ButtonWidgets().textButtonWidget(size, context,
                            label: 'SIGN UP', onPressed: () async {
                          await getpro.clearControllers();
                          NavigatorWidget().push(context, SignUpScreen());
                        }),
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
