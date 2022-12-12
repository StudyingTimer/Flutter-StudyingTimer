import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studying_timer/common/common.dart';
import 'package:studying_timer/model/todomodel.dart';
import 'package:studying_timer/provider/todolist.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Widget> makeTodoPaper(BuildContext context, List<TodoModel> todos) {
    List<Widget> results = [];
    final _nameController = TextEditingController();

    for (var i = 0; i < todos.length; i++) {
      void nameDialog() async {
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
                        todos[i].name = _nameController.text;
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

      results.add(Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: SwipeActionCell(
            backgroundColor: Colors.white,
            key: ObjectKey(todos[i]),
            trailingActions: <SwipeAction>[
              SwipeAction(
                  widthSpace: 60,
                  title: "삭제",
                  onTap: (CompletionHandler handler) async {
                    await handler(true);
                    todos.removeAt(i);
                    setState(() {});
                  },
                  color: Colors.red),
              SwipeAction(
                  widthSpace: 80,
                  title: "수정",
                  onTap: (CompletionHandler handler) async {
                    nameDialog();
                    await handler(false);
                    setState(() {});
                  },
                  color: Colors.orange),
            ],
            child: Padding(
              padding: EdgeInsets.only(left: 25.w, right: 25.w),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                  height: 40.h,
                  width: 20.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1.w,
                      color: CommonColor.orange,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                SizedBox(
                    width: 260.w,
                    child:
                        Text(todos[i].name, style: TextStyle(fontSize: 20.sp)))
              ]),
            )),
      ));
    }
    return results;
  }

  @override
  Widget build(BuildContext context) {
    var todoList = Provider.of<TodoLists>(context);
    return Column(
      children: makeTodoPaper(context, todoList.todoList),
    );
  }
}
