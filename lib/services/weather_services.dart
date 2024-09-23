import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather/models/weather_model.dart';

class WeatherServices {
  Future<WeatherModel?> getweather({required String CityName}) async {
    WeatherModel? weather;
    try {
      String BasUrl = 'https://api.weatherapi.com/v1';
      String APIKey = 'f9e5a02684e340e5903194025241109';
      http.Response response = await http.get(
          Uri.parse('$BasUrl/forecast.json?key=$APIKey&q=$CityName&days=7'));
      Map<String, dynamic> Data = jsonDecode(response.body);

      weather = WeatherModel.fromJeson(Data);
    } catch (e) {
      print('=====> $e');
    }

    return weather;
  }
}
