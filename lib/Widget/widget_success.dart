import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather/models/weather_model.dart';

class widget_success extends StatelessWidget {
  const widget_success({
    super.key,
    required this.weather,
  });

  final WeatherModel? weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        weather!.getcolor(),
        weather!.getcolor()[300]!,
        weather!.getcolor()[100]!,
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 3),
          Text(
            BlocProvider.of<WeatherCubit>(context).cityname!,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Text(
              "updat to :${weather!.date.hour.toString()}:${weather!.date.minute.toString()}" +
                  '  ' +
                  "${weather!.date.hour >= 12 ? 'Pm' : 'Am'}",
              style: const TextStyle(
                fontSize: 22,
              )),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(weather!.getimage()),
              Text(weather!.temp.toInt().toString(),
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold)),
              Column(
                children: [
                  Text('mixtemp : ${weather!.maxTemp.toInt()}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('mintemp : ${weather!.minTemp.toInt()}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
          const Spacer(),
          Text(weather!.weatherNamestate,
              style:
                  const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          const Spacer(
            flex: 5,
          )
        ],
      ),
    );
  }
}
