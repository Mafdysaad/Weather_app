import 'package:flutter/material.dart';
import 'package:weather/models/weather_model.dart';

class weatherProvider extends ChangeNotifier {
  WeatherModel? _weathermodel;
  String? cityname;
  set weathermodel(weather) {
    _weathermodel = weather;
    notifyListeners();
  }

  WeatherModel? get getweather => _weathermodel;
}
