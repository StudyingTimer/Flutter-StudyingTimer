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
  final myController = TextEditingController();
  late String formatDate1 = DateFormat('MM. dd. ').format(now);
  late String formatData2 = DateFormat('E', 'ko').format(now);
  int buttonleft = 90;
  int buttonright = 90;
  int buttontop = 380;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
              Padding(
                padding: EdgeInsets.only(left: 150.w, top: 397.h),
                child: TextField(
                  controller: myController,
                  autofocus: ispressed ? true : false,
                  style: TextStyle(fontSize: 15.sp, color: Colors.black),
                  textAlign: TextAlign.start,
                  cursorColor: Colors.black.withOpacity(0.4),
                  textAlignVertical: TextAlignVertical.center,
                  maxLength: 20,
                  decoration: InputDecoration(
                    counterText: "",
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 19.sp,
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    ispressed = !ispressed;
                  });
                },
                child: AnimatedPadding(
                  padding: EdgeInsets.only(
                      left: ispressed ? 23.w : 90.w,
                      right: ispressed ? 23.w : 90.w,
                      top: buttontop.h),
                  duration: const Duration(microseconds: 240000),
                  child: AnimatedContainer(
                    duration: const Duration(microseconds: 240000),
                    width: double.infinity,
                    height: 60.h,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5.w, color: Colors.black),
                        borderRadius: BorderRadius.circular(30.r),
                        color: ispressed ? Colors.white : Colors.black),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    ispressed = !ispressed;
                  });
                },
                child: AnimatedPadding(
                    duration: const Duration(microseconds: 160000),
                    padding: EdgeInsets.only(
                        left: ispressed ? 300.w : 125.w, top: 398.h),
                    child: AnimatedContainer(
                      duration: const Duration(microseconds: 150000),
                      child: Icon(
                        Icons.add,
                        color: ispressed ? Colors.black : Colors.white,
                        size: 23.h,
                      ),
                    )),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    ispressed = !ispressed;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 154.w, top: 401.h),
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
          )),
    );
  }
}
