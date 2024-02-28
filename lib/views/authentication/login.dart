
import 'package:ecommersapp/controller/auth_provider.dart';
import 'package:ecommersapp/views/authentication/signup_screen.dart';
import 'package:ecommersapp/widgets/autpage_widget.dart';
import 'package:ecommersapp/widgets/bottombar.dart';
import 'package:ecommersapp/widgets/button_widgets.dart';
import 'package:ecommersapp/widgets/navigator.dart';
import 'package:ecommersapp/widgets/popup_widget.dart';
import 'package:ecommersapp/widgets/style_widgets.dart';
import 'package:ecommersapp/widgets/text_fields_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final getProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);

    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      // ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * .05,
                ),
                Text(
                  "Hello!",
                  style: TextStyle(fontSize: size.width * .12),
                ),
                Text(
                  "WELCOME BACK",
                  style: TextStyle(
                      fontWeight: FontWeight.w700, fontSize: size.width * .07),
                ),
                SizedBox(
                  height: size.width * .1,
                ),
                Card(
                  surfaceTintColor: Colors.white,
                  color: Colors.white,
                  elevation: size.width * .05,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(size.width * .04))),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        TextFieldWidgets().textFormField(size,
                            label: 'Email',
                            controller: getProvider.emailController),
                        TextFieldWidgets().textFormField(size,
                            label: 'Password',
                            type: "Password",
                            controller: getProvider.passwordController),
                        SizedBox(
                          height: size.width * .1,
                        ),
                        ButtonWidgets().fullWidthElevatedButton(
                          size,
                          label: 'Log in',
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              try {
                                await getProvider.signInWithEmail(
                                    getProvider.emailController.text,
                                    getProvider.passwordController.text);
                                PopupWidgets().showSuccessSnackbar(
                                    context, 'user logid in');
                                NavigatorWidget().pushReplacement(
                                    context, BottomBarScreen());
                              } catch (e) {
                                PopupWidgets().showErrorSnackbar(
                                    context, 'User not found!');
                              }
                            }
                          },
                        ),
                        SizedBox(
                          height: size.width * .05,
                        ),
                        StyleWidgets().lineDivider(text: 'or'),
                        AuthPagesWidget().loginIcons(context),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Create a account?'),
                            ButtonWidgets().textButtonWidget(size, context,
                                label: 'SIGN UP', onPressed: () async {
                              await getProvider.clearControllers();
                              NavigatorWidget().push(context, SignUpPage());
                            }),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}