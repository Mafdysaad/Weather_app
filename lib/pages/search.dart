// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/provider/weather_provider.dart';

import 'package:weather/services/weather_services.dart';

class Search extends StatelessWidget {
  String? value;
  Search({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: const Text("Search a City"),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9),
          child: TextField(
              onChanged: (val) {
                value = val;
              },
              onSubmitted: (value) async {
                WeatherModel? weather =
                    await WeatherServices().getweather(CityName: value);
                Provider.of<weatherProvider>(context, listen: false)
                    .weathermodel = weather;
                Provider.of<weatherProvider>(context, listen: false).cityname =
                    value;
                Navigator.pop(context);
              },
              autofocus: true,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () async {
                    WeatherModel? weather =
                        await WeatherServices().getweather(CityName: value!);
                    Provider.of<weatherProvider>(context, listen: false)
                        .weathermodel = weather;
                    Provider.of<weatherProvider>(context, listen: false)
                        .cityname = value;
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.search),
                ),
                label: const Text('Search'),
                contentPadding: const EdgeInsets.all(30),
                hintText: "Enter a City",
                border: const OutlineInputBorder(),
              )),
        )));
  }
}
