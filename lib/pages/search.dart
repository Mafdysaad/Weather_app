// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/provider/weather_provider.dart';

import 'package:weather/services/weather_services.dart';

class Search extends StatelessWidget {
  const Search({super.key});
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
              onSubmitted: (value) async {
                WeatherModel weather =
                    await WeatherServices().getweather(CityName: value);
                Provider.of<weatherProvider>(context, listen: false)
                    .weathermodel = weather;
                Provider.of<weatherProvider>(context, listen: false).cityname =
                    value;
                Navigator.pop(context);
              },
              autofocus: true,
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.search),
                label: Text('Search'),
                contentPadding: EdgeInsets.all(30),
                hintText: "Enter a City",
                border: OutlineInputBorder(),
              )),
        )));
  }
}
