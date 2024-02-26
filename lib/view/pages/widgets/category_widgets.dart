
import 'package:ecommersapp/model/product_model.dart';
import 'package:ecommersapp/view/widgets/icons_widgets.dart';
import 'package:ecommersapp/view/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CategoryWidgets {
  Widget buildProductItem(Size size,
      {List<ProductModel>? products, String? category}) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: GridView.builder(
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
          late final filterdProduct;
          if (product.category == 'Mobile') {
            filterdProduct = product;
          }
          return Stack(
            children: [
              Container(
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
                        child: Image(
                            fit: BoxFit.cover,
                            image: filterdProduct.image!.isNotEmpty
                                ? NetworkImage(filterdProduct.image.toString())
                                : Lottie.asset('assets/lottie/sellX logo.json')
                                    as ImageProvider)),
                    const SizedBox(height: 10),
                    TextWidgets()
                        .HeadingText(context, text: filterdProduct.title!),
                    TextWidgets()
                        .SubtitleText(context, text: filterdProduct.subtitile!),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidgets().titleText2(context,
                            text: "₹${filterdProduct.price.toString()}"),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                  right: 2,
                  bottom: 2,
                  child: IconsWidgets().IconButtonWidget(
                    context,
                    size,
                    iconData: Icons.favorite_border,
                    onPressed: () {},
                  ))
            ],
          );
        },
        itemCount: products!.length,
      ),
    );
  }
}
