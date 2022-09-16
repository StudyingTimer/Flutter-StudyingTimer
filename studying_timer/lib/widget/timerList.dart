import 'package:flutter/material.dart';
import 'package:studying_timer/common/common.dart';
import 'package:studying_timer/model/timer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:studying_timer/screens/onpressbottom/ing.dart';

class TimerList extends StatefulWidget {
  final List<TimerModel> timerList;
  const TimerList({Key? key, required this.timerList}) : super(key: key);

  @override
  State<TimerList> createState() => _RankState();
}

class _RankState extends State<TimerList> {
  List<Widget> makeStudyPaper(BuildContext context, List<TimerModel> timers) {
    List<String> _valueList = ['이름 수정', '삭제'];
    late String _selectedValue = '';
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

      results.add(Container(
        width: double.infinity,
        height: 75.h,
        color: Colors.white,
        margin: EdgeInsets.only(top: 10.h),
        child: Padding(
          padding: EdgeInsets.only(
            left: 15.w,
            right: 15.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Ing(
                                hour: timers[i].hour,
                                minute: timers[i].minute,
                                second: timers[i].second,
                                i: i,
                                timerList: timers)));
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      shape: const CircleBorder(),
                      minimumSize: Size(35.w, 35.h),
                      primary: Color(selectBtnColor())),
                  child: const Icon(Icons.play_arrow),
                ),
              ),
              Text(
                timers[i].subject,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 110.w,
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
                  PopupMenuButton(
                      // add icon, by default "3 dot" icon
                      // icon: Icon(Icons.book)
                      itemBuilder: (context) {
                    return [
                      const PopupMenuItem<int>(
                        value: 0,
                        child: Text("Delete"),
                      ),
                      const PopupMenuItem<int>(
                        value: 1,
                        child: Text("Edit"),
                      ),
                    ];
                  }, onSelected: (value) {
                    if (value == 0) {
                      //list에서 삭제
                    } else if (value == 1) {
                      //이름 변경
                    }
                  }),
                ],
              ),
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
