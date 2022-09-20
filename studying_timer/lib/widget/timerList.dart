import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studying_timer/model/timer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:studying_timer/provider/subjectlist.dart';
import 'package:studying_timer/screens/onpressbottom/ing.dart';

class TimerList extends StatefulWidget {
  const TimerList({Key? key}) : super(key: key);

  @override
  State<TimerList> createState() => _RankState();
}

class _RankState extends State<TimerList> {
  final _nameController = TextEditingController();

  List<Widget> makeStudyPaper(BuildContext context, List<TimerModel> timers) {
    List<String> _valueList = ['이름 수정', '삭제'];
    late String _selectedValue = '';
    List<Widget> results = [];
    NumberFormat formatter = NumberFormat("00");

    for (var i = 0; i < timers.length; i++) {
      print('list가 만들어졌습니다 $i');
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

      void nameDialog() {
        showDialog(
            context: context,
            //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                //Dialog Main Title
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("이름변경"),
                  ],
                ),
                //
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: '바꿀이름입력',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 5),
                        ),
                      ),
                    ),
                  ],
                ),
                actions: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0, primary: Colors.transparent),
                    child: const Text(
                      "변경",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w500),
                    ),
                    onPressed: () {
                      setState(() {
                        timers[i].subject = _nameController.text;
                      });
                      Navigator.pop(context);
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0, primary: Colors.transparent),
                    child: const Text("취소",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w500)),
                    onPressed: () {
                      setState(() {});
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            });
      }

      void FlutterDialog() {
        String h = formatter.format(timers[i].hour);
        String m = formatter.format(timers[i].minute);
        String s = formatter.format(timers[i].second);
        String time = "$h : $m : $s";
        showDialog(
            context: context,
            //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                //Dialog Main Title
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      timers[i].subject,
                      style: TextStyle(
                          fontSize: 19.sp, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                //
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$time 기록되었습니다",
                      style: TextStyle(fontSize: 17.sp),
                    ),
                  ],
                ),
                actions: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0.0,
                    ),
                    child: const Text(
                      "확인",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            });
      }

      results.add(Container(
        width: double.infinity,
        height: 73.h,
        margin: EdgeInsets.only(top: 10.h),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 15.w,
            right: 15.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: ElevatedButton(
                  onPressed: () async {
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Ing(
                                hour: timers[i].hour,
                                minute: timers[i].minute,
                                second: timers[i].second,
                                i: i,
                                timerList: timers))).then((value) {
                      setState(() {});
                    });

                    FlutterDialog();
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
                      // timers.removeAt(i);
                    } else if (value == 1) {
                      nameDialog();
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

  // 선택 창
  @override
  Widget build(BuildContext context) {
    var subjectList = Provider.of<SubjectList>(context);
    return Column(
      children: makeStudyPaper(context, subjectList.timerList),
    );
  }
}
