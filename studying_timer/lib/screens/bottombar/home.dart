import 'dart:async';

import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:studying_timer/common/common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:studying_timer/model/timer.dart';
import 'package:studying_timer/widget/timerList.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<TimerModel> timerList = <TimerModel>[];
  NumberFormat formatter = NumberFormat("00");
  int hour = 00;
  int minutes = 00;
  int second = 00;
  final bool _iconpress = false;
  late Timer timer = timer;

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    timerList.add(TimerModel("국어"));
    timerList.add(TimerModel("수학"));
    timerList.add(TimerModel("영어"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColor.orange,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        shape: Border(
            bottom:
                BorderSide(color: Colors.white.withOpacity(0.5), width: 0.5.h)),
        backgroundColor: CommonColor.orange,
        title: Text(
          "9. 08. (목)",
          style: TextStyle(fontSize: 20.sp),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            )),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 14.w),
                child: Text(
                  "D-day",
                  style: TextStyle(fontSize: 17.sp, color: Colors.white),
                ),
              ),
            ],
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                color: CommonColor.orange,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      formatter.format(hour),
                      style: TextStyle(
                          fontSize: 45.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      ":",
                      style: TextStyle(
                          fontSize: 45.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      formatter.format(minutes),
                      style: TextStyle(
                          fontSize: 45.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      ":",
                      style: TextStyle(
                          fontSize: 45.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      formatter.format(second),
                      style: TextStyle(
                          fontSize: 45.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r),
                          topRight: Radius.circular(10.r))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        width: double.infinity,
                        height: 90.h,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  // timers[i].ispressed = !timers[i].ispressed;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  minimumSize: const Size(40, 40),
                                  primary: Color(
                                      // selectBtnColor()
                                      0xff000000)),
                              child: Icon(Icons.pause
                                  // timers[i].ispressed ?  Icons.pause : Icons.play_arrow
                                  ),
                            ),
                            Text(
                              //timers[i].subject,
                              "과목",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  //formatter.format(
                                  //timers[i].hour
                                  //),
                                  "00",
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  ":",
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "00",
                                  //formatter.format(timers[i].minute),
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  ":",
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "00",
                                  //formatter.format(timers[i].second),
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                                Icon(Icons.more_vert)
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
