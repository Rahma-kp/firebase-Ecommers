// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:ecommersapp/controller/product_provider.dart';
import 'package:ecommersapp/model/product_model.dart';
import 'package:ecommersapp/view/product%20screen/buy_product_page.dart';
import 'package:ecommersapp/view/product%20screen/sell_product.dart';
import 'package:ecommersapp/view/widgets/appbar_widget.dart';
import 'package:ecommersapp/view/widgets/button_widgets.dart';
import 'package:ecommersapp/view/widgets/icons_widgets.dart';
import 'package:ecommersapp/view/widgets/navigator.dart';
import 'package:ecommersapp/view/widgets/text_widgets.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductModel? products;
  ProductDetailsPage({super.key, required this.products});
  String? user;

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('yyyy MMMM dd').format(products!.timeStamp!);

    getUser();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWidgets().appBar(context,
          title: '',
          backgroundColor: Color.fromARGB(255, 37, 157, 192),
          foregroundColor: Colors.white),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(products!.image.toString()),
                      fit: BoxFit.contain,
                    ),
                    color: Colors.transparent,
                  ),
                  width: double.infinity,
                  height: size.height * .4,
                ),
                const SizedBox(height: 20),
                Text(
                  products!.price != null
                      ? "₹ ${products!.price.toString()}"
                      : '₹ 0000',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: size.width * .055,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      products!.title ?? 'Lorem Ipsum',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: size.width * .05,
                      ),
                    ),
                    Consumer<DatabaseProvider>(
                      builder: (context, provider, child) {
                        bool isFavorite = provider.wishListCheck(products!);
                        return IconsWidgets().IconButtonWidget(
                          context,
                          size,
                          iconData: isFavorite
                              ? EneftyIcons.heart_outline
                              : EneftyIcons.heart_bold,
                          color: Colors.red,
                          onPressed: () async {
                            final value =
                                await provider.wishListCheck(products!);
                            provider.IsWishLIstClick(products!.id, value);
                          },
                        );
                      },
                    )
                  ],
                ),
                TextWidgets().SubtitleText(context, text: formattedDate),
                Divider(),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidgets().BodyTextBold(context, text: "Brand"),
                    TextWidgets().BodyText(
                      context,
                      text: products!.brand.toString(),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextWidgets().BodyTextBold(
                  context,
                  text: "Description",
                ),
                Text(
                  products!.description ??
                      '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.''',
                  style: TextStyle(fontSize: size.width * .037),
                ),
                // const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          bottom: 10,
          left: 10,
          right: 10,
        ),
        child: Container(
          color: Color.fromARGB(255, 255, 255, 255),
          child: ButtonWidgets().fullWidthElevatedButtonWithIcon(size,
              onPressed: () {
            if (products!.user != user) {
              NavigatorWidget().push(context, ChatPage());
            } else {
              Provider.of<DatabaseProvider>(context, listen: false).isEdit =
                  true;
              NavigatorWidget().push(
                context,
                SellProductPage(
                  products: products,
                ),
              );
            }
          },
              label: products!.user != user ? 'Chat' : 'Update',
              icon: products!.user != user
                  ? EneftyIcons.message_2_outline
                  : EneftyIcons.edit_2_outline),
        ),
      ),
    );
  }

  void getUser() {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      return null;
    }

    user = currentUser.email ?? currentUser.phoneNumber;
  }
}
