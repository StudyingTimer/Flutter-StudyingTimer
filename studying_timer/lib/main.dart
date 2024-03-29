import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:studying_timer/common/common.dart';
import 'package:studying_timer/provider/emphasis.dart';
import 'package:studying_timer/provider/signup.dart';
import 'package:studying_timer/provider/subjectlist.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:studying_timer/provider/todolist.dart';
import 'package:studying_timer/provider/token.dart';
import 'package:studying_timer/screens/signup/bsm_webview.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<Token>(
            create: (_) => Token()
          ),
          ChangeNotifierProvider<Emphaisis>(
            create: (_) => Emphaisis(),
          ),
          ChangeNotifierProvider<SignupData>(
            create: (_) => SignupData(),
          ),
          ChangeNotifierProvider<TodoLists>(
            create: (_) => TodoLists(),
          ),
          ChangeNotifierProvider<SubjectList>(
            create: (_) => SubjectList()
          ),
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
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 270.h,
            ),
            Image.asset(
              "images/logo.png",
              scale: 2.5.r,
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              "공부, 혼자 하지 말고 공뻑에서 함께 하세요!",
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 5.h,
            ),
            const Text(
              "(BSM 전용)",
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(
              height: 130.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => const MyPage()));

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Webview()));
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
                  backgroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 45.h),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1.0, color: CommonColor.orange),
                      borderRadius: BorderRadius.circular(20.h)),
                ),
              ),
            ),
            SizedBox(
              height: 115.h,
            ),
            Text(
              "Jo & Lee",
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
