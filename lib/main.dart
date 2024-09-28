import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather/models/weather_model.dart';

import 'package:weather/pages/home.dart';

import 'package:weather/services/weather_services.dart';

void main() {
  runApp(BlocProvider(
      create: (context) => WeatherCubit(weather: WeatherServices()),
      child: const Weather()));
}

class Weather extends StatelessWidget {
  const Weather({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Homepage(),
        theme: ThemeData.light().copyWith(
            appBarTheme: AppBarTheme(
                backgroundColor:
                    BlocProvider.of<WeatherCubit>(context).weatherModel == null
                        ? Colors.blue
                        : BlocProvider.of<WeatherCubit>(context)
                            .weatherModel!
                            .getcolor())));
  }
}
