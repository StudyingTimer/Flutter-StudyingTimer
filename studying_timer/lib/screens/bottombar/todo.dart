import 'package:flutter/material.dart';

class Todo extends StatelessWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: const[
            Text("Todo", style: TextStyle(fontSize: 30),)
          ],
        ),
      ),
    );
  }
}