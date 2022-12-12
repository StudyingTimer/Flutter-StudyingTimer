// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:studying_timer/common/common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:studying_timer/model/timer.dart';
import 'package:studying_timer/provider/emphasis.dart';
import 'package:studying_timer/widget/timerlist.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<TimerModel> timerList = <TimerModel>[];

  NumberFormat formatter = NumberFormat("00");
 
  int position1 = 120;
  int position2 = 60;
  var now = DateTime.now();
  late String formatDate1 = DateFormat('MM. dd. ').format(now);
  late String formatData2 = DateFormat('E', 'ko').format(now);

  @override
  void dispose() {
    // timer.cancel();

    super.dispose();
    print('home.dart가 끝났습니다');
  }

  @override
  void initState() {
    super.initState();
    print('home.dart가 실행되었습니다');
  }

  @override
  Widget build(BuildContext context) {
    var emphasis = Provider.of<Emphaisis>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CommonColor.orange,
      
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0.0,
        shape: Border(
            bottom:
                BorderSide(color: Colors.white.withOpacity(0.5), width: 0.5.h)),
        backgroundColor: CommonColor.orange,
        title: Text(
          // "9. 08. (목)",
          "${formatDate1}(${formatData2})",
          style: TextStyle(fontSize: 20.sp),
        ),
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
                      formatter.format(emphasis.hour),
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
                      formatter.format(emphasis.minute),
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
                      formatter.format(emphasis.second),
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
                      TimerList(token: emphasis.accessToken),

                      //휴식 알림 -> padding.top = 120
                      //타이머 추가 -> padding.top = 60
                      // Stack(
                      //   children: [
                      //     Padding(
                      //       padding:
                      //           EdgeInsets.only(top: position1.h, left: 270.w),
                      //       child: AnimatedScale(
                      //         duration: const Duration(microseconds: 60000),
                      //         scale: emphasis.ispressed ? 1 : 0,
                      //         child: ElevatedButton(
                      //             onPressed: () {},
                      //             style: ElevatedButton.styleFrom(
                      //                 primary: Colors.white,
                      //                 minimumSize: Size(55.w, 50.h)),
                      //             child: const Icon(
                      //               Icons.access_alarm_outlined,
                      //               color: Colors.black,
                      //             )),
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding:
                      //           EdgeInsets.only(top: position2.h, left: 270.w),
                      //       child: AnimatedScale(
                      //         duration: const Duration(microseconds: 110000),
                      //         scale: emphasis.ispressed ? 1 : 0,
                      //         child: ElevatedButton(
                      //             onPressed: () {},
                      //             style: ElevatedButton.styleFrom(
                      //                 primary: CommonColor.orange,
                      //                 minimumSize: Size(55.w, 50.h)),
                      //             child: Icon(
                      //               FontAwesomeIcons.bookOpen,
                      //               color: Colors.white,
                      //               size: 20.h,
                      //             )),
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding: EdgeInsets.only(top: 180.h, left: 270.w),
                      //       child: ElevatedButton(
                      //           onPressed: () {
                      //             setState(() {
                      //               emphasis.change();
                      //             });
                      //           },
                      //           style: ElevatedButton.styleFrom(
                      //             shape: const CircleBorder(),
                      //             elevation: 6.0,
                      //             minimumSize: Size(55.w, 55.h),
                      //             primary: Colors.white,
                      //           ),
                      //           child: Icon(
                      //             emphasis.ispressed ? Icons.close : Icons.add,
                      //             color: CommonColor.orange,
                      //             size: 25.h,
                      //           )),
                      //     ),
                      //   ],
                      // ),
                    ])))
          ],
        ),
      ),
    );
  }
}
