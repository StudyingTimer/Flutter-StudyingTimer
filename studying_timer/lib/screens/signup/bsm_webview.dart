import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studying_timer/common/common.dart';
import 'package:studying_timer/provider/emphasis.dart';
import 'package:studying_timer/provider/signup.dart';
import 'package:studying_timer/screens/bottombar/bottom.dart';
import 'package:studying_timer/screens/loading.dart';
import 'package:studying_timer/screens/signup/make_name.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Webview extends StatefulWidget {
  const Webview({Key? key}) : super(key: key);

  @override
  State<Webview> createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  bool close = false;
  bool postend = false;
  String code = "";
  String url = "https://bgit.bssm.kro.kr/oauth/bsm";
  String accessToken = "";
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  void toastmessage() {
    Fluttertoast.showToast(
        msg: "로그인 되었습니다",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.sp);
  }

  void toastmessage1() {
    Fluttertoast.showToast(
        msg: "에러가 발생했습니다",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.sp);
  }

  void toastmessage2() {
    Fluttertoast.showToast(
        msg: "회원가입 창으로 이동합니다",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.sp);
  }

  _postRequest(var emphaisis, var signup) async {
    var parsingData;

    print("code");
    print(code);
    print("postrequest 실행");
    String url =
        'http://java-project-studytimer.ap-northeast-2.elasticbeanstalk.com/student/oauth/$code';
    http.Response response = await http.get(Uri.parse(url));
    int statuscode = response.statusCode;

    print(statuscode);

    if (statuscode == 200) {
      var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
      print("parsingData = $parsingData");
      accessToken = parsingData['token'];
      signup.inputName(parsingData["name"]);

      // ignore: avoid_print
      print("22222222222222222221222222222222222222222222222222222222");
      // ignore: avoid_print
      print(accessToken);
      emphaisis.inputaccesstoken(accessToken);
      if (parsingData['student']) {
        toastmessage();

        // ignore: use_build_context_synchronously
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => Loading(accessToken: accessToken)));
      } else {
        toastmessage();
        // ignore: use_build_context_synchronously
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const Make_Name()));
      }

      // return parsingData;
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      toastmessage2();
    }
  }

  @override
  Widget build(BuildContext context) {
    var emphaisis = Provider.of<Emphaisis>(context);
    var signup = Provider.of<SignupData>(context);
    return Scaffold(
      body: close
          ? Center(child: SpinKitWave(color: CommonColor.orange))
          : WebView(
              initialUrl:
                  'https://auth.bssm.kro.kr/oauth?clientId=5f034939&redirectURI=http://localhost:3000/oauth',
              javascriptMode: JavascriptMode.unrestricted,
              navigationDelegate: (NavigationRequest request) {
                if (request.url.contains("?code=")) {
                  setState(() {
                    code = request.url.split("?code=")[1];
                    print("code : $code");
                    print("code1 : $code");
                    print("code2 : $code");
                    print("code3 : $code");
                    print("code4 : $code");
                    print("code5 : $code");
                    print("code6 : $code");
                    print("code7 : $code");
                    print("code8 : $code");
                    print("code9 : $code");
                    print("code10 : $code");
                    print("code11 : $code");
                    _postRequest(emphaisis, signup);
                    close = true;
                  });
                  // _postRequest(emphaisis);
                  emphaisis.bsmchange();
                  return NavigationDecision.prevent;
                } else if (request.url.contains(url)) {}

                return NavigationDecision.navigate;
              },
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
            ),
    );
  }
}
