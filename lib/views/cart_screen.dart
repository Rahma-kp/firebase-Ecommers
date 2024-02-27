import 'package:ecommersapp/controller/wishlist_provider.dart';
import 'package:ecommersapp/helpers/helpers.dart';
import 'package:ecommersapp/model/product_model.dart';
import 'package:ecommersapp/services/auth_service.dart';
import 'package:ecommersapp/widgets/shimmer_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  final ProductModel? product;

  CartPage({this.product});
  AuthService auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<Wishlist>(context);
    return Scaffold(
        backgroundColor:Color.fromARGB(255, 194, 195, 196),
        appBar: AppBar(
          title: Text(
            'Cart',
            style: GoogleFonts.montserrat(color: Colors.white),
          ),
          backgroundColor: Color.fromARGB(182, 217, 101, 81),
        ),
        body: FutureBuilder<List<ProductModel>>(
            future: pro.getWishlistItems(auth.auth.currentUser!.uid),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return ShimmerLoaderList();
              } else if (snapshot.hasError) {
                print('this is the snapshot error${snapshot.error}');
                return Text(snapshot.error.toString());
              } else {
                return ListView.builder(
                  itemCount: pro.wishlistItems.length,
                  itemBuilder: (context, index) {
                    final data = pro.wishlistItems[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 27, 35, 50),
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 80,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color.fromARGB(255, 37, 46, 61),
                                      image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: NetworkImage(data.image!)),
                                    ),
                                  ),
                                  spacingWidth(10),
                                  SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.title!,
                                          style: GoogleFonts.montserrat(
                                              color: Colors.white),
                                        ),
                                        Text(
                                          data.category!,
                                          style: GoogleFonts.montserrat(
                                              color: Colors.white),
                                        ),
                                        Text(
                                          '${data.price!}',
                                          style: GoogleFonts.montserrat(
                                              color: Colors.white),
                                        ),
                                        Text(
                                          '${data.rating!}',
                                          style: GoogleFonts.montserrat(
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              InkWell(
                                  onTap: () {
                                    pro.removeProductFromWishlist(
                                        data, auth.auth.currentUser!.uid,data.id);
                                  },
                                  child: Icon(Icons.delete_forever_outlined,color: Color.fromARGB(255, 241, 52, 52),))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            }));
  }
}