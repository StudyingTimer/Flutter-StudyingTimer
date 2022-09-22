import 'package:flutter/material.dart';
import 'package:studying_timer/common/common.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  var now = DateTime.now();
  late String formatDate1 = DateFormat('MM. dd. ').format(now);
  late String formatData2 = DateFormat('E', 'ko').format(now);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        shape: Border(
            bottom:
                BorderSide(color: Colors.white.withOpacity(0.5), width: 0.5.h)),
        backgroundColor: Colors.transparent,
        title: Text(
          // "9. 08. (목)",
          "${formatDate1}(${formatData2})",
          style: TextStyle(fontSize: 25.sp, color: Colors.black),
        ),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 14.w),
                child: Text(
                  "To-do",
                  style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 1.h,
                color: Colors.black.withOpacity(0.3),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 40.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Material(
                      elevation: 2,
                      child: Container(
                        width: 140.w,
                        height: 180.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.r),
                                topRight: Radius.circular(10.r))),
                      ),
                    ),
                    Material(
                      elevation: 2,
                      child: Container(
                        width: 140.w,
                        height: 180.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.r),
                                topRight: Radius.circular(10.r))),
                      ),
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
