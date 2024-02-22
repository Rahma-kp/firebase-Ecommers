
import 'package:ecommers/controller/authontication_provider.dart';
import 'package:ecommers/view/authentication/get_otp_screen.dart';
import 'package:ecommers/widget/bottombar.dart';
import 'package:ecommers/widget/navigator.dart';
import 'package:ecommers/widget/popup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthPagesWidget {
  loginIcons(context) {
    Size size = MediaQuery.of(context).size;
    final getProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            try {
              await getProvider.googleSignIn();
              await PopupWidgets().showLoadingIndicator(context);
              NavigatorWidget().pushReplacement(context, BottomBarScreen());
              PopupWidgets().showSuccessSnackbar(context, 'You are logged In');
            } catch (e) {
              return;
            }
          },
          child: SizedBox(
            width: size.width * .08,
            height: size.width * .08,
            child: const Image(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/icons/google.png',
                )),
          ),
        ),
        SizedBox(
          width: size.width * .02,
        ),
        GestureDetector(
          onTap: () {
            getProvider.gitHubSignIn();
          },
          child: SizedBox(
            width: size.width * .08,
            height: size.width * .08,
            child: const Image(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/icons/github.png',
                )),
          ),
        ),
        SizedBox(
          width: size.width * .02,
        ),
        GestureDetector(
          onTap: () {
            NavigatorWidget().push(context, GetOtpPage());
          },
          child: SizedBox(
            width: size.width * .08,
            height: size.width * .08,
            child: const Image(
                fit: BoxFit.cover, image: AssetImage('assets/icons/phone.png')),
          ),
        ),
      ],
    );
  }
}