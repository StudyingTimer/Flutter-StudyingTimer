import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:studying_timer/common/common.dart';
import 'package:studying_timer/model/rankingmodel.dart';
import 'package:studying_timer/widget/ranklist.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class Rank extends StatefulWidget {
  const Rank({Key? key}) : super(key: key);

  @override
  State<Rank> createState() => _RankState();
}

class _RankState extends State<Rank> {
  List<RankingModel> _rankList = <RankingModel>[];
  bool close = false;
  NumberFormat formatter = NumberFormat("00");

  @override
  void initState() {
    super.initState();
    _rankList.clear();
    _postRequest();
    setState(() {
      
    });
  }

  _postRequest() async {
    var parsingData;
    setState(() {
      close = true;
    });
    print("postrequest 실행");
    String url =
        'http://Java-Project-StudyTimer.ap-northeast-2.elasticbeanstalk.com/ranking/all';
    http.Response response = await http.get(Uri.parse(url));
    int statuscode = response.statusCode;
    if (statuscode == 200) {
      var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
      print("parsingData = $parsingData");
      if (parsingData["length"] == 0) {
        print("값이 없습니다");
      } else {
        for (int i = 0; i < parsingData["length"]; i++) {
          String name = parsingData["list"][i]["name"];
          String nickname = parsingData["list"][i]["nickname"];
          int hour = parsingData["list"][i]["studyHour"];
          int minute = parsingData["list"][i]["studyMinute"];
          int second = parsingData["list"][i]["studySecond"];
          _rankList.add(RankingModel(name, nickname, hour, minute, second));
        }
        setState(() {
          close = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: close
          ? Center(
              child: SpinKitHourGlass(color: CommonColor.orange),
            )
          : SingleChildScrollView(
              child: Center(
                child: SafeArea(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "LEADERBOARD",
                            style: TextStyle(
                                fontSize: 23.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Container(
                        width: double.infinity,
                        height: 30.w,
                        margin: EdgeInsets.only(left: 20.w, right: 20.w),
                        decoration: BoxDecoration(
                          color: CommonColor.orange,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 15.w,
                            ),
                            Text(
                              "Rank",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 45.w,
                            ),
                            Text(
                              "User",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 110.w,
                            ),
                            Text(
                              "Time",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      RankList(
                        ranking: _rankList,
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
