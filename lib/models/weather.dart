// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Weather {
  int id;
  String main;
  String description;

  Weather({
    required this.id,
    required this.main,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'main': main,
      'description': description,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      id: map['id'] as int,
      main: map['main'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) =>
      Weather.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Main {
  num temp;
  num feelsLike;
  num tempMin;
  num tempMax;
  num pressure;
  num humidity;
  num seaLevel;
  num grndLevel;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temp': temp,
      'feels_like': feelsLike,
      'temp_min': tempMin,
      'temp_max': tempMax,
      'pressure': pressure,
      'humidity': humidity,
      'sea_level': seaLevel,
      'grnd_level': grndLevel,
    };
  }

  factory Main.fromMap(Map<String, dynamic> map) {
    return Main(
      temp: map['temp'] as num,
      feelsLike: map['feels_like'] as num,
      tempMin: map['temp_min'] as num,
      tempMax: map['temp_max'] as num,
      pressure: map['pressure'] as num,
      humidity: map['humidity'] as num,
      seaLevel: map['sea_level'] as num,
      grndLevel: map['grnd_level'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory Main.fromJson(String source) =>
      Main.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Wind {
  num speed;
  num deg;

  Wind({
    required this.speed,
    required this.deg,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'speed': speed,
      'deg': deg,
    };
  }

  factory Wind.fromMap(Map<String, dynamic> map) {
    return Wind(
      speed: map['speed'] as num,
      deg: map['deg'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory Wind.fromJson(String source) =>
      Wind.fromMap(json.decode(source) as Map<String, dynamic>);
}

class WeatherData {
  int id;
  List<Weather> weather;
  String base;
  Main main;
  int visibility;
  Wind wind;
  String name;
  int cod;

  WeatherData({
    required this.id,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.name,
    required this.cod,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'weather': weather.map((x) => x.toMap()).toList(),
      'base': base,
      'main': main.toMap(),
      'visibility': visibility,
      'wind': wind.toMap(),
      'name': name,
      'cod': cod,
    };
  }

  factory WeatherData.fromMap(Map<String, dynamic> map) {
    return WeatherData(
      id: map['id'] as int,
      weather: List<Weather>.from(
        (map['weather'] as List).map<Weather>(
          (x) => Weather.fromMap(x as Map<String, dynamic>),
        ),
      ),
      base: map['base'] as String,
      main: Main.fromMap(map['main'] as Map<String, dynamic>),
      visibility: map['visibility'] as int,
      wind: Wind.fromMap(map['wind'] as Map<String, dynamic>),
      name: map['name'] as String,
      cod: map['cod'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherData.fromJson(String source) =>
      WeatherData.fromMap(json.decode(source) as Map<String, dynamic>);
}

class WeatherDetail {
  Main main;
  Weather weather;
  String dtTxt;

  WeatherDetail({
    required this.main,
    required this.weather,
    required this.dtTxt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'main': main.toMap(),
      'weather': weather.toMap(),
      'dtTxt': dtTxt,
    };
  }

  factory WeatherDetail.fromMap(Map<String, dynamic> map) {
    return WeatherDetail(
      main: Main.fromMap(map['main'] as Map<String, dynamic>),
      weather: Weather.fromMap(map['weather'][0] as Map<String, dynamic>),
      dtTxt: map['dt_txt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherDetail.fromJson(String source) =>
      WeatherDetail.fromMap(json.decode(source) as Map<String, dynamic>);
}

// {
//   "coord": {
//     "lon": 105.8342,
//     "lat": 21.0278
//   },
//   "weather": [
//     {
//       "id": 804,
//       "main": "Clouds",
//       "description": "overcast clouds",
//       "icon": "04d"
//     }
//   ],
//   "base": "stations",
//   "main": {
//     "temp": 15.99,
//     "feels_like": 15.34,
//     "temp_min": 15.99,
//     "temp_max": 15.99,
//     "pressure": 1023,
//     "humidity": 65,
//     "sea_level": 1023,
//     "grnd_level": 1022
//   },
//   "visibility": 10000,
//   "wind": {
//     "speed": 4.75,
//     "deg": 23,
//     "gust": 5.85
//   },
//   "clouds": {
//     "all": 100
//   },
//   "dt": 1743307960,
//   "sys": {
//     "type": 1,
//     "id": 9308,
//     "country": "VN",
//     "sunrise": 1743288705,
//     "sunset": 1743333021
//   },
//   "timezone": 25200,
//   "id": 1581130,
//   "name": "Hanoi",
//   "cod": 200
// }