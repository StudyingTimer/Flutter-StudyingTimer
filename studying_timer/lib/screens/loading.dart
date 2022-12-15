import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studying_timer/common/common.dart';
import 'package:studying_timer/provider/emphasis.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:studying_timer/screens/bottombar/bottom.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  final String accessToken;
  const Loading({super.key, required this.accessToken});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  var emphasis;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      emphasis = Provider.of<Emphaisis>(context, listen: false);
    });
    getrequest();
    postrequest(emphasis);

    super.initState();
  }

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
  };

  void postrequest(var emphaisis) async {
    String url =
        'http://Java-Project-StudyTimer.ap-northeast-2.elasticbeanstalk.com/student/${widget.accessToken}';

    http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    if (response.statusCode == 200) {
      var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
      emphasis.inputTime(parsingData["studyHour"], parsingData["studyMinute"],
          parsingData["studySecond"]);
      // ignore: use_build_context_synchronously
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MyPage()));
    }
  }

  void getrequest() async {
    print("모든과목조회");
    
    print("모든과목조회1");
    print("모든과목조회2");
    String url =
        'http://java-project-studytimer.ap-northeast-2.elasticbeanstalk.com/allSubjects';

    http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    if (response.statusCode == 200) {
      var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
      print(parsingData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SpinKitWave(color: CommonColor.orange)),
    );
  }
}
