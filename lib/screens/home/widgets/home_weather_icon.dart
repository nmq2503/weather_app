import 'package:flutter/material.dart';
import 'package:weather_app/apps/utils/const.dart';

class HomeWeatherIcon extends StatelessWidget {
  const HomeWeatherIcon({super.key, required this.nameIcon});

  final String nameIcon;

  @override
  Widget build(BuildContext context) {
    // Lấy kích cỡ của màn hình
    Size size = MediaQuery.sizeOf(context);

    return Container(
        // Chiều rộng Icon bằng 2/3 chiều rộng màn hình
        width: size.width / 1.5,
        padding: EdgeInsets.all(12),
        child: Image.asset(
          AssetCustom.getLinkImg(nameIcon),
          fit: BoxFit.cover,
        ));
  }
}
