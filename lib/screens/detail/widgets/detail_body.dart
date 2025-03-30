import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/apps/utils/const.dart';
import 'package:weather_app/models/weather.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({super.key, required this.listWeatherDetail});

  final List<WeatherDetail> listWeatherDetail;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemBuilder: (context, index) {
        DateTime dateTime = DateTime.parse(listWeatherDetail[index].dtTxt);
        String formattedDate = DateFormat('EEEE').format(dateTime);
        String formattedTime = DateFormat('HH:mm').format(dateTime);

        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white30,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        createTemp(
                          listWeatherDetail[index].main.temp,
                          size: 25,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          listWeatherDetail[index].weather.main,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      formattedDate,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      formattedTime,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )
                    ),
                  ],
                ),
              ),
              Image.asset(
                AssetCustom.getLinkImg(listWeatherDetail[index].weather.main),
                fit: BoxFit.cover,
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, _) {
        return SizedBox(
          height: 15,
        );
      },
      itemCount: 20,
    );
  }
}
