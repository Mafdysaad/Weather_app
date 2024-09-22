import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherNamestate;
  //normal constructor
  WeatherModel(
      {required this.weatherNamestate,
      required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp});
  //named constructor
  // the factroy key word solve the nalable varible becouse return objec from the class without assumaint operation
  factory WeatherModel.fromJeson(dynamic Data) {
    Map weathertemp = Data["forecast"]["forecastday"][0]["day"];
    return WeatherModel(
        weatherNamestate: weathertemp["condition"]["text"],
        date: DateTime.parse(Data["location"]['localtime']),
        temp: Data["current"]["temp_c"],
        maxTemp: weathertemp["maxtemp_c"],
        minTemp: weathertemp["mintemp_c"]);
  }
  String getimage() {
    return weatherNamestate == 'Clear'
        ? 'assets/images/clear.png'
        : weatherNamestate == 'Partly Cloudy' ||
                weatherNamestate == 'Patchy sleet nearby' ||
                weatherNamestate == 'Cloudy'
            ? 'assets/images/cloudy.png'
            : weatherNamestate == 'Overcast'
                ? 'assets/images/Overcast'
                : weatherNamestate == 'Patchy rain nearby'
                    ? 'assets/images/rainy.png'
                    : weatherNamestate == "Patchy snow nearby" ||
                            weatherNamestate == 'Blowing snow'
                        ? 'assets/images/snow.png'
                        : weatherNamestate == 'Thundery outbreaks in nearby'
                            ? 'assets/images/thunderstorm.png'
                            : 'assets/images/clear.png';
  }

  MaterialColor getcolor() {
    if (weatherNamestate == 'Clear' || weatherNamestate == 'Sunny') {
      return Colors.amber;
    } else if (weatherNamestate == 'Partly Cloudy' ||
        weatherNamestate == 'Patchy sleet nearby' ||
        weatherNamestate == 'Cloudy' ||
        weatherNamestate == 'Overcast') {
      return Colors.grey;
    } else if (weatherNamestate == 'Patchy rain nearby' ||
        weatherNamestate == "Patchy snow nearby" ||
        weatherNamestate == 'Blowing snow') {
      return Colors.blue;
    } else if (weatherNamestate == 'Thundery outbreaks in nearby') {
      const Color.fromARGB(255, 126, 90, 219);
    }
    return Colors.yellow;
  }
}
