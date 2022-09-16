import 'package:flutter/material.dart';
import 'package:studying_timer/common/common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:studying_timer/model/timer.dart';
import 'package:studying_timer/widget/timerList.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  bool addpressed = false;

  int position1 = 120;
  int position2 = 60;

  @override
  void dispose() {
    // timer.cancel();
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
    return Stack(children: [
      Scaffold(
        backgroundColor: CommonColor.orange,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          shape: Border(
              bottom: BorderSide(
                  color: Colors.white.withOpacity(0.5), width: 0.5.h)),
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
                      child: Column(children: [
                        TimerList(timerList: timerList),

                        //휴식 알림 -> padding.top = 120
                        //타이머 추가 -> padding.top = 60
                        Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: position1.h, left: 270.w),
                              child: AnimatedScale(
                                duration: const Duration(microseconds: 60000),
                                scale: addpressed ? 1 : 0,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        minimumSize: Size(55.w, 50.h)),
                                    child: const Icon(
                                      Icons.access_alarm_outlined,
                                      color: Colors.black,
                                    )),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: position2.h, left: 270.w),
                              child: AnimatedScale(
                                duration: const Duration(microseconds: 110000),
                                scale: addpressed ? 1 : 0,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        primary: CommonColor.orange,
                                        minimumSize: Size(55.w, 50.h)),
                                    child: Icon(
                                      FontAwesomeIcons.bookOpen,
                                      color: Colors.white,
                                      size: 20.h,
                                    )),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 180.h, left: 270.w),
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      addpressed = !addpressed;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    elevation: 6.0,
                                    minimumSize: Size(55.w, 55.h),
                                    primary: Colors.white,
                                  ),
                                  child: Icon(
                                    addpressed ? Icons.close : Icons.add,
                                    color: CommonColor.orange,
                                    size: 25.h,
                                  )),
                            ),
                          ],
                        ),
                      ])))
            ],
          ),
        ),
      ),
      Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Colors.black.withOpacity(0.7)),
      ),
    ]);
  }
}
