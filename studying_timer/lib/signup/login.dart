import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studying_timer/common/common.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final _pwController = TextEditingController();
    String pw = '';

    final _emailController = TextEditingController();
    String email = '';
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 25.h,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.w),
                child: Text(
                  "계정",
                  style: TextStyle(fontSize: 15.sp, color: CommonColor.orange),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 28.w, right: 28.w, top: 10.h),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: '이메일 입력',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 5),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 28.w, right: 28.w),
                child: TextField(
                  controller: _pwController,
                  decoration: const InputDecoration(
                    labelText: '비밀번호 입력',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 5),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.h, left: 28.w, right: 28.w),
                child: ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: CommonColor.orange,
                    minimumSize: Size(double.infinity, 40.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.h)),
                  ),
                  child: Text(
                    "로그인",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 108.w, right: 108.w, top: 15.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "계정 찾기",
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600),
                    ),
                    Text("비밀번호 찾기",
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.w, right: 30.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 130.w,
                      height: 0.5.h,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 7.w,
                    ),
                    Text(
                      "또는",
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 7.w,
                    ),
                    Container(
                      width: 130.w,
                      height: 0.5.h,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 28.w, right: 28.w, top: 50.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "images/google.png",
                      scale: 8.r,
                    ),
                    Image.asset(
                      "images/facebook.png",
                      scale: 26.r,
                    ),
                    Image.asset(
                      "images/kakao.png",
                      scale: 90.r,
                    ),
                    Image.asset(
                      "images/naver.png",
                      scale: 18.r,
                    ),
                    Image.asset(
                      "images/apple.png",
                      scale: 120.r,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
