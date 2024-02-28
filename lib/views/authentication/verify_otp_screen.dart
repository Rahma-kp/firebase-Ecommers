
import 'package:ecommersapp/controller/auth_provider.dart';
import 'package:ecommersapp/widgets/button_widgets.dart';
import 'package:ecommersapp/widgets/text_fields_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class VerifyOtpPage extends StatelessWidget {
  VerifyOtpPage({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final getProvider =
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
                Center(
                  child: SizedBox(
                      height: size.width * 0.6,
                      child: Image(
                        fit: BoxFit.contain,
                        image: AssetImage(
                          'assets/icons/get otp.png',
                        ),
                      )),
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
                            // maxLine: 6,
                            inputFormatter:
                                FilteringTextInputFormatter.digitsOnly,
                            label: 'Enter OTP',
                            keyboardType: TextInputType.phone,
                            controller: getProvider.otpController),
                        SizedBox(
                          height: size.width * .1,
                        ),
                        ButtonWidgets().fullWidthElevatedButton(
                          size,
                          label: 'Verfy',
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              await getProvider.verifyOTP(
                                  context, getProvider.otpController.text);

                              ;
                            }
                          },
                        ),
                        ButtonWidgets().textButtonWidget(size, context,
                            label: 'Resend OTP', onPressed: () async {
                          await getProvider.getOTP(context,
                              '+91${getProvider.phoneController.text}');
                        })
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