import 'package:flutter/material.dart';
import 'package:studying_timer/model/timer.dart';

class SubjectList extends ChangeNotifier {
  // ChangeNotifier를 extends한다.
  final List<TimerModel> _timerList = <TimerModel>[];

  List<TimerModel> get timerList => _timerList;

  void add(String subject, int hour, int minute, int second) {
    timerList.add(TimerModel(subject, hour, minute, second));
    notifyListeners();
  }

  void clearly() {
    timerList.clear();
    notifyListeners();
  }
}
