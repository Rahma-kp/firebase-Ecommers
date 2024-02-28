
import 'package:ecommersapp/controller/bottombar_provider.dart';
import 'package:ecommersapp/views/home_screen.dart';
import 'package:ecommersapp/views/profile_screen.dart';
import 'package:ecommersapp/views/store_screen.dart';
import 'package:ecommersapp/views/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<BottomBarScreen> {
  @override
    final List<Widget> _pages = [
    HomePage(),
    StorePage(),
    // CartPage(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomProvider=Provider.of<BottomBarProvider>(context);
    return Scaffold(
      backgroundColor:  Color.fromARGB(255, 230, 231, 235),
      body: _pages[bottomProvider.currentIndex],
      bottomNavigationBar: Container( 
        child: NavigationBar(
          backgroundColor:  Colors.white,
          selectedIndex: bottomProvider.currentIndex,
          onDestinationSelected: (index) {
            bottomProvider.navigatePage(index);
          },
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home,
                  color:  bottomProvider.currentIndex == 0 ?Colors.white : Colors.black),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.shop,
                  color:  bottomProvider.currentIndex == 1 ? Colors.white : Colors.black),
              label: 'Store',
              
            ),
            NavigationDestination(
              icon: Icon(Icons.shopping_cart,
                  color:  bottomProvider.currentIndex == 2 ?Colors.white : Colors.black),
              label: 'Cart',
            ),
            NavigationDestination(
              icon: Icon(Icons.person,
                  color:  bottomProvider.currentIndex == 3 ?Colors.white : Colors.black),
              label: 'User',
      
            ),
          ],
          indicatorColor:  Color.fromARGB(182, 217, 101, 81),
        ),
      ),
    );
  }
}