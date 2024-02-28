
import 'package:ecommersapp/helpers/helpers.dart';
import 'package:ecommersapp/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class DetailsPage extends StatelessWidget {
  final ProductModel product;
  DetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(182, 217, 101, 81),
      ),
      backgroundColor: Color.fromARGB(255, 194, 195, 196),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(4, 4),
                              blurRadius: 2.5,
                              color: Colors.black.withOpacity(0.2)),
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                            image: NetworkImage(product.image!),
                            fit: BoxFit.contain),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          backgroundColor: const Color.fromARGB(255, 108, 107, 107).withOpacity(0.2),
                          child: Icon(Icons.arrow_left,color: Colors.black.withOpacity(0.5),),
                        ),
                      )),
                      Positioned(
                        bottom: 20,
                        right: 20,
                        child: Container(
                          width: 60,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                              const Color.fromARGB(255, 26, 210, 32),
                              Color.fromARGB(255, 117, 242, 121)
                            ])
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${product.rating!}',style: GoogleFonts.montserrat(color: Colors.white,fontWeight: FontWeight.w600),),
                                Icon(Icons.star,color: Colors.white,size: 15,)
                              ],
                            ),
                          ),
                        ),
                      )
                  ],
                ),
                spacingHeight(20),
                Text(
                  product.title!,
                  style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                spacingHeight(10),
                Text(
                  product.category!,
                  style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                spacingHeight(15),
                Text(
                  '${product.price} /-',
                  style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
                spacingHeight(20),
                Text(
                  product.description!,
                  style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 80,
              color:Color.fromARGB(255, 143, 144, 145),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('Get Product',style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),),
                        Icon(Icons.arrow_right_outlined,color: Colors.green,size:50,)
                      ],
                    ),
                    Container(
                      height: 60,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromARGB(182, 217, 101, 81),
                      ),
                      child: Center(
                        child: Text('Buy Now',style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500)),
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}