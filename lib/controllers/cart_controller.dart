import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <Map<String, dynamic>>[].obs;

  // Ürün ekleme
  void addToCart(Map<String, dynamic> product) {
    int index = cartItems.indexWhere((item) => item['title'] == product['title']);
    if (index != -1) {
      cartItems[index]['quantity'] += product['quantity'];
    } else {
      cartItems.add(product);
    }
    cartItems.refresh(); // Değişiklik sonrası listeyi yenile
  }

  // Miktarı artırma
  void increaseQuantity(int index) {
    cartItems[index]['quantity']++;
    cartItems.refresh(); // Değişiklik sonrası listeyi yenile
  }

  // Miktarı azaltma
  void decreaseQuantity(int index) {
    if (cartItems[index]['quantity'] > 1) {
      cartItems[index]['quantity']--;
    } else {
      cartItems.removeAt(index);
    }
    cartItems.refresh(); // Değişiklik sonrası listeyi yenile
  }

  // Sepeti temizleme
  void clearCart() {
    cartItems.clear();
  }

  // Toplam fiyat hesaplama
  double calculateTotalPrice() {
    return cartItems.fold(0, (sum, item) => sum + item['price'] * item['quantity']);
  }
}