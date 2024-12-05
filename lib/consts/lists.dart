import 'dart:ffi';

import 'package:trendyol_colon/consts/consts.dart';

const sliderList = [imgSlider1, imgSlider2, imgSlider3, imgSlider4];

final List<String> categoriesList = [
  "Kategoriler",
  "Kadın",
  "Erkek",
  "Moda",
  "Elektronik",
  "Ev & Yaşam",
  "Spor",
  "Kitap",
];
const servicesList = [
imgYemek, imgDolap, imgMarket, imgKupon
];

const List<Map<String, dynamic>> specialProductsList = [
  {"imagePath": imgDolap, "title": "Flash Ürün 1", "price": 49.99},
  {"imagePath": imgKupon, "title": "Flash Ürün 2", "price": 79.99},
  {"imagePath": imgMarket, "title": "Flash Ürün 3", "price": 99.99},
  {"imagePath": imgYemek, "title": "Flash Ürün 4", "price": 59.99},
  {"imagePath": imgDolap, "title": "Flash Ürün 5", "price": 89.99},
];

const List<Map<String, dynamic>> flashProductsList = [
  {"imagePath": imgDolap, "title": "Flash Ürün 1", "price": 29.99},
  {"imagePath": imgKupon, "title": "Flash Ürün 2", "price": 39.99},
  {"imagePath": imgMarket, "title": "Flash Ürün 3", "price": 59.99},
  {"imagePath": imgYemek, "title": "Flash Ürün 4", "price": 19.99},
  {"imagePath": imgDolap, "title": "Flash Ürün 5", "price": 49.99},
];

const List<Map<String, dynamic>> products = [
  {
    "imagePath": "assets/images/product1.png",
    "title": "Ürün 1",
    "price": 99.99,
  },
  {
    "imagePath": "assets/images/product2.png",
    "title": "Ürün 2",
    "price": 149.49,
  },
  {
    "imagePath": "assets/images/product3.png",
    "title": "Ürün 3",
    "price": 199.99,
  },
];
List<Map<String, dynamic>> cartItems = [];