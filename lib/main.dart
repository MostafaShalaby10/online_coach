import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:online_coach/presentation/authentication/login.dart';

import 'presentation/user/personaldata/personaldata.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme ;
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
          // theme: ThemeData(
          //   // background color for app
          //   scaffoldBackgroundColor: Colors.white,
          //   // font family for the app
          //   textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
          //     bodyMedium: GoogleFonts.alkalami(textStyle: textTheme.bodyMedium),
          //   ),
          // ),aas
       debugShowCheckedModeBanner: false,
        home: const Login(),
      ),
    );
  }
}
