import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trendyol_colon/consts/consts.dart';
import 'package:trendyol_colon/views/home_screen/home_screen.dart';

import 'controllers/cart_controller.dart';
import 'controllers/favorites_controller.dart';
import 'controllers/home_controller.dart';

void main() {
  // HomeController'ı GetX ile başlat
  Get.put(CartController());
  Get.put(HomeController());
  Get.put(FavoritesController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CartController());


    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

