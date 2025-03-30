import 'package:flutter/material.dart';

class HomeDetailWeather extends StatelessWidget {
  const HomeDetailWeather({
    super.key,
    required this.wind,
    required this.humidity,
  });

  final num wind;
  final num humidity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Image.asset("assets/icons/ic_wind.png"),
            Text(
              '${wind.round()}Km/h',
              style: TextStyle(fontSize: 21, color: Colors.white),
            )
          ],
        ),
        Column(
          children: [
            Image.asset("assets/icons/ic_humidity.png"),
            Text(
              '${humidity.round()}%',
              style: TextStyle(fontSize: 21, color: Colors.white),
            )
          ],
        ),
      ],
    );
  }
}
