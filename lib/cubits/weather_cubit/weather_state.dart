import 'package:weather/models/weather_model.dart';

abstract class Weatherstate {}

class Loading extends Weatherstate {}

class Defauilt extends Weatherstate {}

class Success extends Weatherstate {
  WeatherModel? weather;
  Success({required this.weather});
}

class failure extends Weatherstate {}
