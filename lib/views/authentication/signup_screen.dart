
import 'package:ecommersapp/controller/auth_provider.dart';
import 'package:ecommersapp/widgets/bottombar.dart';
import 'package:ecommersapp/widgets/button_widgets.dart';
import 'package:ecommersapp/widgets/navigator.dart';
import 'package:ecommersapp/widgets/popup_widget.dart';
import 'package:ecommersapp/widgets/text_fields_widgets.dart';
import 'package:ecommersapp/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final getProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            getProvider.clearControllers();
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.02),
                Text(
                  "Create You Account",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: size.width * 0.07,
                  ),
                ),
                SizedBox(height: size.width * 0.1),
                Card(
                  surfaceTintColor: Colors.white,
                  elevation: size.width * 0.05,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(size.width * 0.04),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        TextFieldWidgets().textFormField(size,
                            controller: getProvider.emailController,
                            label: 'Email',
                            type: "Email"),
                        TextFieldWidgets().textFormField(
                          size,
                          label: 'Password',
                          type: "Password",
                          controller: getProvider.passwordController,
                        ),
                        TextFieldWidgets().textFormField(
                          size,
                          label: 'Confirm Password',
                          type: "Confirm Password",
                          cnfController: getProvider.passwordController,
                          controller: getProvider.confirmPasswordController,
                        ),
                        SizedBox(height: size.width * 0.05),
                        ButtonWidgets().fullWidthElevatedButton(
                          size,
                          label: 'Sign Up',
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              try {
                                getProvider.signUpWithEmail(
                                    getProvider.emailController.text,
                                    getProvider.passwordController.text);
                                NavigatorWidget().pushReplacement(
                                    context, BottomBarScreen());
                                PopupWidgets().showSuccessSnackbar(
                                    context, 'Account has been created');
                                getProvider.clearControllers();
                              } catch (e) {
                                PopupWidgets().showErrorSnackbar(
                                    context, 'Account not created, try again');
                              }
                            }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextWidgets().SubtitleText(context,
                                text: 'Already have an account?'),
                            ButtonWidgets().textButtonWidget(
                              size,
                              context,
                              label: 'SIGN IN',
                              onPressed: () {
                                getProvider.clearControllers();
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}