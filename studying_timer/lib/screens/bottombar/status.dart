import 'package:flutter/material.dart';

class Status extends StatelessWidget {
  const Status({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: const[
            Text("Status", style: TextStyle(fontSize: 30),)
          ],
        ),
      ),
    );
  }
}