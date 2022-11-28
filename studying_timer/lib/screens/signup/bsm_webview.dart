import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studying_timer/common/common.dart';
import 'package:studying_timer/provider/emphasis.dart';
import 'package:studying_timer/screens/bottombar/bottom.dart';
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

  _postRequest(var emphaisis) async {
    var parsingData;
    print("code");
    print("postrequest 실행");
    String url =
        'http://study-timer-aws.ap-northeast-2.elasticbeanstalk.com/student/oauth/$code';
    http.Response response = await http.post(Uri.parse(url));
    int statuscode = response.statusCode;
    print(statuscode);
    if (statuscode == 200) {
      var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
      print("parsingData = $parsingData");
      accessToken = parsingData['token'];

      // ignore: avoid_print
      print("22222222222222222221222222222222222222222222222222222222");
      // ignore: avoid_print
      print(accessToken);
      emphaisis.inputaccesstoken(accessToken);
      if (parsingData['student']) {
        // ignore: use_build_context_synchronously
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const MyPage()));
      } else {
        // ignore: use_build_context_synchronously
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const Make_Name()));
      }

      // return parsingData;
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      toastmessage1();
    }
  }

  @override
  Widget build(BuildContext context) {
    var emphaisis = Provider.of<Emphaisis>(context);
    return Scaffold(
      body: close
          ? Center(child: SpinKitWave(color: CommonColor.orange))
          : WebView(
              initialUrl:
                  'https://auth.bssm.kro.kr/oauthhttps://auth.bssm.kro.kr/oauth?clientId=5f034939&redirectURI=http://localhost:3000/oauth',
              javascriptMode: JavascriptMode.unrestricted,
              navigationDelegate: (NavigationRequest request) {
                if (request.url.contains("?code=")) {
                  setState(() {
                    code = request.url.split("?code=")[1];
                    close = true;
                    print(code);
                  });
                  _postRequest(emphaisis);
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
