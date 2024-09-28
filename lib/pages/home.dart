import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather/Widget/widget_defauilt.dart';
import 'package:weather/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather/cubits/weather_cubit/weather_state.dart';
import '../Widget/widget_success.dart';

import 'package:weather/pages/search.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  String time = "AM";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Search();
              }));
            },
            icon: const Icon(Icons.search))
      ], title: const Text('Homepage')),
      body: BlocBuilder<WeatherCubit, Weatherstate>(builder: (context, State) {
        if (State is Loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (State is failure) {
          return const Center(child: Text('Some thing is wrong ...!!'));
        } else if (State is Success) {
          return widget_success(weather: State.weather);
        } else {
          return const widget_defauilt();
        }
      }),
    );
  }
}
