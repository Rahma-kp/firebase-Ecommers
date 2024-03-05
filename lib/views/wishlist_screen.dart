import 'package:ecommersapp/controller/wishlist_provider.dart';
import 'package:ecommersapp/helpers/helpers.dart';
import 'package:ecommersapp/model/product_model.dart';
import 'package:ecommersapp/services/auth_service.dart';
import 'package:ecommersapp/widgets/shimmer_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  final ProductModel? product;

  CartScreen({this.product});
  AuthService auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<Wishlist>(context);
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 194, 195, 196),
        appBar: AppBar(
          title: Text(
            'WishList',
            style: GoogleFonts.montserrat(color: Colors.white),
          ),
          backgroundColor: Color.fromARGB(182, 217, 101, 81),
        ),
        body: FutureBuilder<List<ProductModel>>(
            future: pro.getWishlistItems(auth.firebaseAuth.currentUser!.uid),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return ShimmerLoaderList();
              } else if (snapshot.hasError) {
                print('this is the snapshot error${snapshot.error}');
                return Text(snapshot.error.toString());
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final data = pro.wishlistItems[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 120,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 217, 213, 213),
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
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
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          'Category : ${data.category!}',
                                          style: GoogleFonts.montserrat(
                                              color: Colors.black),
                                        ),
                                        Text(
                                          '${data.price!}',
                                          style: GoogleFonts.montserrat(
                                              color: Colors.black),
                                        ),
                                        Text(
                                          '${data.rating!}',
                                          style: GoogleFonts.montserrat(
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              spacingWidth(50),
                              InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text(
                                            'you want to remove from the whishlist...?',
                                            style: GoogleFonts.montserrat(
                                              color: Colors.black,
                                              fontSize: 18,
                                            ),
                                          ),
                                          backgroundColor: Colors.white,
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  pro.removeProductFromWishlist(
                                                      data,
                                                      auth.firebaseAuth
                                                          .currentUser!.uid,
                                                      data.id);
                                                  Navigator.pop(context);
                                                },
                                                child: Text('Yes')),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('No')),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Icon(
                                    Icons.close,
                                    color: Color.fromARGB(255, 241, 52, 52),
                                  ))
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
