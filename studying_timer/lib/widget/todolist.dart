import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studying_timer/model/todomodel.dart';
import 'package:studying_timer/provider/todolist.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {

List<Widget> makeTodoPaper(BuildContext context, List<TodoModel> todos) {
    
    List<Widget> results = [];

    for (var i = 0; i < todos.length; i++) {
      results.add(
        const AnimatedOpacity(opacity: 0.1, duration: Duration(microseconds: 240000),)
      );
    }
    return results;
  }

  @override
  Widget build(BuildContext context) {
    var todoList = Provider.of<TodoLists>(context);
    return Column(
      children: makeTodoPaper(
        context, todoList.todoList
      ),
    );
  }
}
