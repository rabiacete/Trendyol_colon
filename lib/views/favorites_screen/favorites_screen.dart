import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/favorites_controller.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoritesController = Get.find<FavoritesController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorilerim"),
      ),
      body: Obx(() {
        if (favoritesController.favoriteProducts.isEmpty) {
          return const Center(
            child: Text(
              "Favorilerde ürün bulunamadı",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          );
        }
        return ListView.builder(
          itemCount: favoritesController.favoriteProducts.length,
          itemBuilder: (context, index) {
            final product = favoritesController.favoriteProducts[index];
            return ListTile(
              leading: Image.asset(
                product["imagePath"],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(product["title"]),
              subtitle: Text("${product["price"]} TL"),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  favoritesController.toggleFavorite(product);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
