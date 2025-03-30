import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/apps/utils/const.dart';
import 'package:weather_app/models/weather.dart';

class ApiRepository {
  final dio = Dio();

  Future<WeatherData?> callApiGetWeather(Position? positionCurrent) async {
    try {
      final response = await dio.get(
          'https://api.openweathermap.org/data/2.5/weather?lat=${positionCurrent?.latitude}&lon=${positionCurrent?.longitude}&units=metric&appid=${MyKey.apiToken}');
      final data = response.data;
      WeatherData weatherData = WeatherData.fromMap(data);
      return weatherData;
    } catch (e) {
      print('Error in callApiGetWeather(): $e');
      return null;
    }
  }

  Future<List<WeatherDetail>?> callApiGetWeatherDetail(Position? positionCurrent) async {
    try {
      final response = await dio.get(
          'https://api.openweathermap.org/data/2.5/forecast?lat=${positionCurrent?.latitude}&lon=${positionCurrent?.longitude}&units=metric&appid=${MyKey.apiToken}');
      List data = response.data['list'];
      // List<WeatherDetail> listWeatherDetail = data.map((e) => WeatherDetail.fromMap(e)).toList();
      List<WeatherDetail> listWeatherDetail = List.from(data.map((e) {
        return WeatherDetail.fromMap(e);
      }).toList());
      return listWeatherDetail;
    } catch (e) {
      print('Error in callApiGetWeatherDetail(): $e');
      return null;
    }
  }
}
