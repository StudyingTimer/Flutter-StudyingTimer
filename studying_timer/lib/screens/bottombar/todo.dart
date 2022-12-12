import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studying_timer/common/common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studying_timer/provider/todolist.dart';
import 'package:studying_timer/widget/todolist.dart';

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

    void FlutterDialog() {
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
                      todoList.add(_todoController.text);
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
                            FlutterDialog();
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
                const TodoList()
              ],
            ),
          ),
        ));
  }
}
