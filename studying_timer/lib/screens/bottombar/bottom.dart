import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studying_timer/common/common.dart';
import 'package:studying_timer/provider/emphasis.dart';
import 'package:studying_timer/provider/subjectlist.dart';
import 'package:studying_timer/screens/bottombar/home.dart';
import 'package:studying_timer/screens/bottombar/ranking.dart';
import 'package:studying_timer/screens/bottombar/status.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:studying_timer/screens/bottombar/todo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:studying_timer/screens/loading.dart';

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
    var subjectList = Provider.of<SubjectList>(context);

    int position1 = 590;
    int position2 = 530;
    int position3 = 470;
    int position4 = 410;
    int position5 = 350;
    final _subjectController = TextEditingController();

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
    };

    void postequest(var emphaisis) async {
      print("실행됨");
      String url =
          'http://Java-Project-StudyTimer.ap-northeast-2.elasticbeanstalk.com/subject/insert';

      print(_subjectController.text);
      print(emphaisis.accessToken);
      print(_subjectController.text.runtimeType);
      http.Response response = await http.post(Uri.parse(url),
          headers: headers,
          body: jsonEncode(<String, String>{
            "token": emphaisis.accessToken,
            "title": _subjectController.text,
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
                      accessToken: emphaisis.accessToken,
                    )));
      }
    }

    void FlutterDialog(var emphaisis) {
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
                  Text("과목추가"),
                ],
              ),
              //
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _subjectController,
                    decoration: const InputDecoration(
                      labelText: '과목입력',
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
                    "추가",
                    style: TextStyle(
                        color: Colors.blueAccent, fontWeight: FontWeight.w500),
                  ),
                  onPressed: () {
                    setState(() {
                      emphasis.change();
                      postequest(emphaisis);
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
                    setState(() {
                      emphasis.change();
                    });
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
    }

    List<Widget> buttonList = [
      Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: position5.h, left: 243.w),
            child: AnimatedScale(
              duration: const Duration(microseconds: 140000),
              scale: emphasis.ispressed ? 1 : 0,
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Text(
                    "+과목",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                        fontSize: 15.sp),
                  ),
                  SizedBox(
                    width: 9.w,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        FlutterDialog(emphasis);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: CommonColor.orange,
                          minimumSize: Size(55.w, 50.h)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.menu_book_outlined,
                            color: Colors.white,
                            size: 25.h,
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: position4.h, left: 223.w),
            child: AnimatedScale(
              duration: const Duration(microseconds: 120000),
              scale: emphasis.ispressed ? 1 : 0,
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Text(
                    "+To-do",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                        fontSize: 15.sp),
                  ),
                  SizedBox(
                    width: 9.w,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: CommonColor.orange,
                          minimumSize: Size(55.w, 50.h)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.check_box_outlined,
                            color: Colors.white,
                            size: 25.h,
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: position3.h, left: 243.w),
            child: AnimatedScale(
              alignment: Alignment.bottomCenter,
              duration: const Duration(microseconds: 100000),
              scale: emphasis.ispressed ? 1 : 0,
              child: Row(
                children: [
                  Text(
                    "+일정",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                        fontSize: 15.sp),
                  ),
                  SizedBox(
                    width: 9.w,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: CommonColor.orange,
                          minimumSize: Size(55.w, 50.h)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            FontAwesomeIcons.calendarDay,
                            color: Colors.white,
                            size: 25.h,
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: position2.h, left: 198.w),
            child: AnimatedScale(
              duration: const Duration(microseconds: 80000),
              scale: emphasis.ispressed ? 1 : 0,
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Text(
                    "오프라인모드",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                        fontSize: 15.sp),
                  ),
                  SizedBox(
                    width: 9.w,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          minimumSize: Size(55.w, 50.h)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.wifi_off_outlined,
                            color: Colors.black,
                            size: 25.h,
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: position1.h, left: 225.w),
            child: AnimatedScale(
              duration: const Duration(microseconds: 60000),
              alignment: Alignment.bottomCenter,
              scale: emphasis.ispressed ? 1 : 0,
              child: Row(
                children: [
                  Text(
                    "휴식알림",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                        fontSize: 15.sp),
                  ),
                  SizedBox(
                    width: 9.w,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white, minimumSize: Size(55.w, 50.h)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.access_alarm_outlined,
                            color: Colors.black,
                            size: 25.h,
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 287.w, top: 660.h),
            child: Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        emphasis.change();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      elevation: 6.0,
                      minimumSize: Size(55.w, 55.h),
                      backgroundColor: Colors.white,
                    ),
                    child: Icon(
                      emphasis.ispressed ? Icons.close : Icons.add,
                      color: CommonColor.orange,
                      size: 25.h,
                    )),
              ],
            ),
          ),
        ],
      ),

      //Todo page 화면
      Stack(
        children: [
          // Padding(
          //   padding: EdgeInsets.only(top: position1.h, left: 225.w),
          //   child: AnimatedScale(
          //     duration: const Duration(microseconds: 60000),
          //     alignment: Alignment.bottomCenter,
          //     scale: emphasis.ispressed ? 1 : 0,
          //     child: Row(
          //       children: [
          //         Text(
          //           "+To-do",
          //           style: TextStyle(
          //               color: Colors.white,
          //               fontWeight: FontWeight.w400,
          //               decoration: TextDecoration.none,
          //               fontSize: 15.sp),
          //         ),
          //         SizedBox(
          //           width: 9.w,
          //         ),
          //         ElevatedButton(
          //             onPressed: () {},
          //             style: ElevatedButton.styleFrom(
          //                 backgroundColor: CommonColor.orange,
          //                 minimumSize: Size(55.w, 50.h)),
          //             child: Row(
          //               mainAxisSize: MainAxisSize.min,
          //               children: [
          //                 Icon(
          //                   Icons.check_box_outlined,
          //                   color: Colors.white,
          //                   size: 25.h,
          //                 ),
          //               ],
          //             )),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
      Padding(
        padding: EdgeInsets.only(left: 287.w, top: 660.h),
        child: Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    emphasis.change();
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  elevation: 6.0,
                  minimumSize: Size(55.w, 55.h),
                  backgroundColor: Colors.white,
                ),
                child: Icon(
                  emphasis.ispressed ? Icons.close : Icons.add,
                  color: CommonColor.orange,
                  size: 25.h,
                )),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 287.w, top: 660.h),
        child: Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    emphasis.change();
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  elevation: 6.0,
                  minimumSize: Size(55.w, 55.h),
                  backgroundColor: Colors.white,
                ),
                child: Icon(
                  emphasis.ispressed ? Icons.close : Icons.add,
                  color: CommonColor.orange,
                  size: 25.h,
                )),
          ],
        ),
      ),
    ];

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
      buttonList[_currentIndex]
    ]);
  }
}
