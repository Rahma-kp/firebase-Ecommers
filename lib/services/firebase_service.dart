import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_login/model/category_model.dart';
import 'package:firebase_login/model/product_model.dart';


class DatabaseService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  late final CollectionReference<ProductModel> productsRef;
  DatabaseService() {
    productsRef = firestore.collection("products").withConverter<ProductModel>(
          fromFirestore: (snapshot, snapshotOptions) =>
              ProductModel.fromJson(snapshot.data()!),
          toFirestore: (data, setOptions) => data.toJson(),
        );
  }
}

class DatabaseService1 {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  late final CollectionReference<ProductModel> furniteref;
  DatabaseService1() {
    furniteref = firestore.collection("furniture").withConverter<ProductModel>(
          fromFirestore: (snapshot, snapshotOptions) =>
              ProductModel.fromJson(snapshot.data()!),
          toFirestore: (data, setOptions) => data.toJson(),
        );
  }
}

class DatabaseService2 {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  late final CollectionReference<CategoryModel> catref;

  DatabaseService2() {
    catref = firestore.collection("category").withConverter<CategoryModel>(
          fromFirestore: (snapshot, snapshotOptions) =>
              CategoryModel.fromJson(snapshot.data()!),
          toFirestore: (data, setOptions) => data.toJson(),
        );
  }
}
