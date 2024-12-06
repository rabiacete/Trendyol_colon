import 'package:get/get.dart';

class FavoritesController extends GetxController {
  var favoriteProducts = <Map<String, dynamic>>[].obs;

  void toggleFavorite(Map<String, dynamic> product) {
    if (favoriteProducts.contains(product)) {
      favoriteProducts.remove(product);
    } else {
      favoriteProducts.add(product);
    }
  }

  bool isFavorite(Map<String, dynamic> product) {
    return favoriteProducts.contains(product);
  }
}
