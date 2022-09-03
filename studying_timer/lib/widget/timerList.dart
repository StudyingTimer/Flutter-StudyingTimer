import 'package:flutter/material.dart';
import 'package:studying_timer/common/common.dart';
import 'package:studying_timer/model/timer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class TimerList extends StatefulWidget {
  final List<TimerModel> timerList;
  const TimerList({Key? key, required this.timerList}) : super(key: key);

  @override
  State<TimerList> createState() => _RankState();
}

class _RankState extends State<TimerList> {
  List<Widget> makeStudyPaper(BuildContext context, List<TimerModel> timers) {
    List<Widget> results = [];
    NumberFormat formatter = NumberFormat("00");

    for (var i = 0; i < timers.length; i++) {
      int selectBtnColor() {
        late int buttonColor;

        if (i == 0) {
          buttonColor = 0xFFF67878;
        } else if (i == 1) {
          buttonColor = 0xFF0C4FFA;
        } else if (i == 2) {
          buttonColor = 0xFF00B07B;
        }
        return buttonColor;
      }

      results.add(SizedBox(
        height: 100.h,
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                  trailing: const Icon(Icons.more_vert),
                  tileColor: Colors.white,
                  leading: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        timers[i].ispressed = !timers[i].ispressed;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      
                        shape: const CircleBorder(),
                        minimumSize: const Size(40, 40),
                        primary: Color(selectBtnColor())
                        ),
                    child: Icon(
                        timers[i].ispressed ?  Icons.pause : Icons.play_arrow ),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        timers[i].subject,
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
                            formatter.format(timers[i].hour),
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
                            formatter.format(timers[i].minute),
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
                            formatter.format(timers[i].second),
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ));
    }
    return results;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: makeStudyPaper(context, widget.timerList),
    );
  }
}
