import 'package:flutter/material.dart';

class SignupData extends ChangeNotifier {
  String _pw = '';
  String _name = '';
  String _email = '';

  String get pw => _pw;
  String get name => _name;
  String get email => _email;


  void inputPw(String pw1) {
    _pw = pw1;
    notifyListeners();
  }

  void inputName(String name1) {
    _name = name1;
    notifyListeners();
  }

  void inputEmail(String email1) {
    _email = email1;
    notifyListeners();
  }
}