import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommersapp/model/product_model.dart';
import 'package:ecommersapp/services/firebase_service.dart';

import 'package:flutter/foundation.dart';


class Wishlist extends ChangeNotifier {
  List<ProductModel> wishlistItems = [];
  DatabaseService service = DatabaseService();
  

  Future<List<ProductModel>> getWishlistItems(String uid) async {
    try {
      var wishlistSnapshot = await service.firestore
          .collection("users")
          .doc(uid)
          .collection("wishlist")
          .get();
      wishlistItems = wishlistSnapshot.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList();
      return wishlistItems;
    } catch (e) {
      print('Error fetching wishlist items: $e');
      throw e;
    }
  }

  Future<void> addProductToWishlist(ProductModel data, String uid) async {
    try {
      if (!wishlistItems.contains(data)) {
        await service.firestore
            .collection("users")
            .doc(uid)
            .collection("wishlist")
            .add(data.toJson());
        wishlistItems.add(data);
        notifyListeners();
      }
    } catch (error) {
      print("Error adding product to wishlist: $error");
    }
  }

  Future<void> removeProductFromWishlist(
      ProductModel product, String uid, id) async {
    try {
      wishlistItems.remove(product);
      notifyListeners();
      var snapshots = await service.firestore
          .collection("users")
          .doc(uid)
          .collection("wishlist")
          .get();
      var documents = snapshots.docs;
      for (DocumentSnapshot doc in documents) {
        if (product.id == id) {
          await doc.reference.delete();
          break;
        }
        break;
      }
      notifyListeners();
    } catch (error) {
      print("Error removing product from wishlist: $error");
      wishlistItems.add(product);
      notifyListeners();
    }
  }

  bool isWishlistItem(ProductModel product) {
    return wishlistItems.contains(product);
  }
}