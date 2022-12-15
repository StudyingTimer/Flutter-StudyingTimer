import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studying_timer/common/common.dart';
import 'package:studying_timer/model/rankingmodel.dart';
import 'package:intl/intl.dart';

class RankList extends StatefulWidget {
  final List<RankingModel> ranking;
  const RankList({super.key, required this.ranking});

  @override
  State<RankList> createState() => _RankListState();
}

class _RankListState extends State<RankList> {
  List<Widget> makeRankPaper(BuildContext context, List<RankingModel> ranks) {
    List<Widget> results = [];
  NumberFormat formatter = NumberFormat("00");

    for (var i = 0; i < ranks.length; i++) {
      results.add(
        Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 13.h),
      child: Container(
        width: double.infinity,
        height: 75.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 2.h), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: 70.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${i+1}",
                      style: TextStyle(
                          color: CommonColor.orange,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(bottom: 5.h),
              child: SizedBox(
                width: 155.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 2.h, top: 6.h),
                      child: Text(
                        ranks[i].nickname,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      ranks[i].name,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              formatter.format(ranks[i].hour),
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              ":",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              formatter.format(ranks[i].minute),
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              ":",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              formatter.format(ranks[i].second),
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    )
      );
    }
    return results;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: makeRankPaper(context, widget.ranking)
    );
  }
}
