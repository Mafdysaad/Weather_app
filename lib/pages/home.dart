import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/pages/search.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  updateUi() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Search(
                    funct: updateUi,
                  );
                }));
              },
              icon: const Icon(Icons.search))
        ],
        title: const Text('Homepage'),
        backgroundColor: Colors.blue,
      ),
      body: weathermodel == null
          ? const Center(
              child: Text(
                "there is no weather 😔 start \n searching now 🔍",
                style: TextStyle(fontSize: 22),
              ),
            )
          : Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 3),
                  const Text(
                    'cario',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const Text('updat:16-9-2024',
                      style: TextStyle(
                        fontSize: 22,
                      )),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/clear.png'),
                      const Text('30',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      const Column(
                        children: [
                          Text('mixtemp : 30',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Text('mintemp : 20',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  const Text('Clear',
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
