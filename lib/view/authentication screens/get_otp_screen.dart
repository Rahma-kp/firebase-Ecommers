import 'package:ecommersapp/controller/authentication.dart';
import 'package:ecommersapp/view/authentication%20screens/verify_otp_screen.dart';
import 'package:ecommersapp/view/widgets/button_widgets.dart';
import 'package:ecommersapp/view/widgets/navigator.dart';
import 'package:ecommersapp/view/widgets/text_fields_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetOtpPage extends StatelessWidget {
  GetOtpPage({super.key});
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
                            // inputFormatter:
                            //     FilteringTextInputFormatter.digitsOnly,
                            label: 'Enter PhoneNumber',
                            prefixText: '+91',
                            keyboardType: TextInputType.phone,
                            controller: getProvider.phoneController),
                        SizedBox(
                          height: size.width * .1,
                        ),
                        ButtonWidgets().fullWidthElevatedButton(
                          size,
                          label: 'Get Otp',
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              await getProvider.getOTP(
                                  '+91${getProvider.phoneController.text}');
                              // if (getProvider.isVerified == true) {
                              NavigatorWidget()
                                  .pushReplacement(context, VerifyOtpPage());
                              // } else {
                              // PopupWidgets()
                              //     .showErrorSnackbar(context, 'message');
                              // }
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
