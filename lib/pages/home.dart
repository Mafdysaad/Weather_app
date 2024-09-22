import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:weather/main.dart';
import 'package:weather/models/weather_model.dart';

import 'package:weather/pages/search.dart';
import 'package:weather/provider/weather_provider.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  WeatherModel? weather;
  String time = "AM";
  @override
  Widget build(BuildContext context) {
    weather = Provider.of<weatherProvider>(context).getweather;
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const Search();
              }));
            },
            icon: const Icon(Icons.search))
      ], title: const Text('Homepage')),
      body: weather == null
          ? const Center(
              child: Text(
                "there is no weather 😔 start \n searching now 🔍",
                style: TextStyle(fontSize: 22),
              ),
            )
          : Container(
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
                    Provider.of<weatherProvider>(context).cityname!,
                    style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold),
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
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold)),
                  const Spacer(
                    flex: 5,
                  )
                ],
              ),
            ),
    );
  }
}
