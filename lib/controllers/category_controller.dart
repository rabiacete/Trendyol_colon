import 'package:get/get.dart';
import '../consts/lists.dart';

class CategoryController extends GetxController {
  List<Map<String, dynamic>> getCategoryProducts(String category) {
    return products.where((product) => product["category"] == category).toList();
  }
}
