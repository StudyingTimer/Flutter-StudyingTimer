import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studying_timer/common/common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studying_timer/provider/emphasis.dart';
import 'package:studying_timer/provider/signup.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:studying_timer/screens/loading.dart';

class Make_Name extends StatefulWidget {
  const Make_Name({Key? key}) : super(key: key);

  @override
  State<Make_Name> createState() => _Make_NameState();
}

class _Make_NameState extends State<Make_Name> {
  final int maxLength = 11;
  String textValue = "";
  final myController = TextEditingController();
  String name = "";

  void toastmessage() {
    Fluttertoast.showToast(
        msg: "닉네임을 입력해주세요",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.sp);
  }

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
  };

  void postequest(var emphaisis) async {
    print("실행됨");
    String url =
        'http://Java-Project-StudyTimer.ap-northeast-2.elasticbeanstalk.com/student/signUp';

    print(emphaisis.accessToken.runtimeType);
    print(myController.text.runtimeType);
    http.Response response = await http.post(Uri.parse(url),
        headers: headers,
        body: jsonEncode(<String, String>{
          "token": emphaisis.accessToken,
          "nickname": myController.text,
        }));
    print(response.body);
    print('실행되었습ㄴ디ㅏ');
    print(response.statusCode);
    if (response.statusCode == 200) {
      var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
      print(parsingData);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Loading(accessToken: emphaisis.accessToken,)));
    }
  }

  @override
  Widget build(BuildContext context) {
    var emphaisis = Provider.of<Emphaisis>(context);
    var signupData = Provider.of<SignupData>(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: CommonColor.orange,
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                )),
            backgroundColor: CommonColor.orange,
            title: Text(
              "닉네임 만들기",
              style: TextStyle(
                  fontSize: 17.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ),
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 70.h,
                ),
                Text(
                  "${textValue.length} / $maxLength Bytes",
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                TextField(
                  controller: myController,
                  autofocus: true,
                  style: TextStyle(fontSize: 19.sp, color: Colors.white),
                  textAlign: TextAlign.center,
                  cursorColor: Colors.blue,
                  textAlignVertical: TextAlignVertical.center,
                  maxLength: maxLength,
                  onChanged: (value) {
                    setState(() {
                      textValue = value;
                    });
                  },
                  decoration: InputDecoration(
                      counterText: "",
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 19.sp,
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: const EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "사용하실 닉네임을 입력해주세요"),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 115.w, right: 115.w, top: 35.w),
                  child: ElevatedButton(
                    onPressed: () {
                      if (myController.text == "") {
                        toastmessage();
                      } else {
                        setState(() {
                          setState(() {
                            name = myController.text;
                            print(name);
                            signupData.inputName(name);
                            postequest(emphaisis);
                          });
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        minimumSize: Size(double.infinity, 55.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r))),
                    child: Text(
                      "완료",
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: CommonColor.orange,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
