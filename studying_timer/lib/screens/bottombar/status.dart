import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:studying_timer/provider/signup.dart';
import 'package:studying_timer/screens/signup/bsm_webview.dart';

class Status extends StatelessWidget {
  const Status({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var signupData = Provider.of<SignupData>(context);
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          SizedBox(
            height: 76.h,
          ),
          Icon(
            Icons.account_circle,
            color: const Color(0xffD9D9D9),
            size: 97.h,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h, bottom: 130.h),
            child: Text(
              "${signupData.name} 님",
              style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const Webview()));
            },
            child: const Text("로그아웃"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
          ),
        ],
      ),
    ));
  }
}
