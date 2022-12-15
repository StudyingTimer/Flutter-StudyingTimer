import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studying_timer/common/common.dart';
import 'package:studying_timer/model/todomodel.dart';
import 'package:studying_timer/provider/emphasis.dart';
import 'package:studying_timer/provider/todolist.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:studying_timer/screens/loading.dart';

class TodoList extends StatefulWidget {
  final String access;
  const TodoList({super.key, required this.access});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Widget> makeTodoPaper(BuildContext context, List<TodoModel> todos) {
    List<Widget> results = [];
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

    for (var i = 0; i < todos.length; i++) {
      void deleterequest(String title) async {
        print("delete실행됨");
        String url =
            'http://Java-Project-StudyTimer.ap-northeast-2.elasticbeanstalk.com/todo/delete';

        Map<String, String> headers = {
          'Content-Type': 'application/json',
          'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
        };

        print(widget.access);
        print(title);

        http.Response response = await http.delete(Uri.parse(url),
            headers: headers,
            body: jsonEncode(<String, String>{
              "token": widget.access,
              "content": title,
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
                        accessToken: widget.access,
                      )));
        } else {
          toastmessage();
        }
      }

      void putrequest(String old) async {
        print("put실행됨");
        String url =
            'http://Java-Project-StudyTimer.ap-northeast-2.elasticbeanstalk.com/todo/update';

        http.Response response = await http.put(Uri.parse(url),
            headers: headers,
            body: jsonEncode(<String, String>{
              "token": widget.access,
              "oldContent": old,
              "newContent": _nameController.text,
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
                        accessToken: widget.access,
                      )));
        } else {
          toastmessage();
        }
      }

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
                      putrequest(todos[i].name);
                      setState(() {});
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
                    deleterequest(todos[i].name);
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

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
  };

  var todoo;
  var emphaisises;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      todoo = Provider.of<TodoLists>(context, listen: false);
      emphaisises = Provider.of<Emphaisis>(context, listen: false);
    });
    _postrequest();
    super.initState();
  }

  void _postrequest() async {
    print("code");
    print("postrequest 실행");
    String url =
        'http://Java-Project-StudyTimer.ap-northeast-2.elasticbeanstalk.com/todos/${widget.access}';
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    int statuscode = response.statusCode;
    todoo.clearly();

    if (statuscode == 200) {
      var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
      print("parsingData = $parsingData");
      for (int i = 0; i < parsingData["length"]; i++) {
        todoo.add("${parsingData["list"][i]["content"]}");
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    var todoList = Provider.of<TodoLists>(context);
    return Column(
      children: makeTodoPaper(context, todoList.todoList),
    );
  }
}
