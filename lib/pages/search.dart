// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:weather/models/weather_model.dart';

import 'package:weather/services/weather_services.dart';

class Search extends StatelessWidget {
  VoidCallback? funct;
  Search({
    required this.funct,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: const Text("Search a City"),
          backgroundColor: Colors.blue,
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9),
          child: TextField(
              onSubmitted: (value) async {
                Future<WeatherModel> data =
                    WeatherServices().getweather(CityName: value);

                weathermodel = await data;
                funct!();
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

WeatherModel? weathermodel;
