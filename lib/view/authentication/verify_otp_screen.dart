
import 'package:ecommers/controller/authontication_provider.dart';
import 'package:ecommers/widget/button_widget.dart';
import 'package:ecommers/widget/textfiled_widet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class VerifyOtpPage extends StatelessWidget {
  VerifyOtpPage({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final getPro =
        Provider.of<AuthenticationProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.width * .2,
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
                            inputFormatter:
                                FilteringTextInputFormatter.digitsOnly,
                            label: 'Enter OTP',
                            keyboardType: TextInputType.phone,
                            controller: getPro.otpController),
                        SizedBox(
                          height: size.width * .1,
                        ),
                        ButtonWidgets().fullWidthElevatedButton(
                          size,
                          label: 'Verfy',
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              await getPro.verifyOTP(
                                  context, getPro.otpController.text);

                              ;
                            }
                          },
                        ),
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