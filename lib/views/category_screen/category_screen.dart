import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ProductDetailScreen/product_detail.dart';

class CategoryScreen extends StatelessWidget {
  final String categoryName;
  final List<Map<String, dynamic>> products;

  const CategoryScreen({
    Key? key,
    required this.categoryName,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: products.isNotEmpty
          ? Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Bir satırda 2 ürün
            mainAxisSpacing: 10, // Dikey boşluk
            crossAxisSpacing: 10, // Yatay boşluk
            childAspectRatio: 0.75, // Genişlik/yükseklik oranı
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Ürün detayına yönlendirme
                final product = products[index];
                Get.to(() => ProductDetailScreen(
                  imagePath: product["imagePath"],
                  title: product["title"],
                  price: product["price"],
                ));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                        child: Image.asset(
                          products[index]["imagePath"],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        products[index]["title"],
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "\$${products[index]["price"]}",
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      )
          : const Center(
        child: Text("Bu kategoride ürün bulunmamaktadır."),
      ),
    );
  }
}
