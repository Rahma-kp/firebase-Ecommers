
import 'package:ecommersapp/authentication/auth.dart';
import 'package:ecommersapp/view/widgets/button_widgets.dart';
import 'package:ecommersapp/view/widgets/navigator.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: size.height *1,
          width: size.width * 1,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/welcome.jpg'))),
        ),
        Positioned(
          bottom: 80,
          left: 50,
          right: 50,
          child: ButtonWidgets().rectangleButton(
            size,
            name: 'Get Started',
            onPressed: () async {
              NavigatorWidget()
                  .pushReplacement(context, const AuthenticationPage());
            },
          ),
        ),
      ],
    ));
  }
}
