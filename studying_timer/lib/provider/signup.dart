import 'package:flutter/material.dart';

class SignupData extends ChangeNotifier {
  String _name = '';

  String get name => _name;

  void inputName(String name1) {
    _name = name1;
    notifyListeners();
  }
}
