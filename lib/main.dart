import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';

import 'package:weather/pages/home.dart';
import 'package:weather/provider/weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => weatherProvider(), child: const Weather()));
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
                    Provider.of<weatherProvider>(context).getweather == null
                        ? Colors.blue
                        : Provider.of<weatherProvider>(context)
                            .getweather!
                            .getcolor())));
  }
}
