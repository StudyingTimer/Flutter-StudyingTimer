import 'package:flutter/material.dart';
import 'package:studying_timer/common/common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  var firstOpacity = 1.0;
  var secondOpacity = 0.0;
  var thirdOpacity = 0.0;

  bool grade1 = false;
  bool grade2 = false;
  bool grade3 = false;

  bool class1 = false;
  bool class2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(null),
        backgroundColor: CommonColor.orange,
        title: Text(
          "카테고리 선택",
          style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white,
              fontWeight: FontWeight.w500),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text("완료",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white,
                  )))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                AnimatedOpacity(
                  opacity: firstOpacity,
                  duration: const Duration(microseconds: 100000),
                  child: Column(
                    children: [
                      Text(
                        "당신의 학년을 클릭해주세요",
                        style: TextStyle(
                            fontSize: 20.sp, color: const Color(0xff8A8383)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                firstOpacity = 0;
                                secondOpacity = 1;

                                grade1 = true;
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                minimumSize: Size(80.w, 40.h),
                                primary: grade1
                                    ? const Color(0xff2A98EE)
                                    : const Color(0xffD9D9D9),
                              ),
                              child: Text(
                                "고등학교 1학년",
                                style: TextStyle(
                                    color: grade1
                                        ? Colors.white
                                        : const Color(0xff686060),
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                firstOpacity = 0;
                                secondOpacity = 1;
                                grade2 = true;
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                minimumSize: Size(80.w, 40.h),
                                primary: grade2
                                    ? const Color(0xff2A98EE)
                                    : const Color(0xffD9D9D9),
                              ),
                              child: Text(
                                "고등학교 2학년",
                                style: TextStyle(
                                    color: grade2
                                        ? Colors.white
                                        : const Color(0xff686060),
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                firstOpacity = 0;
                                secondOpacity = 1;

                                grade3 = true;
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                minimumSize: Size(80.w, 40.h),
                                primary: grade3
                                    ? const Color(0xff2A98EE)
                                    : const Color(0xffD9D9D9),
                              ),
                              child: Text(
                                "고등학교 3학년",
                                style: TextStyle(
                                    color: grade3
                                        ? Colors.white
                                        : const Color(0xff686060),
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                AnimatedOpacity(
                  opacity: firstOpacity,
                  duration: const Duration(microseconds: 100000),
                  child: Column(
                    children: [
                      Text(
                        "당신의 학과를 클릭해주세요",
                        style: TextStyle(
                            fontSize: 20.sp, color: const Color(0xff8A8383)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                secondOpacity = 0;
                                thirdOpacity = 1;

                                class1 = true;
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                minimumSize: Size(80.w, 40.h),
                                primary: grade1
                                    ? const Color(0xff2A98EE)
                                    : const Color(0xffD9D9D9),
                              ),
                              child: Text(
                                "SW개발과",
                                style: TextStyle(
                                    color: class1
                                        ? Colors.white
                                        : const Color(0xff686060),
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                secondOpacity = 0;
                                thirdOpacity = 1;
                                class2 = true;
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                minimumSize: Size(80.w, 40.h),
                                primary: class2
                                    ? const Color(0xff2A98EE)
                                    : const Color(0xffD9D9D9),
                              ),
                              child: Text(
                                "임베디드 SW",
                                style: TextStyle(
                                    color: class2
                                        ? Colors.white
                                        : const Color(0xff686060),
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                AnimatedOpacity(
                  opacity: thirdOpacity,
                  duration: const Duration(microseconds: 100000),
                  child: Text("완료 버튼을 눌러주세요!",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
