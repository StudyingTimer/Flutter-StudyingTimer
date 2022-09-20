import 'package:flutter/material.dart';
import 'package:studying_timer/model/timer.dart';
import 'package:studying_timer/widget/timerList.dart';

class SubjectList extends ChangeNotifier {
  // ChangeNotifier를 extends한다.
  final List<TimerModel> _timerList = <TimerModel>[];

  List<TimerModel> get timerList => _timerList;

  void add(String subject) {
    timerList.add(TimerModel(subject));
    notifyListeners();
  }
}
