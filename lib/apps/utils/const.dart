import 'package:flutter/material.dart';

const String linkAsset = 'assets/imgs/';

class AssetCustom {
  static getLinkImg(String name) =>
      '$linkAsset${name.replaceAll(' ', '').toLowerCase()}.png';
}

class MyKey {
  static const String apiToken = 'bc876dfe7c63e5d7ca9c2ac7dee9daab';
}

Widget createTemp(num temp, {double size = 100}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        temp.round().toString(),
        style: TextStyle(
            fontSize: size, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      Text(
        '0',
        style: TextStyle(
            fontSize: size / 3, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ],
  );
}
