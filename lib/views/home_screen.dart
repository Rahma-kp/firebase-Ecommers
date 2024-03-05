import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommersapp/controller/homepage_provider.dart';
import 'package:ecommersapp/helpers/helpers.dart';
import 'package:ecommersapp/services/auth_service.dart';
import 'package:ecommersapp/widgets/category_list.dart';
import 'package:ecommersapp/widgets/furniture_grid.dart';
import 'package:ecommersapp/widgets/shoe_grid.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthService auth = AuthService();

  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).getCurrentUser();
  }
  final List<String> images = [
    "assets/images/offer 1.jpg",
    "assets/images/offer 2.jpg",
    "assets/images/offer 4.jpeg",
    "assets/images/offer3.jpeg",
    "assets/images/offer 5.jpeg",
    "assets/images/offfer 6.jpeg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 194, 195, 196),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(182, 217, 101, 81),
        title: Text('fashion',
            style: GoogleFonts.aclonica(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.white)),
                centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, bottom: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Start',
                          style: GoogleFonts.montserrat(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromARGB(255, 0, 0, 0))),
                      const Icon(
                        Icons.arrow_right,
                        color: Colors.green,
                      ),
                      spacingWidth(10),
                      Text('Shopping',
                          style: GoogleFonts.montserrat(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              items: images.map((String imageUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 29, 35, 46),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(imageUrl))),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
          ),
          Categories(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Choose your',
                          style: GoogleFonts.montserrat(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                      spacingWidth(10),
                      Text('Products',
                          style: GoogleFonts.montserrat(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ],
                  ),
                  Text('collection',
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                ],
              ),
            ),
          ),
          ShoeItems(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text('New Collections',
                  style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),
            ),
          ),
          FurnitureItems(),
        ],
      ),
    );
  }
}
