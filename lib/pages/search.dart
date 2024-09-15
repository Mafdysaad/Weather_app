import 'package:flutter/material.dart';
import 'package:weather/services/weather_services.dart';

class Search extends StatelessWidget {
  String? search;

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
              onSubmitted: (value) {
                WeatherServices().getweather(CityName: value);
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
