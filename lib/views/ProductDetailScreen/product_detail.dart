import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/cart_controller.dart';
import '../../controllers/favorites_controller.dart';
import '../cart_screen/cart_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  final String imagePath;
  final String title;
  final double price;

  const ProductDetailScreen({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();
    final FavoritesController favoritesController = Get.put(FavoritesController());

    Map<String, dynamic> product = {
      "imagePath": imagePath,
      "title": title,
      "price": price,
    };

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(title),
        actions: [
          // Favori İkonu
          Obx(() => IconButton(
            icon: Icon(
              favoritesController.isFavorite(product)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: favoritesController.isFavorite(product) ? Colors.red : Colors.white,
            ),
            onPressed: () {
              favoritesController.toggleFavorite(product);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    favoritesController.isFavorite(product)
                        ? "Ürün favorilere eklendi!"
                        : "Ürün favorilerden çıkarıldı!",
                  ),
                ),
              );
            },
          )),
          // Sepet İkonu
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Bu ürün hakkında detaylı bilgiler burada yer alır.",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "₺${price.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    cartController.addToCart({
                      "imagePath": imagePath,
                      "title": title,
                      "price": price,
                      "quantity": 1,
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Ürün sepete eklendi!")),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: const Text("Sepete Ekle"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

