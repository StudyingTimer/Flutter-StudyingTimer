import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studying_timer/common/common.dart';
import 'package:studying_timer/screens/signup/email.dart';
import 'package:studying_timer/screens/signup/login.dart';

// ignore: camel_case_types
class Start_signup extends StatefulWidget {
  const Start_signup({Key? key}) : super(key: key);

  @override
  State<Start_signup> createState() => _Start_signupState();
}

// ignore: camel_case_types
class _Start_signupState extends State<Start_signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
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
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "열정 품은 타이머",
                          style: TextStyle(
                              fontSize: 25.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "가입하기",
                          style: TextStyle(
                              fontSize: 25.sp,
                              color: CommonColor.orange,
                              fontWeight: FontWeight.w600),
                        ),
                      ]),
                ],
              ),
            ),
            SizedBox(
              height: 35.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 10.h),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Email()));
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.white,
                  minimumSize: Size(double.infinity, 60.h),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1.r, color: Colors.grey),
                      borderRadius: BorderRadius.circular(12.h)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 3.w,
                    ),
                    Icon(
                      Icons.mail,
                      color: Colors.grey,
                      size: 25.h,
                    ),
                    SizedBox(
                      width: 90.w,
                    ),
                    Text(
                      "이메일로 시작하기",
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 10.h),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Email()));
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.white,
                  minimumSize: Size(double.infinity, 60.h),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1.r, color: Colors.grey),
                      borderRadius: BorderRadius.circular(12.h)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 3.w,
                    ),
                    Image.asset(
                      "images/google.png",
                      scale: 13.r,
                    ),
                    SizedBox(
                      width: 100.w,
                    ),
                    Text(
                      "구글로 시작하기",
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 10.h),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Email()));
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.white,
                  minimumSize: Size(double.infinity, 60.h),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1.r, color: Colors.grey),
                      borderRadius: BorderRadius.circular(12.h)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 3.w,
                    ),
                    Image.asset(
                      "images/facebook.png",
                      scale: 38.r,
                    ),
                    SizedBox(
                      width: 75.w,
                    ),
                    Text(
                      "페이스북으로 시작하기",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 10.h),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Email()));
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.white,
                  minimumSize: Size(double.infinity, 60.h),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1.r, color: Colors.grey),
                      borderRadius: BorderRadius.circular(12.h)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "images/kakao.png",
                      scale: 120.r,
                    ),
                    SizedBox(
                      width: 85.w,
                    ),
                    Text(
                      "카카오로 시작하기",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 10.h),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Email()));
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.white,
                  minimumSize: Size(double.infinity, 60.h),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1.r, color: Colors.grey),
                      borderRadius: BorderRadius.circular(12.h)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 3.w,
                    ),
                    Image.asset(
                      "images/naver.png",
                      scale: 26.r,
                    ),
                    SizedBox(
                      width: 87.w,
                    ),
                    Text(
                      "네이버로 시작하기",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 10.h),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Email()));
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.white,
                  minimumSize: Size(double.infinity, 60.h),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1.r, color: Colors.grey),
                      borderRadius: BorderRadius.circular(12.h)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "images/apple.png",
                      scale: 145.r,
                    ),
                    SizedBox(
                      width: 90.w,
                    ),
                    Text(
                      "Apple로 로그인",
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "이미 계정이 있나요?",
                  style: TextStyle(
                    fontSize: 13.sp,
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()));
                    },
                    child: Text(
                      "로그인",
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: CommonColor.orange,
                          fontWeight: FontWeight.w600),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
