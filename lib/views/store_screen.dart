import 'package:ecommersapp/widgets/furniture_grid.dart';
import 'package:ecommersapp/widgets/shoe_grid.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 194, 195, 196),
      appBar: AppBar(
        backgroundColor:  const Color.fromARGB(182, 217, 101, 81),
        title: Text('Your Store',style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('collection',
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                ],
              ),
            ),
          ),
           FurnitureItems(),  
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text('New collections',
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
            ),
          ),
          
          ShoeItems(),
        ],
      ),
    );
  }
}