import 'package:flutter/material.dart';

class Token extends ChangeNotifier {
  String _accessToken = "";
  String _refreshToken = "";

  String get accessToken => _accessToken;
  String get refreshToken => _refreshToken;


  void inputAccessToken(String access) {
    print("access = $access");

    _accessToken = access;
    // ignore: avoid_print
    print("accessToken = $accessToken");
    notifyListeners();
  }

  void inputRefreshToken(String refresh) {
    print("refresh = $refresh");

    _refreshToken = refresh;
    // ignore: avoid_print
    print("refreshToken = $refreshToken");
    notifyListeners();
  }
}

