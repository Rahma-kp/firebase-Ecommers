import 'package:ecommersapp/controller/product_provider.dart';
import 'package:ecommersapp/view/widgets/appbar_widget.dart';
import 'package:ecommersapp/view/widgets/icons_widgets.dart';
import 'package:ecommersapp/view/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  final String category;
  CategoryPage({required this.category, Key? key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWidgets().appBar(context, title: category),
      body: Consumer<DatabaseProvider>(
        builder: (context, value, child) {
          final filteredProducts = value.allProduct
              .where((product) => product.category == category)
              .toList();

          return filteredProducts.isNotEmpty
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: size.width * 0.05,
                    crossAxisSpacing: size.width * 0.015,
                    childAspectRatio: size.width / (size.width * 1.6),
                  ),
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    final product = filteredProducts[index];
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
                                child: product.image!.isNotEmpty
                                    ? Image.network(
                                        product.image.toString(),
                                        fit: BoxFit.cover,
                                      )
                                    : Lottie.asset(
                                        'assets/lottie/sellX logo.json'),
                              ),
                              const SizedBox(height: 10),
                              TextWidgets()
                                  .HeadingText(context, text: product.title!),
                              TextWidgets()
                                  .SubtitleText(context, text: product.brand!),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextWidgets().titleText2(context,
                                      text: "₹${product.price.toString()}"),
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
                          ),
                        ),
                      ],
                    );
                  },
                )
              : Center(
                  child: Lottie.asset(
                      width: size.width * .20,
                      height: size.width * .20,
                      'assets/lottie/sellX logo.json'),
                );
        },
      ),
    );
  }
}
