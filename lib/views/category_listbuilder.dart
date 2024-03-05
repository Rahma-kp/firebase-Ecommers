
import 'package:ecommersapp/controller/category_provider.dart';
import 'package:ecommersapp/controller/wishlist_provider.dart';
import 'package:ecommersapp/model/product_model.dart';
import 'package:ecommersapp/services/auth_service.dart';
import 'package:ecommersapp/views/details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CategoryListBuilder extends StatelessWidget {
  final CategoryProvider catPro;
   CategoryListBuilder({
    super.key,
    required this.catPro,
  });
  AuthService auth= AuthService();
  @override
  Widget build(BuildContext context) {
    final wishlistpro = Provider.of<Wishlist>(context);
    return CustomScrollView(
      slivers: [
        SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  ProductModel product = catPro.items[index];
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
                              color: Color.fromARGB(255, 236, 237, 240),
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
                                    style: GoogleFonts.montserrat(fontWeight: FontWeight.w500,
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
                                          fit: BoxFit.fill,
                                          image: AssetImage('assets/images/favorite.png'))
                                      ),
                                    ),
                                    onTap: () {
                                      wishlistpro.addProductToWishlist(product, auth.firebaseAuth.currentUser!.uid);
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
                                      style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${product.price}',
                                      style: GoogleFonts.montserrat(
                                          color: const Color.fromARGB(255, 38, 184, 43),
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
                                    backgroundColor: Colors.white.withOpacity(0.1),
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
                childCount: catPro.items.length,
              ),
            ),
      ],
    );
  }
}