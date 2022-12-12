import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studying_timer/model/timer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:studying_timer/provider/emphasis.dart';
import 'package:studying_timer/provider/subjectlist.dart';
import 'package:studying_timer/screens/loading.dart';
import 'package:studying_timer/screens/onpressbottom/ing.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class TimerList extends StatefulWidget {
  final String token;
  const TimerList({Key? key, required this.token}) : super(key: key);

  @override
  State<TimerList> createState() => _RankState();
}

class _RankState extends State<TimerList> {
  final _nameController = TextEditingController();

  void toastmessage() {
    Fluttertoast.showToast(
        msg: "오류가 발생했습니다",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.sp);
  }

  List<Widget> makeStudyPaper(
      BuildContext context, List<TimerModel> timers, String access) {
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

      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
      };

      void deleterequest(String title) async {
        print("delete실행됨");
        String url =
            'http://Java-Project-StudyTimer.ap-northeast-2.elasticbeanstalk.com/subject/delete';

        http.Response response = await http.delete(Uri.parse(url),
            headers: headers,
            body: jsonEncode(<String, String>{
              "token": access,
              "title": title,
            }));

        // ignore: avoid_print
        print(response.body);
        // ignore: avoid_print
        print('실행되었습ㄴ디ㅏ');
        // ignore: avoid_print
        print(response.statusCode);
        if (response.statusCode == 200) {
          // ignore: use_build_context_synchronously
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Loading(
                        accessToken: access,
                      )));
        } else {
          toastmessage();
        }
      }

      void putrequest(String old) async {
        print("put실행됨");
        String url =
            'http://Java-Project-StudyTimer.ap-northeast-2.elasticbeanstalk.com/subject/title/update';

        http.Response response = await http.put(Uri.parse(url),
            headers: headers,
            body: jsonEncode(<String, String>{
              "token": access,
              "oldTitle": old,
              "newTitle": _nameController.text,
            }));

        // ignore: avoid_print
        print(response.body);
        // ignore: avoid_print
        print('실행되었습ㄴ디ㅏ');
        // ignore: avoid_print
        print(response.statusCode);
        if (response.statusCode == 200) {
          // ignore: use_build_context_synchronously
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Loading(
                        accessToken: access,
                      )));
        } else {
          toastmessage();
        }
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
                        elevation: 0, backgroundColor: Colors.transparent),
                    child: const Text(
                      "변경",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w500),
                    ),
                    onPressed: () {
                      setState(() {
                        putrequest(timers[i].subject);
                      });
                      Navigator.pop(context);
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0, backgroundColor: Colors.transparent),
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

      void selectDialog() {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),

                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 50.h,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              deleterequest(timers[i].subject);
                              Navigator.pop(context);
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white),
                          child: Text(
                            "삭제",
                            style:
                                TextStyle(fontSize: 19.sp, color: Colors.blue),
                          )),
                    ),
                    Container(
                      width: double.infinity,
                      height: 50.h,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            nameDialog();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white),
                          child: Text(
                            "이름 변경",
                            style:
                                TextStyle(fontSize: 19.sp, color: Colors.blue),
                          )),
                    ),
                  ],
                ),
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
                      backgroundColor: Colors.transparent,
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
                                timerList: timers,
                                token: access,
                                ))).then((value) {
                      setState(() {});
                    });

                    FlutterDialog();
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      shape: const CircleBorder(),
                      minimumSize: Size(35.w, 35.h),
                      backgroundColor: Color(selectBtnColor())),
                  child: const Icon(Icons.play_arrow),
                ),
              ),
              SizedBox(
                width: 130.w,
                child: Text(
                  timers[i].subject,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600),
                ),
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
                  ElevatedButton(
                    onPressed: () {
                      selectDialog();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0.0,
                        minimumSize: Size(10.w, 20.h),
                        shape: const CircleBorder()),
                    child: const Icon(
                      Icons.more_vert,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ));
    }
    return results;
  }

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
  };

  var subjectLists;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      subjectLists = Provider.of<SubjectList>(context, listen: false);
    });
    _postrequest();
    super.initState();
  }

  void _postrequest() async {
    print("code");
    print("postrequest 실행");
    String url =
        'http://Java-Project-StudyTimer.ap-northeast-2.elasticbeanstalk.com/subjects/${widget.token}';
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    int statuscode = response.statusCode;
    subjectLists.clearly();

    if (statuscode == 200) {
      var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
      print("parsingData = $parsingData");
      for (int i = 0; i < parsingData["length"]; i++) {
        subjectLists.add(
            "${parsingData["list"][i]["title"]}",
            parsingData["list"][i]["studyHour"],
            parsingData["list"][i]["studyMinute"],
            parsingData["list"][i]["studySecond"]);
      }
    } else {}
  }

  // 선택 창
  @override
  Widget build(BuildContext context) {
    var subjectList = Provider.of<SubjectList>(context);
    var emphasis = Provider.of<Emphaisis>(context);

    return Column(
      children:
          makeStudyPaper(context, subjectList.timerList, emphasis.accessToken),
    );
  }
}
