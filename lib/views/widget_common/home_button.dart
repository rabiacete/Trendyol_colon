import 'package:flutter/cupertino.dart';
import 'package:trendyol_colon/consts/consts.dart';


Widget homeButtons({width, height, icon, title, onPress}){
  return Column(
    //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imgYemek, width: 70,height: 70),
          5.heightBox,
          yemek.text.fontFamily(semibold).color(darkFontGrey).make()

        ],



      ).box.rounded.white.size(width, height).make();


}