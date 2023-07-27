import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/category.dart';
import '../../models/product.dart';

class FBHomeController{
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  static FBHomeController instance = FBHomeController._();
  FBHomeController._();
  factory FBHomeController() {
    return instance;
  }

  Future<QuerySnapshot<Product>> getProducts() async {
    return await _firebaseFirestore.collection(
        'products').withConverter<Product>(
      fromFirestore: (snapshot, _) => Product.fromJson(snapshot.data()!),
      toFirestore: (product, _) => product.toJson(),
    ).get();
  }

  Future<QuerySnapshot<Product>> getProductsByCategory({required int categoryId,int productId=0}) async {

    if(productId==0){
      return await _firebaseFirestore.collection(
          'products').where('category_id',isEqualTo: categoryId,).withConverter<Product>(
        fromFirestore: (snapshot, _) => Product.fromJson(snapshot.data()!),
        toFirestore: (product, _) => product.toJson(),
      ).get();
    }else{
      return await _firebaseFirestore.collection(
          'products').where('category_id',isEqualTo: categoryId,).where(
        'id',isNotEqualTo: productId,
      ).withConverter<Product>(
        fromFirestore: (snapshot, _) => Product.fromJson(snapshot.data()!),
        toFirestore: (product, _) => product.toJson(),
      ).get();
    }

  }


  Future<QuerySnapshot<Category>> getCategories() async {
    return await _firebaseFirestore.collection(
        'categories').withConverter<Category>(
      fromFirestore: (snapshot, _) => Category.fromJson(snapshot.data()!),
      toFirestore: (category, _) => category.toJson(),
    ).get();
  }


  Stream<QuerySnapshot> getOrders() async* {
    yield*  _firebaseFirestore.collection('orders').snapshots();
  }

  Stream<QuerySnapshot> getNotifications() async* {
    yield*  _firebaseFirestore.collection('notifications').snapshots();
  }

  Stream<QuerySnapshot> getFavorites() async* {
    yield*  _firebaseFirestore.collection('favorites').snapshots();
  }

  Stream<QuerySnapshot> getCart() async* {
    yield*  _firebaseFirestore.collection('cart').snapshots();
  }

  Stream<QuerySnapshot> getAddresses() async* {
    yield*  _firebaseFirestore.collection('addresses').snapshots();
  }



}