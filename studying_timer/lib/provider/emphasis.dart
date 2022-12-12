import 'package:flutter/material.dart';

class Emphaisis extends ChangeNotifier {
  // ChangeNotifier를 extends한다.
  bool _ispressed = false;
  String _accessToken = "";
  bool _bsmispressed = false;
  int _hour = 0;
  int _minute = 0;
  int _second = 0;

  bool get ispressed => _ispressed;
  bool get bsmispressed => _bsmispressed;
  String get accessToken => _accessToken;
  int get hour => _hour;
  int get minute => _minute;
  int get second => _second;

  void change() {
    _ispressed = !ispressed;
    notifyListeners();
  }

  void bsmchange() {
    _bsmispressed = true;
    notifyListeners();
  }

  void inputTime(int hour, int minute, int second) {
    _hour = hour;
    _minute = minute;
    _second = second;
    notifyListeners();
  }

  void inputaccesstoken(String access) {
    print("access = $access");

    _accessToken = access;
    // ignore: avoid_print
    print("accessToken = $accessToken");
    notifyListeners();
  }
}
