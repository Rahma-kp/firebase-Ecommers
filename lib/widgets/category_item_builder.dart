
import 'package:ecommersapp/controller/category_provider.dart';
import 'package:ecommersapp/model/category_model.dart';
import 'package:ecommersapp/model/product_model.dart';
import 'package:ecommersapp/views/category_listbuilder.dart';
import 'package:ecommersapp/widgets/simmer_grid.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class CategoryItems extends StatelessWidget {
  CategoryModel category;

  CategoryItems({Key? key, required this.category});

  @override
  Widget build(BuildContext context) {
    final catPro = Provider.of<CategoryProvider>(context);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 194, 195, 196),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor:Color.fromARGB(182, 217, 101, 81),
      ),
      body: buildCategoryWidget(catPro),
    );
  }

  Widget buildCategoryWidget(CategoryProvider catPro) {
    switch (category.id) {
      case "1":
        return FutureBuilder<List<ProductModel>>(
          future: catPro.getCategoryItems(type: 'heels', typeofcategory: 'heelscategory'),
          builder: (context, snapshot) {
            return buildContent(snapshot, catPro);
          },
        );
      case "2":
        return FutureBuilder<List<ProductModel>>(
          future: catPro.getCategoryItems(type: 'chappal', typeofcategory: 'chappalcategory'),
          builder: (context, snapshot) {
            return buildContent(snapshot, catPro);
          },
        );
      case "3":
        return FutureBuilder<List<ProductModel>>(
          future: catPro.getCategoryItems(type: 'kids', typeofcategory: 'kidscategory'),
          builder: (context, snapshot) {
            return buildContent(snapshot, catPro);
          },
        );
      case "4":
        return FutureBuilder<List<ProductModel>>(
          future: catPro.getCategoryItems(type: 'formal', typeofcategory: 'formlcategory'),
          builder: (context, snapshot) {
            return buildContent(snapshot, catPro);
          },
        );
      case "5":
        return FutureBuilder<List<ProductModel>>(
          future: catPro.getCategoryItems(type: 'slipper', typeofcategory: 'slippercategory'),
          builder: (context, snapshot) {
            return buildContent(snapshot, catPro);
          },
        );
      case "6":
        return FutureBuilder<List<ProductModel>>(
          future: catPro.getCategoryItems(type: 'sports', typeofcategory: 'sportsCategory'),
          builder: (context, snapshot) {
            return buildContent(snapshot, catPro);
          },
        );
      case "7":
        return FutureBuilder<List<ProductModel>>(
          future: catPro.getCategoryItems(type: 'boots', typeofcategory: 'shoecategory'),
          builder: (context, snapshot) {
            return buildContent(snapshot, catPro);
          },
        );
      case "8":
        return FutureBuilder<List<ProductModel>>(
          future: catPro.getCategoryItems(type: 'sandels', typeofcategory: 'sandelscategory'),
          builder: (context, snapshot) {
            return buildContent(snapshot, catPro);
          },
        );
      case "9":
        return FutureBuilder<List<ProductModel>>(
          future: catPro.getCategoryItems(type: 'sneakers', typeofcategory: 'sneakerscategory'),
          builder: (context, snapshot) {
            return buildContent(snapshot, catPro);
          },
        );
      default:
        return Container();
    }
  }

  Widget buildContent(AsyncSnapshot<List<ProductModel>> snapshot, CategoryProvider catPro) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return ShimmerLoader();
    } else if (snapshot.hasError) {
      print(snapshot.error);
      return Text(
        snapshot.error.toString(),
        style: TextStyle(color: Colors.white),
      );
    } else if (snapshot.data == null) {
      return CircularProgressIndicator();
    } else {
      return CategoryListBuilder(catPro: catPro);
    }
  }
}