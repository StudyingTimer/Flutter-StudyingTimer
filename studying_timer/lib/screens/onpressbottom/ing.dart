import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studying_timer/model/timer.dart';
import 'dart:async';
import 'package:intl/intl.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

class Ing extends StatefulWidget {
  final int hour, minute, second, i;
  final List<TimerModel> timerList;

  const Ing(
      {Key? key,
      required this.hour,
      required this.minute,
      required this.second,
      required this.i,
      required this.timerList})
      : super(key: key);

  @override
  State<Ing> createState() => _IngState();
}

class _IngState extends State<Ing> {
  late Timer timer = timer;
  NumberFormat formatter = NumberFormat("00");

  @override
  void dispose() {
    super.dispose();
    print('ing.dart가 끝났습니다1');
    timer.cancel();
    print('ing.dart가 끝났습니다');
  }

  @override
  void initState() {
    super.initState();
    start();
    // ignore: avoid_print
    print('타이머가 실행되었습니다');
  }

  void start() {
    timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      setState(() {
        widget.timerList[widget.i].second++;
        if (widget.timerList[widget.i].second == 60) {
          widget.timerList[widget.i].second = 0;
          widget.timerList[widget.i].minute++;
          if (widget.timerList[widget.i].minute == 60) {
            widget.timerList[widget.i].minute = 0;
            widget.timerList[widget.i].hour++;
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 320.h, top: 320.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: IconButton(
                      onPressed: () {
                        
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.pause_circle,
                        color: Colors.white,
                      ),
                      iconSize: 50.r,
                    ),
                  ),
                  Text(
                    formatter.format(widget.timerList[widget.i].hour),
                    style: TextStyle(color: Colors.white, fontSize: 40.sp),
                  ),
                  Text(
                    ":",
                    style: TextStyle(color: Colors.white, fontSize: 40.sp),
                  ),
                  Text(
                    formatter.format(widget.timerList[widget.i].minute),
                    style: TextStyle(color: Colors.white, fontSize: 40.sp),
                  ),
                  Text(
                    ":",
                    style: TextStyle(color: Colors.white, fontSize: 40.sp),
                  ),
                  Text(
                    formatter.format(widget.timerList[widget.i].second),
                    style: TextStyle(color: Colors.white, fontSize: 40.sp),
                  ),
                ],
              ),
            ),
            Text(
              "이 기능을 사용하는 동안",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              "이 앱을 제외한 모든앱을 사용할 수 없습니다",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
