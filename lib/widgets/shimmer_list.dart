import 'package:firebase_login/controller/wishlist_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoaderList extends StatelessWidget {
  const ShimmerLoaderList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
      itemCount: Provider.of<Wishlist>(context).wishlistItems.length,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Color.fromARGB(255, 40, 49, 69),
          highlightColor: Color.fromARGB(255, 126, 138, 179),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 49, 58, 83).withOpacity(0.2),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      '',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(""),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      '',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(""),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}