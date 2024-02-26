import 'package:firebase_login/widgets/furniture_grid.dart';
import 'package:firebase_login/widgets/shoe_grid.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 24, 30, 41),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 24, 30, 41),
        title: Text('Your Store',style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Furniture',
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                ],
              ),
            ),
          ),
           FurnitureItems(),  
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text('Sports',
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
            ),
          ),
          
          ShoeItems(),
        ],
      ),
    );
  }
}