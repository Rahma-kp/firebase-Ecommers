// ignore_for_file: must_be_immutable

import 'package:enefty_icons/enefty_icons.dart';
import 'package:ecommersapp/controller/authentication.dart';
import 'package:ecommersapp/controller/widget_provider.dart';
import 'package:ecommersapp/view/pages/blank_page.dart';
import 'package:ecommersapp/view/pages/wishlist_page.dart';
import 'package:ecommersapp/view/product%20screen/my_product.dart';
import 'package:ecommersapp/view/welcome%20screens/welcome_page.dart';
import 'package:ecommersapp/view/widgets/popup_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  ProfileTab({super.key});

  final List listTitles = [
    'my Products',
    'Wishlist',
    'shipping adress',
    'settings',
  ];

  final List listSubTitles = [
    'Already have 10 orders',
    'You have 2 cards',
    '03 Addresses',
    'Notification, Password, FAQ, Contact',
  ];

  final List<Widget> listTabs = [
    MyProductPage(), WishlistPage(),
    const BlankPage(
      name: 'SHIPPING ADRESS',
    ),

    const BlankPage(
      name: 'SHIPPING ADRESS',
    ),
    // const WishListTab(),
    // const CartPage(),
    // const SettingsPage(),
  ];

  String? username;

  String? email;

  @override
  Widget build(BuildContext context) {
    final getProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    final User? user = getProvider.getCurrentUser();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () async {
                PopupWidgets().showWarningDialog(context,
                    label: 'Log out',
                    onPressed: () => logOut(context),
                    text:
                        'Are you sure you want to log out? Any unsaved work may be lost.',
                    title: 'Warning');
                // logOut(context);
              },
              icon: const Icon(
                EneftyIcons.logout_outline,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/icons/profile icons.png'),
                  radius: 50,
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  width: size.width * .03,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width * .5,
                      child: Text(
                        user!.displayName ?? 'Uknown name',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * .05,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * .5,
                      child: Text(
                        user.email ?? 'email not registerd',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: size.width * .035,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: size.width * .1,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => Material(
                  elevation: 20,
                  shadowColor: const Color.fromARGB(48, 0, 0, 0),
                  child: ListTile(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => listTabs[index],
                        )),
                    title: Text(
                      listTitles[index].toString().toUpperCase(),
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: size.width * .04,
                      ),
                    ),
                    subtitle: Text(
                      listSubTitles[index],
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: size.width * .03,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_outlined,
                        size: size.width * 0.055),
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: size.width * .05,
                ),
                itemCount: listTabs.length,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> logOut(context) async {
    final getProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    getProvider.googleSignOut();
    getProvider.signOutWithEmail();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pop(context);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const Welcome(),
        ),
        (route) => false);

    await Provider.of<WidgetProviders>(
      context,
      listen: false,
    ).bottomBarFunction();
    PopupWidgets().showSuccessSnackbar(context, 'Log out Successfully');
  }
}