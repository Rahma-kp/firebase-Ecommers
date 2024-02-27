
import 'package:ecommersapp/controller/homepage_provider.dart';
import 'package:ecommersapp/model/category_model.dart';
import 'package:ecommersapp/services/auth_service.dart';
import 'package:ecommersapp/widgets/category_item_builder.dart';
import 'package:ecommersapp/widgets/simmer_grid.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

class Categories extends StatelessWidget {
  Categories({Key? key});

  AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final homePro=Provider.of<HomeProvider>(context);
    return StreamBuilder<List<CategoryModel>>(
      stream: homePro.getCategory(),
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SliverFillRemaining(
            child: ShimmerLoader(),
          );
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return SliverFillRemaining(
            child: Text(
              snapshot.error.toString(),
              style: TextStyle(color: Colors.white),
            ),
          );
        } else {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: 120, 
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  CategoryModel category = data[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: Column(
                        children: [
                          GestureDetector(
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor: Color.fromARGB(255, 29, 35, 46),
                              backgroundImage: NetworkImage(category.image!,scale: 15),
                            ),
                          ),
                          Text(category.category!,style: GoogleFonts.montserrat(color: Colors.white,fontSize: 10),)
                        ],
                      ),
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryItems(category: category,)));
                      },
                    ),
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}