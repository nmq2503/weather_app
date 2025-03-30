import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/repositories/api_repository.dart';

class WeatherProvider extends ChangeNotifier {
  Position? positionCurrent;
  String nameCity = 'Hanoi';

  updatePosition(Position positionCurrent) {
    this.positionCurrent = positionCurrent;
    notifyListeners();
  }

  Future<WeatherData?> getWeatherCurrent() async {
    final weatherData = await ApiRepository().callApiGetWeather(positionCurrent);
    nameCity = weatherData?.name ?? 'Hanoi';
    notifyListeners();
    return weatherData;
  }

  Future<List<WeatherDetail>?> getWeatherDetail() async {
    List<WeatherDetail>? listWeatherDetail = await ApiRepository().callApiGetWeatherDetail(positionCurrent);
    return listWeatherDetail;
  }
}
