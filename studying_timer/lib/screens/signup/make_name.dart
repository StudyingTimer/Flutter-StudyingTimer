import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studying_timer/common/common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studying_timer/provider/signup.dart';
import 'package:studying_timer/screens/bottombar/bottom.dart';
import 'package:studying_timer/screens/bottombar/home.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

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

  void postequest(var signupData) async {
    print("실행됨");
    String url = 'http://localhost:8080/person/signUp';
    http.Response response = await http.post(Uri.parse(url),
        body: <String, String>{
          "email": signupData.name,
          "password": signupData.id,
          "nickname": signupData.pw
        });
    print(response.body);
    print('실행되었습ㄴ디ㅏ');
    print(response.statusCode);
    if (response.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MyPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
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
                            postequest(signupData);
                            
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
