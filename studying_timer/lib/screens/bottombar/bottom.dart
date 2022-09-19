import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studying_timer/common/common.dart';
import 'package:studying_timer/provider/emphasis.dart';
import 'package:studying_timer/screens/bottombar/home.dart';
import 'package:studying_timer/screens/bottombar/ranking.dart';
import 'package:studying_timer/screens/bottombar/status.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:studying_timer/screens/bottombar/todo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    var emphasis = Provider.of<Emphaisis>(context);
    int position1 = 590;
    int position2 = 530;
    int position3 = 470;
    int position4 = 410;
    int position5 = 350;

    return Stack(children: [
      Scaffold(
        resizeToAvoidBottomInset: false,
        body: IndexedStack(
          index: _currentIndex,
          children: _children,
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  top: BorderSide(
                      color: Colors.black.withOpacity(0.1), width: 1.w))),
          child: SalomonBottomBar(
            currentIndex: _currentIndex,
            onTap: (i) => setState(() => {_currentIndex = i}),
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
      ),
      emphasis.ispressed
          ? Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.7)),
            )
          : Container(),
      Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 290.w, top: position5.h),
            child: AnimatedScale(
              duration: const Duration(microseconds: 140000),
              scale: emphasis.ispressed ? 1 : 0,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: CommonColor.orange,
                      minimumSize: Size(55.w, 50.h)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.menu_book_outlined,
                        color: Colors.white,
                        size: 25.h,
                      ),
                      Text(
                        "+과목 추가",
                        style: TextStyle(fontSize: 7.sp, color: Colors.white),
                      )
                    ],
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 290.w, top: position4.h),
            child: AnimatedScale(
              duration: const Duration(microseconds: 120000),
              scale: emphasis.ispressed ? 1 : 0,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: CommonColor.orange,
                      minimumSize: Size(55.w, 50.h)),
                  child: Icon(
                    Icons.check_box_outlined,
                    color: Colors.white,
                    size: 25.h,
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 290.w, top: position3.h),
            child: AnimatedScale(
              duration: const Duration(microseconds: 100000),
              scale: emphasis.ispressed ? 1 : 0,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: CommonColor.orange,
                      minimumSize: Size(55.w, 50.h)),
                  child: Icon(
                    FontAwesomeIcons.calendarDay,
                    color: Colors.white,
                    size: 25.h,
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 290.w, top: position2.h),
            child: AnimatedScale(
              duration: const Duration(microseconds: 80000),
              scale: emphasis.ispressed ? 1 : 0,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: CommonColor.orange,
                      minimumSize: Size(55.w, 50.h)),
                  child: Icon(
                    Icons.wifi_off_outlined,
                    color: Colors.white,
                    size: 25.h,
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 290.w, top: position1.h),
            child: AnimatedScale(
              duration: const Duration(microseconds: 60000),
              scale: emphasis.ispressed ? 1 : 0,
              child: Row(
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white, minimumSize: Size(55.w, 50.h)),
                      child: const Icon(
                        Icons.access_alarm_outlined,
                        color: Colors.black,
                      )),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 290.w, top: 660.h),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    emphasis.change();
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  elevation: 6.0,
                  minimumSize: Size(55.w, 55.h),
                  primary: Colors.white,
                ),
                child: Icon(
                  emphasis.ispressed ? Icons.close : Icons.add,
                  color: CommonColor.orange,
                  size: 25.h,
                )),
          ),
        ],
      ),
    ]);
  }
}
