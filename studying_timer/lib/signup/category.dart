import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:studying_timer/common/common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
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
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Text(
                "학년 선택",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontSize: 14.sp,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
