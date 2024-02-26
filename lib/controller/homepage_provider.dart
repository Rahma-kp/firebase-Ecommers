import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/model/category_model.dart';
import 'package:firebase_login/model/product_model.dart';
import 'package:firebase_login/services/firebase_service.dart';
import 'package:flutter/foundation.dart';



class HomeProvider extends ChangeNotifier{
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  late final CollectionReference<CategoryModel> productsRef;
  String currentusername='';
  DatabaseService service =DatabaseService();
  DatabaseService1 service1 =DatabaseService1();
  DatabaseService2 service2 =DatabaseService2();

    Stream<List<ProductModel>> getProducts() {
    return service.productsRef.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => doc.data()).toList());
  }
    Stream<List<ProductModel>> getFurniture() {
    return service1.furniteref.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => doc.data()).toList());
  }
    Stream<List<CategoryModel>> getCategory() {
    return service2.catref.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => doc.data()).toList());
  }

  getCurrentUser()async{
    final currentuser = FirebaseAuth.instance.currentUser;
    if (currentuser!=null) {
    try {
      var user = await firestore.collection("users").doc(currentuser.uid).get();
      if (user.data()?['name']!=null) {
        currentusername=user.data()!['name'];
        notifyListeners();
      }else{
        currentusername='';
        notifyListeners();
      }
     
      
    } catch (e) {
      throw Exception(e);
    }
    }
  }
}