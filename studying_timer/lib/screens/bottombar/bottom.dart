import 'package:flutter/material.dart';
import 'package:studying_timer/screens/bottombar/home.dart';
import 'package:studying_timer/screens/bottombar/ranking.dart';
import 'package:studying_timer/screens/bottombar/status.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:studying_timer/screens/bottombar/todo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  var _currentIndex = 0;
  final List<Widget> _children = [
    const Home(),
    const Todo(),
    const Rank(),
    const Status()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: Material(
        color: Colors.white,
        child: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Home"),
              selectedColor: Colors.purple,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: const Icon(FontAwesomeIcons.clipboardList),
              title: const Text("Todo"),
              selectedColor: Colors.teal,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: const Icon(FontAwesomeIcons.rankingStar),
              title: const Text("Rank"),
              selectedColor: Colors.pink,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: const Icon(FontAwesomeIcons.chartBar),
              title: const Text("Status"),
              selectedColor: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
