import 'package:firebase_login/controller/category_provider.dart';
import 'package:firebase_login/model/category_model.dart';
import 'package:firebase_login/model/product_model.dart';
import 'package:firebase_login/views/category_listbuilder.dart';
import 'package:firebase_login/widgets/simmer_grid.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class CategoryItems extends StatelessWidget {
  CategoryModel category;

  CategoryItems({Key? key, required this.category});

  @override
  Widget build(BuildContext context) {
    final catPro = Provider.of<CategoryProvider>(context);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 24, 30, 41),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 24, 30, 41),
      ),
      body: buildCategoryWidget(catPro),
    );
  }

  Widget buildCategoryWidget(CategoryProvider catPro) {
    switch (category.id) {
      case "1":
        return FutureBuilder<List<ProductModel>>(
          future: catPro.getCategoryItems(type: 'creams', typeofcategory: 'creamcategory'),
          builder: (context, snapshot) {
            return buildContent(snapshot, catPro);
          },
        );
      case "2":
        return FutureBuilder<List<ProductModel>>(
          future: catPro.getCategoryItems(type: 'furniture', typeofcategory: 'funiturecategory'),
          builder: (context, snapshot) {
            return buildContent(snapshot, catPro);
          },
        );
      case "3":
        return FutureBuilder<List<ProductModel>>(
          future: catPro.getCategoryItems(type: 'gym', typeofcategory: 'gymcategory'),
          builder: (context, snapshot) {
            return buildContent(snapshot, catPro);
          },
        );
      case "4":
        return FutureBuilder<List<ProductModel>>(
          future: catPro.getCategoryItems(type: 'jzczwVUcDfm3TqqzeQpJ', typeofcategory: 'shirtcategory'),
          builder: (context, snapshot) {
            return buildContent(snapshot, catPro);
          },
        );
      case "5":
        return FutureBuilder<List<ProductModel>>(
          future: catPro.getCategoryItems(type: 'ladiesdress', typeofcategory: 'ladiesitem1'),
          builder: (context, snapshot) {
            return buildContent(snapshot, catPro);
          },
        );
      case "6":
        return FutureBuilder<List<ProductModel>>(
          future: catPro.getCategoryItems(type: 'laptops', typeofcategory: 'laptopCategory'),
          builder: (context, snapshot) {
            return buildContent(snapshot, catPro);
          },
        );
      case "7":
        return FutureBuilder<List<ProductModel>>(
          future: catPro.getCategoryItems(type: 'shoes', typeofcategory: 'shoecategory'),
          builder: (context, snapshot) {
            return buildContent(snapshot, catPro);
          },
        );
      case "8":
        return FutureBuilder<List<ProductModel>>(
          future: catPro.getCategoryItems(type: 'sports', typeofcategory: 'sportscategory'),
          builder: (context, snapshot) {
            return buildContent(snapshot, catPro);
          },
        );
      case "9":
        return FutureBuilder<List<ProductModel>>(
          future: catPro.getCategoryItems(type: 'tshirts', typeofcategory: 'tshirtscategory'),
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