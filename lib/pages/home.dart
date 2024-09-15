import 'package:flutter/material.dart';
import 'package:weather/pages/search.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Search();
                }));
              },
              icon: const Icon(Icons.search))
        ],
        title: const Text('Homepage'),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text(
          "there is no weather 😔 start \n searching now 🔍",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
