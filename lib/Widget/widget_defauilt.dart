import 'package:flutter/material.dart';

class widget_defauilt extends StatelessWidget {
  const widget_defauilt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "there is no weather 😔 start \n searching now 🔍",
        style: TextStyle(fontSize: 22),
      ),
    );
  }
}
