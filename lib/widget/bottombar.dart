import 'package:ecommers/controller/bottombar_provider.dart';
import 'package:ecommers/view/cart_screen.dart';
import 'package:ecommers/view/home_screen.dart';
import 'package:ecommers/view/profile_screen.dart';
import 'package:ecommers/view/wish_scree.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomBarScreen extends StatelessWidget {
  final List<Widget> _pages = [
    HomeScreen(),
    WishScreen(),
    CartScreen(),
    ProfileScreen()
  ];

   BottomBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomProvider = Provider.of<BottomBarProvider>(context);
    return Scaffold(
      body: _pages[bottomProvider.currentIndex],
      bottomNavigationBar: Container(
        child: NavigationBar(
          selectedIndex: bottomProvider.currentIndex,
          onDestinationSelected: (index) {
            bottomProvider.navigatePage(index);
          },
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home,
                  color: bottomProvider.currentIndex == 0
                      ? Colors.white
                      :Color.fromARGB(255, 0, 0, 0)),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite_border,
                  size: 30,
                  color: bottomProvider.currentIndex == 1
                      ? Colors.white
                      : Color.fromARGB(255, 0, 0, 0)),
              label: 'Wishs',
            ),
            NavigationDestination(
              icon: Icon(Icons.shopping_cart_outlined,
                  color: bottomProvider.currentIndex == 2
                      ? Colors.white
                      : Color.fromARGB(255, 0, 0, 0)),
              label: 'Cart',
            ),
              NavigationDestination(
              icon: Icon(Icons.person_outline_sharp,
                  color: bottomProvider.currentIndex == 3
                      ? Colors.white
                      : Color.fromARGB(255, 0, 0, 0)),
              label: "Account",
            ),
          ],
          indicatorColor:Color.fromARGB(255, 233, 176, 210),
          surfaceTintColor:const Color.fromARGB(255, 4, 2, 17),
        ),
      ),
    );
  }
}
