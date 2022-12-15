import 'package:flutter/material.dart';
import 'package:studying_timer/model/todomodel.dart';

class TodoLists extends ChangeNotifier {
  // ChangeNotifier를 extends한다.
  final List<TodoModel> _todoList = <TodoModel>[];

  List<TodoModel> get todoList => _todoList;

  void add(String content) {
    todoList.add(TodoModel(content));
    notifyListeners();
  }

  void clearly() {
    todoList.clear();
    notifyListeners();
  }
}
