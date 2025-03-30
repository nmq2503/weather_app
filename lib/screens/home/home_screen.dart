import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/screens/home/widgets/home_detail_weather.dart';
import 'package:weather_app/screens/home/widgets/home_location.dart';
import 'package:weather_app/screens/home/widgets/home_temperature.dart';
import 'package:weather_app/screens/home/widgets/home_weather_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherProvider>().getWeatherCurrent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff1D6CF3),
              Color(0xff19D2FE),
            ],
          ),
        ),
        child: FutureBuilder(
          future: context.read<WeatherProvider>().getWeatherCurrent(),
          initialData: null,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (!snapshot.hasData) {
              return const Center(
                child: Text('No data!'),
              );
            }

            if (snapshot.hasError) {
              return const Center(
                child: Text('Error!'),
              );
            }

            WeatherData weatherData = snapshot.data;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HomeWeatherIcon(nameIcon: weatherData.weather[0].main),
                HomeTemperature(temp: weatherData.main.temp),
                HomeLocation(nameLocation: weatherData.name),
                SizedBox(
                  height: 20,
                ),
                HomeDetailWeather(
                  wind: weatherData.wind.speed,
                  humidity: weatherData.main.humidity,
                ),
                SizedBox(
                  height: 60,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
