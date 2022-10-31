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
  bool ispressed = false;
  late String formatDate1 = DateFormat('MM. dd. ').format(now);
  late String formatData2 = DateFormat('E', 'ko').format(now);
  int buttonleft = 90;
  int buttonright = 90;
  int buttontop = 380;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: null,
        // AppBar(
        //   centerTitle: true,
        //   elevation: 0.0,
        //   shape: Border(
        //       bottom:
        //           BorderSide(color: Colors.white.withOpacity(0.5), width: 0.5.h)),
        //   backgroundColor: Colors.transparent,
        //   title: Text(
        //     // "9. 08. (목)",
        //     "${formatDate1}(${formatData2})",
        //     style: TextStyle(fontSize: 25.sp, color: Colors.black),
        //   ),
        //   actions: [
        //     Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Padding(
        //           padding: EdgeInsets.only(right: 14.w),
        //           child: Text(
        //             "To-do",
        //             style: TextStyle(
        //                 fontSize: 15.sp,
        //                 color: Colors.black.withOpacity(0.5),
        //                 fontWeight: FontWeight.w500),
        //           ),
        //         ),
        //       ],
        //     )
        //   ],
        // ),
        body: Stack(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  ispressed = !ispressed;
                });
              },
              child: AnimatedPadding(
                padding: EdgeInsets.only(
                    left: buttonleft.w, right: buttonright.w, top: buttontop.h),
                duration: const Duration(microseconds: 100000),
                child: Container(
                  width: double.infinity,
                  height: 55.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      color: Colors.black),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  ispressed = !ispressed;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 154.w, top: 397.h),
                child: AnimatedOpacity(
                    opacity: ispressed ? 0 : 1,
                    duration: const Duration(microseconds: 100000),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 15.h,
                    )),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  ispressed = !ispressed;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 154.w, top: 397.h),
                child: AnimatedOpacity(
                  opacity: ispressed ? 0 : 1,
                  duration: const Duration(microseconds: 100000),
                  child: Text(
                    "Add item",
                    style: TextStyle(fontSize: 13.5.sp, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
