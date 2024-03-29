 
import 'package:ecommersapp/controller/homepage_provider.dart';
// import 'package:ecommersapp/controller/wishlist_provider.dart';
import 'package:ecommersapp/model/product_model.dart';
import 'package:ecommersapp/services/auth_service.dart';
import 'package:ecommersapp/views/details.dart';
import 'package:ecommersapp/widgets/simmer_grid.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:provider/provider.dart';

// ignore: must_be_immutable
class FurnitureItems extends StatelessWidget {
  FurnitureItems({super.key});

  AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final homePro=Provider.of<HomeProvider>(context);
    return StreamBuilder<List<ProductModel>>(
      stream: homePro.getFurniture(),
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverFillRemaining(
            child: ShimmerLoader(),
          );
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return SliverFillRemaining(
            child: Text(
              snapshot.error.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          );
        } else if (snapshot.data == null) {
          return const SliverFillRemaining(
            child: CircularProgressIndicator(),
          );
        } else {
          return SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                ProductModel product = data[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(0.5),
                    child: GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(3, 4),
                                  blurRadius: 2.5,
                                  color: Colors.black.withOpacity(0.2)),
                            ],
                            color: const Color.fromARGB(255, 29, 35, 46),
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(fit: BoxFit.cover,
                                image: NetworkImage(product.image!, scale: 7,))),
                        child: Stack(
                          children: [
                            Positioned(
                                left: 10,
                                top: 10,
                                child: Text(
                                  product.category!,
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black, fontSize: 15,),
                                )),
                            Positioned(
                                right: 10,
                                top: 10,
                                child: InkWell(
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage('assets/images/favorite.png'))
                                    ),
                                  ),
                                  onTap: () {
                                    // pro.addProductToWishlist(product, auth.auth.currentUser!.uid);
                                  },
                                )),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.title ?? 'No title',
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  Text(
                                    '${product.price}',
                                    style: GoogleFonts.montserrat(
                                        color: const Color.fromARGB(255, 38, 183, 42),
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                                right: 10,
                                bottom: 10,
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor: const Color.fromARGB(255, 72, 71, 71).withOpacity(0.1),
                                  child: InkWell(
                                      onTap: () {},
                                      child: const Icon(
                                        Icons.arrow_forward_ios,
                                        size: 13,
                                        color: Colors.black,
                                      )),
                                ))
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsPage(
                          product: product,
                        )));
                      },
                    ),
                  ),
                );
              },
              childCount: data!.length,
            ),
          );
        }
      },
    );
  }
}