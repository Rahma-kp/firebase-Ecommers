import 'package:ecommersapp/controller/product_provider.dart';
import 'package:ecommersapp/model/product_model.dart';
import 'package:ecommersapp/view/pages/category_page.dart';
import 'package:ecommersapp/view/product%20screen/product_details_page.dart';
import 'package:ecommersapp/view/widgets/icons_widgets.dart';
import 'package:ecommersapp/view/widgets/navigator.dart';
import 'package:ecommersapp/view/widgets/text_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:enefty_icons/enefty_icons.dart';

class HomeWidgets {
  Widget specialProduct(Size size, {required String imagePath}) {
    return Container(
      width: size.width * .7,
      height: size.width * .4,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
        color: const Color.fromARGB(255, 30, 29, 29),
        borderRadius: BorderRadius.all(Radius.circular(size.width * .03)),
      ),
    );
  }

  Widget categoryItems(context, Size size,
      {category, required String imagePath}) {
    return GestureDetector(
      onTap: () => NavigatorWidget().push(
          context,
          CategoryPage(
            category: category,
          )),
      child: CircleAvatar(radius: 40,
        child: Container(
          width: size.width * .2,
          height: size.width * .2,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imagePath), fit: BoxFit.cover),
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(size.width * .05)),
          ),
        ),
      ),
    );
  }



  Widget buildProductItem(Size size, DatabaseProvider provider,
      {List<ProductModel>? products}) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: size.width * 0.05,
        crossAxisSpacing: size.width * 0.015,
        childAspectRatio: size.width / (size.width * 1.5),
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return Stack(
          children: [
            GestureDetector(
              onTap: () => NavigatorWidget().push(
                context,
                ProductDetailsPage(
                  products: product,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.width * 0.42,
                      width: size.width * 0.42,
                      child: product.image!.isNotEmpty
                          ? Image(
                              fit: BoxFit.contain,
                              image: NetworkImage(product.image!),
                            )
                          : Lottie.asset('assets/lottie/sellX logo.json'),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: size.width * .1,
                      child: TextWidgets()
                          .titleText2(context, text: product.title!),
                    ),
                    TextWidgets().SubtitleText(context, text: product.brand!),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidgets().titleText2(context,
                            text: "₹${product.price.toString()}"),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              right: 2,
              bottom: 2,
              child: IconsWidgets().IconButtonWidget(
                context,
                size,
                iconData: wishListCheck(product)
                    ? EneftyIcons.heart_outline
                    : EneftyIcons.heart_bold,
                color: Colors.red,
                onPressed: () async {
                  final value = await wishListCheck(product);
                  provider.IsWishLIstClick(product.id, value);
                },
              ),
            ),
          ],
        );
      },
      itemCount: products!.length,
    );
  }

  bool wishListCheck(ProductModel product) {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userEmail = user.email ?? user.phoneNumber;
      if (product.wishList!.contains(userEmail)) {
        return false;
      } else {
        return true;
      }
    }
    return true;
  }
}
