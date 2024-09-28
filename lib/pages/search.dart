// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather/models/weather_model.dart';

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
                BlocProvider.of<WeatherCubit>(context).cityname = value;

                BlocProvider.of<WeatherCubit>(context)
                    .getweather(cityname: value);

                Navigator.pop(context);
              },
              autofocus: true,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () async {
                    BlocProvider.of<WeatherCubit>(context)
                        .getweather(cityname: value!);
                    BlocProvider.of<WeatherCubit>(context).cityname = value;
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
