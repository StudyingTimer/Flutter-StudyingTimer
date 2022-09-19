import 'package:flutter/material.dart';

class Rank extends StatelessWidget {
  const Rank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Rank",
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
