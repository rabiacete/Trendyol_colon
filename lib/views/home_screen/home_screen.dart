import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../consts/lists.dart';
import 'package:trendyol_colon/consts/consts.dart';

import '../ProductDetailScreen/product_detail.dart';
import '../cart_screen/cart_screen.dart';
import '../../controllers/home_controller.dart'; // HomeController importunu ekledik


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var controller = Get.find<HomeController>(); // HomeController'ı buluyoruz
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12),
          color: Colors.grey[200],
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Üst arama çubuğu ve ikonlar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.search, color: Colors.orange),
                            10.widthBox,
                            const Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Ürün Arayın...",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    10.widthBox,
                    const Icon(Icons.email, color: Colors.orange, size: 30),
                    15.widthBox,
                    const Icon(Icons.notifications, color: Colors.orange, size: 30),
                  ],
                ),
                15.heightBox,

                // Kategoriler
                SizedBox(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: categoriesList
                        .map((category) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Chip(
                        backgroundColor: Colors.white,
                        label: Text(
                          category,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ))
                        .toList(),
                  ),
                ),
                15.heightBox,

                // Slider
                VxSwiper.builder(
                  aspectRatio: 16 / 9,
                  autoPlay: true,
                  height: 150,
                  enlargeCenterPage: true,
                  itemCount: sliderList.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      sliderList[index],
                      fit: BoxFit.fill,
                    ).box.rounded.clip(Clip.antiAlias).margin(const EdgeInsets.symmetric(horizontal: 8)).make();
                  },
                ),
                15.heightBox,

                // Hizmetlerimizi Keşfet
                Align(
                  alignment: Alignment.centerLeft,
                  child: "Hizmetlerimizi Keşfet"
                      .text
                      .size(18)
                      .bold
                      .make()
                      .marginOnly(left: 8, bottom: 10),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                  itemCount: servicesList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(servicesList[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
                20.heightBox,

                // Sana Özel Ürünler
                Align(
                  alignment: Alignment.centerLeft,
                  child: "Sana Özel Ürünler"
                      .text
                      .size(18)
                      .bold
                      .make()
                      .marginOnly(left: 8, bottom: 10),
                ),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: specialProductsList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailScreen(
                                imagePath: specialProductsList[index]["imagePath"]!,
                                title: specialProductsList[index]["title"]!,
                                price: specialProductsList[index]["price"] as double,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: 120,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    image: AssetImage(specialProductsList[index]["imagePath"]!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              5.heightBox,
                              specialProductsList[index]["title"]!
                                  .toString()
                                  .text
                                  .size(14)
                                  .bold
                                  .make(),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                20.heightBox,

                // Flash Ürünler
                Align(
                  alignment: Alignment.centerLeft,
                  child: "Flash Ürünler"
                      .text
                      .size(18)
                      .bold
                      .make()
                      .marginOnly(left: 8, bottom: 10),
                ),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: flashProductsList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailScreen(
                                imagePath: flashProductsList[index]["imagePath"]!,
                                title: flashProductsList[index]["title"]!,
                                price: specialProductsList[index]["price"] as double,// Flash ürünlerde fiyat yoksa varsayılan bir değer kullanabilirsiniz.
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: 120,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    image: AssetImage(flashProductsList[index]["imagePath"]!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              5.heightBox,
                              flashProductsList[index]["title"]!
                                  .toString()
                                  .text
                                  .size(14)
                                  .bold
                                  .make(),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // Alt gezinme çubuğu
      // Alt gezinme çubuğu
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Anasayfa",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_shipping),
            label: "Trendyol Go",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorilerim",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Sepetim",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Hesabım",
          ),
        ],

        onTap: (index) {
          // Eğer Sepet ikonuna tıklanırsa CartScreen'e git
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartScreen()),
            );
          } else {
            controller.currentNavIndex.value = index;
          }
        },
      ),
    );
  }
}