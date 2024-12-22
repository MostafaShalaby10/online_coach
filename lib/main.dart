import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_coach/presentation/admin/admin_home_page.dart';
import 'package:online_coach/presentation/authentication/login.dart';
import 'package:online_coach/presentation/user/user_home_page.dart';
import 'package:online_coach/shared/shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPrefs.init();
  if (SharedPrefs.getData(key: "type") == "admin") {
    runApp(const MyApp(
      start: AdminHomePage(),
    ));
  } else if (SharedPrefs.getData(key: "type") == "user") {
    runApp(const MyApp(
      start: Homepage(),
    ));
  } else {
    runApp(const MyApp(
      start: Login(),
    ));
  }
}

class MyApp extends StatelessWidget {
  final Widget start;

  const MyApp({super.key, required this.start});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: ThemeData(

          appBarTheme:  AppBarTheme(
            iconTheme: const IconThemeData(
              color: Colors.white
            ),
            backgroundColor: Colors.black,
            centerTitle: true,
            elevation: 0,
            surfaceTintColor: Colors.black,
          ),
          // background color for app
          scaffoldBackgroundColor: HexColor("#000000"),
          primaryColor: Colors.white,
          // font family for the app
          textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
            bodyMedium: GoogleFonts.alkalami(textStyle: textTheme.bodyMedium , color: Colors.white) ,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: Login(),
      ),
    );
  }
}
