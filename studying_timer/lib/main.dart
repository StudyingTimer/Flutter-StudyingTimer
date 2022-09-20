import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:studying_timer/common/common.dart';
import 'package:studying_timer/provider/emphasis.dart';
import 'package:studying_timer/provider/subjectlist.dart';
import 'package:studying_timer/screens/signup/login.dart';
import 'package:studying_timer/screens/signup/start_signup.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<Emphaisis>(
            create: (_) => Emphaisis(),
          ),
          ChangeNotifierProvider<SubjectList>(create: (_) => SubjectList()),
        ],
        child: ScreenUtilInit(
            designSize: const Size(360, 800),
            builder: (BuildContext context, Widget? child) => const MaterialApp(
                  title: 'StudyingTimer',
                  localizationsDelegates: [
                    GlobalMaterialLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  supportedLocales: [Locale('ko', 'KR')],
                  locale: Locale('ko'),
                  debugShowCheckedModeBanner: false,
                  home: Start(),
                )));
  }
}

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 270.h,
            ),
            Icon(
              Icons.play_arrow_outlined,
              size: 120.h,
              color: CommonColor.orange,
            ),
            SizedBox(
              height: 30.h,
            ),
            Material(
              child: Text(
                "공부, 혼자 하지 말고 열품타에서 함께 하세요!",
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 150.h,
            ),
            // ignore: sort_child_properties_last
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 5.h),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Start_signup()));
                },
                // ignore: sort_child_properties_last
                child: Text(
                  "새로 시작하기",
                  style: TextStyle(
                      fontSize: 15.sp,
                      color: CommonColor.orange,
                      fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  minimumSize: Size(double.infinity, 45.h),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1.0, color: CommonColor.orange),
                      borderRadius: BorderRadius.circular(20.h)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login()));
                },
                // ignore: sort_child_properties_last
                child: Text(
                  "로그인",
                  style: TextStyle(
                      fontSize: 15.sp,
                      color: CommonColor.orange,
                      fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  minimumSize: Size(double.infinity, 45.h),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1.0, color: CommonColor.orange),
                      borderRadius: BorderRadius.circular(20.h)),
                ),
              ),
            ),
            SizedBox(
              height: 55.h,
            ),
            Text(
              "Pallo",
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
