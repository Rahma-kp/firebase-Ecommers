
import 'package:ecommersapp/controller/widget_provider.dart';
import 'package:ecommersapp/view/home%20screens/home_tab.dart';
import 'package:ecommersapp/view/product%20screen/my_product.dart';
import 'package:ecommersapp/view/profile%20screens/profile_tab.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomBarScreen extends StatelessWidget {
  BottomBarScreen({Key? key}) : super(key: key);

  final List<SalomonBottomBarItem> bottomItems = [
    SalomonBottomBarItem(
        icon: Icon(EneftyIcons.home_3_outline), title: Text('Home')),
    SalomonBottomBarItem(
        icon: Icon(EneftyIcons.forward_item_outline),
        title: Text('My Product')),
    SalomonBottomBarItem(
        icon: Icon(EneftyIcons.profile_outline), title: Text('Profile')),
  ];

  final List<Widget> tabsList = [
    HomeTab(),
    MyProductPage(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<WidgetProviders>(
      builder: (context, value, child) {
        return Scaffold(
          body: tabsList[value.currentIndex],
          bottomNavigationBar: Padding( 
            padding: const EdgeInsets.all(12.0),
            child: SalomonBottomBar(
              onTap: (index) => value.indexChanging(index),
              currentIndex: value.currentIndex,
              items: bottomItems,
            ),
          ),
        );
      },
    );
  }
}
