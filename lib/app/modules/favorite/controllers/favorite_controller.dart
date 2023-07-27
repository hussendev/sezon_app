import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sezon_app/models/product.dart';

class FavoriteGetXController extends GetxController {
  //TODO: Implement FavoriteController

  RxBool loading = false.obs;
  // Map<String, dynamic> favoriteProductsMap = {};
  RxMap<String, Map<String, Product>> favoriteProductsMap = RxMap<String, Map<String, Product>>();

  @override
  void onInit() async {
    // print();
    getProductsFavorite(FirebaseAuth.instance.currentUser!.uid);
    super.onInit();
  }

  static FavoriteGetXController get to => FavoriteGetXController();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  List<Product> getProductsFavorite(String userId) {
    loading.value = true;
    List<Product> userFavoriteProducts = [];
    favoriteProductsMap.value[userId.toString()]?.forEach((key, value) {
      userFavoriteProducts.add(value);
    });
    if (userFavoriteProducts.isNotEmpty) {
      loading.value = false;
      return userFavoriteProducts;
    } else {
      loading.value = false;
      return [];
    }
  }

  // void changeFavorite(Product product,String userId) {
  //   bool isFavorite = !isProductFavorite(product,userId);
  //   update();
  // }

  void addProductToFavorites(Product product, String userId) {
    loading.value = true;
    if (isProductFavorite(product, userId)) {
      favoriteProductsMap.value[userId]?.remove(product.id.toString());
      // changeFavorite(product,userId);
    } else {
      favoriteProductsMap.value[userId] ??= {};
      favoriteProductsMap.value[userId]![product.id.toString()] = product;
      // changeFavorite(product, userId);
    }
    loading.value = false;
    getProductsFavorite(userId);
  }

  Future<void> unFavoriteProduct(Product product, String userId) async {
    loading.value = true;
    favoriteProductsMap.value[userId]?.remove(product.id.toString());
    getProductsFavorite(userId);
    loading.value = false;
  }

  bool isProductFavorite(Product product, String userId) {
    return favoriteProductsMap.containsKey(userId) && favoriteProductsMap[userId]!.containsKey(product.id.toString());
  }
  //

//   void addProductToFavorites(Product product, String userId) {
//     // Check if the user already has favorite products
//     List<Product>? userFavoriteProducts = favoriteProductsMap[userId];
//
//     if (userFavoriteProducts != null) {
//       // If the user has favorites, check if the product is already in the list
//       print(userFavoriteProducts.contains(product));
//       if (isProductFavorite(product, userId)) {
//         userFavoriteProducts.remove(product);
//       }else{
//         userFavoriteProducts.add(product);
//       }
//     } else {
//       // If the user has no favorites, create a new list and add the product
//       userFavoriteProducts = [product];
//       favoriteProductsMap[userId]![product.id] = userFavoriteProducts as Product;
//     }
//   }
//
// // Function to check if a product is already a favorite for a user
//   bool isProductFavorite(Product product, String userId) {
//     List<Product>? userFavoriteProducts = favoriteProductsMap[userId];
//     return userFavoriteProducts != null && userFavoriteProducts.contains(product);
//   }
}
