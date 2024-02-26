
import 'package:ecommersapp/view/widgets/icons_widgets.dart';
import 'package:ecommersapp/view/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

class AppBarWidgets {
  appBarWithAction(context,
      {required title,
      IconData? iconbutton,
      Color? color,
      VoidCallback? onPressed}) {
    Size size = MediaQuery.of(context).size;
    return AppBar(
      backgroundColor: color,
      foregroundColor: const Color.fromARGB(255, 104, 89, 89),
      centerTitle: true,
      title: TextWidgets()
          .mainHeadingText(context, text: title, color: Colors.white),
      actions: [
        IconsWidgets().IconButtonWidget(context, size,
            color: Colors.white, iconData: iconbutton!, onPressed: onPressed)
      ],
    );
  }

  appBar(
    context, {
    Color? backgroundColor,
    Color? foregroundColor,
    required title,
  }) {
    return AppBar(
      centerTitle: true,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      title: TextWidgets()
          .mainHeadingText(context, text: title, color: Colors.white),
    );
  }
}
