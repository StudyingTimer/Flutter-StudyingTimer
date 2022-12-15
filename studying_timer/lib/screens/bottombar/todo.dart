import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studying_timer/common/common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studying_timer/provider/emphasis.dart';
import 'package:studying_timer/provider/todolist.dart';
import 'package:studying_timer/widget/todolist.dart';
import 'package:http/http.dart' as http;
import 'package:studying_timer/screens/loading.dart';

class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    var todoList = Provider.of<TodoLists>(context);
    final _todoController = TextEditingController();

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
    };

    void postequest(var emphaisis) async {
      print("실행됨");
      String url =
          'http://Java-Project-StudyTimer.ap-northeast-2.elasticbeanstalk.com/todo/insert';

      print(_todoController.text);
      print(_todoController.text);
      print(_todoController.text);
      print(_todoController.text);
      print(_todoController.text);
      

      http.Response response = await http.post(Uri.parse(url),
          headers: headers,
          body: jsonEncode(<String, String>{
            "token": emphaisis.accessToken,
            "content": _todoController.text,
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
                  Text("Todo 추가"),
                ],
              ),
              //
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _todoController,
                    decoration: const InputDecoration(
                      labelText: 'Todo입력',
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
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
    }

    var emphasis = Provider.of<Emphaisis>(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 50.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "To-do",
                        style: TextStyle(
                            fontSize: 30.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w300),
                      ),
                      IconButton(
                          onPressed: () {
                            FlutterDialog(emphasis);
                          },
                          icon: Icon(
                            Icons.add,
                            size: 32.h,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25.w, bottom: 40.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "삭제하려면 왼쪽으로 스와이프 해주세요",
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black.withOpacity(0.4)),
                      )
                    ],
                  ),
                ),
                TodoList(
                  access: emphasis.accessToken,
                )
              ],
            ),
          ),
        ));
  }
}
