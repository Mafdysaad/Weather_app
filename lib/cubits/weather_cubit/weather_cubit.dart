import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/weather_cubit/weather_state.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_services.dart';

class WeatherCubit extends Cubit<Weatherstate> {
  WeatherServices weather;
  String? cityname;
  WeatherModel? weatherModel;
  // super(Defauilt()) => inatila state
  WeatherCubit({required this.weather}) : super(Defauilt());

  getweather(String cityname) async {
    try {
      emit(Loading());
      weatherModel = await weather.getweather(CityName: cityname);
      print('==============>${weatherModel!.getcolor()}');
      emit(Success(weather: weatherModel));
    } on Exception catch (e) {
      emit(failure());
    }
  }
}
