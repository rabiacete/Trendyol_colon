import 'dart:ffi';

import 'package:trendyol_colon/consts/consts.dart';

const sliderList = [imgSlider1, imgSlider2, imgSlider3, imgSlider4];

final List<String> categoriesList = [
  "≡Kategoriler",
  "Kadın",
  "Erkek",
  "Ev & Yaşam",
  "Moda",
  "Elektronik",
  "Spor",
  "Kitap",
];
const servicesList = [
imgYemek, imgDolap, imgMarket, imgKupon
];

const List<Map<String, dynamic>> specialProductsList = [
  {"imagePath": urun6, "title": "STANLEY The Aerolight", "price": 49.99},
  {"imagePath": urun2, "title": "MAVİ Erkek Sweat", "price": 79.99},
  {"imagePath": urun3, "title": "STANLEY The Aerolight ", "price": 99.99},
  {"imagePath": urun4, "title": "MAVİ Kadın Sweat", "price": 59.99},
  {"imagePath": urun5, "title": "MAVİ Kadın Sweat", "price": 89.99},
];

const List<Map<String, dynamic>> flashProductsList = [
  {"imagePath": urun4, "title": "MAVİ Kadın Sweat", "price": 59.99},
  {"imagePath": urun5, "title": "MAVİ Kadın Sweat", "price": 89.99},
  {"imagePath": urun6, "title": "STANLEY The Aerolight", "price": 49.99},
  {"imagePath": urun2, "title": "MAVİ Erkek Sweat", "price": 79.99},
  {"imagePath": urun3, "title": "STANLEY The Aerolight ", "price": 99.99},
  {"imagePath": urun4, "title": "MAVİ Kadın Sweat", "price": 59.99},
  {"imagePath": urun5, "title": "MAVİ Kadın Sweat", "price": 89.99},
];

const brandsList = [
  imgYemek, imgDolap, imgMarket, imgKupon, imgYemek, imgDolap, imgMarket, imgKupon

];





const List<Map<String, dynamic>> products = [
  {
    "imagePath": urun5,
    "title": "Ürün 1",
    "price": 99.99,
    "category": "Kadın",
  },
  {
    "imagePath": urun4,
    "title": "Ürün 1",
    "price": 99.99,
    "category": "Kadın",
  },
  {
    "imagePath": urun5,
    "title": "Ürün 1",
    "price": 99.99,
    "category": "Kadın",
  },
  {
    "imagePath": urun5,
    "title": "Ürün 1",
    "price": 99.99,
    "category": "Kadın",
  },


  {
    "imagePath": urun2,
    "title": "Ürün 1",
    "price": 99.99,
    "category": "Erkek",
  },  {
    "imagePath": urun2,
    "title": "Ürün 1",
    "price": 99.99,
    "category": "Erkek",
  },


  {
    "imagePath": urun6,
    "title": "Ürün 1",
    "price": 99.99,
    "category": "Ev & Yaşam",
  },  {
    "imagePath": urun3,
    "title": "Ürün 1",
    "price": 99.99,
    "category": "Ev & Yaşam",
  },






];
List<Map<String, dynamic>> cartItems = [];