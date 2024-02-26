
import 'package:ecommersapp/controller/bottombar_provider.dart';
import 'package:ecommersapp/views/home.dart';
import 'package:ecommersapp/views/profile.dart';
import 'package:ecommersapp/views/storagepage.dart';
import 'package:ecommersapp/views/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<BottomNavigation> {
  @override
    final List<Widget> _pages = [
    HomePage(),
    StorePage(),
    CartPage(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomProvider=Provider.of<BottomBarProvider>(context);
    return Scaffold(
      backgroundColor:  Color.fromARGB(255, 24, 30, 41),
      body: _pages[bottomProvider.currentIndex],
      bottomNavigationBar: Container( 
        child: NavigationBar(
          backgroundColor:  Color.fromARGB(255, 18, 23, 31),
          selectedIndex: bottomProvider.currentIndex,
          onDestinationSelected: (index) {
            bottomProvider.navigatePage(index);
          },
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home,
                  color:  bottomProvider.currentIndex == 0 ? Colors.white : const Color.fromARGB(255, 106, 105, 105)),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.shop,
                  color:  bottomProvider.currentIndex == 1 ? Colors.white : const Color.fromARGB(255, 106, 105, 105)),
              label: 'Store',
              
            ),
            NavigationDestination(
              icon: Icon(Icons.shopping_cart,
                  color:  bottomProvider.currentIndex == 2 ? Colors.white : const Color.fromARGB(255, 106, 105, 105)),
              label: 'Cart',
            ),
            NavigationDestination(
              icon: Icon(Icons.usb_rounded,
                  color:  bottomProvider.currentIndex == 3 ? Colors.white : const Color.fromARGB(255, 106, 105, 105)),
              label: 'User',
      
            ),
          ],
          indicatorColor: Colors.amber,
        ),
      ),
    );
  }
}