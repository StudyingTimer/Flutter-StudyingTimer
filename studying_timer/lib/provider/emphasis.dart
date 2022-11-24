import 'package:flutter/material.dart';

class Emphaisis extends ChangeNotifier {
  // ChangeNotifier를 extends한다.
  bool _ispressed = false;
  String _accessToken = "";
  bool _bsmispressed = false;

  bool get ispressed => _ispressed;
  bool get bsmispressed => _bsmispressed;
  String get accessToken => _accessToken;
  
  
  void change() {
    _ispressed = !ispressed;
    notifyListeners();
  }

  void bsmchange() {
    _bsmispressed = true;
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
