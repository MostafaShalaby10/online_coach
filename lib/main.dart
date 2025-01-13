import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:online_coach/presentation/authentication/login.dart';
import 'package:online_coach/presentation/shared/home_page.dart';
import 'package:online_coach/shared/shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);
  await Supabase.initialize(
    url: 'https://fxnkbcnmlsvvnmmpkeif.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ4bmtiY25tbHN2dm5tbXBrZWlmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzY3MjM1MDYsImV4cCI6MjA1MjI5OTUwNn0.Z5DTSMD4Z-4rcMQ3qwp0nsk3CbGCYtlYl6a20U0WfaE',
  );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPrefs.init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,DeviceOrientation.portraitDown  ]).then((value) {
    if (SharedPrefs.getData(key: "type") == "admin") {
      runApp(MyApp(
            start: Homepage(),
          ));
    } else if (SharedPrefs.getData(key: "type") == "user") {
      runApp(MyApp(
            start: Homepage(),
          ));
    } else {
      runApp(MyApp(
            start: Login(),
          ));
    }
  });
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
          appBarTheme: AppBarTheme(
            centerTitle: true,
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.grey[900],
            elevation: 0,
          ),
          // background color for app
          scaffoldBackgroundColor: Colors.grey[900],
          progressIndicatorTheme:
              ProgressIndicatorThemeData(color: Colors.white),
          // font family for the app
          textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
            bodyMedium: GoogleFonts.alkalami(
                textStyle: textTheme.bodyMedium, color: Colors.white),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: start,
      ),
    );
  }
}
