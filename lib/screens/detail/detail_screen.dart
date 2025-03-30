import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/screens/detail/widgets/detail_body.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          future: context.read<WeatherProvider>().getWeatherDetail(),
          builder: (context, snapshot) {
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
              return const Center(child: Text('Error'));
            }

            List<WeatherDetail> listWeatherDetail = snapshot.data!;

            return Scaffold(
              appBar: AppBar(
                centerTitle: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Row(
                  children: [
                    Icon(CupertinoIcons.location),
                    SizedBox(width: 15),
                    AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          '${context.read<WeatherProvider>().nameCity} City',
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          speed: const Duration(milliseconds: 120),
                        ),
                      ],
                      repeatForever: true,
                    ),
                  ],
                ),
                actions: [
                  Icon(CupertinoIcons.search),
                  SizedBox(
                    width: 15,
                  )
                ],
              ),
              body: DetailBody(
                listWeatherDetail: listWeatherDetail,
              ),
            );
          }),
    );
  }
}
