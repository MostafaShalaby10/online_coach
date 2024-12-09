import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_coach/logic/authentication/authentication_cubit.dart';
import 'package:online_coach/presentation/admin/add_exercise.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:online_coach/presentation/admin/add_user.dart';
import 'package:online_coach/presentation/admin/admin_home_page.dart';
import 'package:online_coach/presentation/authentication/login.dart';
import 'package:online_coach/presentation/user/personaldata/personal_data.dart';
import 'package:online_coach/presentation/user/user_home_page.dart';
import 'package:online_coach/shared/shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPrefs.init();
  if(SharedPrefs.getData(key: "type")=="admin")
    {
      runApp( MyApp(start:const AdminHomePage(),));

    }else if(SharedPrefs.getData(key: "type")=="user"){
    runApp( MyApp(start: const Homepage(),));

  }else
    {
      runApp( MyApp(start: const Login(),));

    }
}

class MyApp extends StatelessWidget {
  final Widget start ;
   MyApp({super.key, required this.start});

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
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            centerTitle: true,
            elevation: 10,
            surfaceTintColor: Colors.white,
            shadowColor: Colors.black,
          ),
          // background color for app
          scaffoldBackgroundColor: Colors.white,
          // font family for the app
          textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
            bodyMedium:
                GoogleFonts.alkalami(textStyle: textTheme.bodyMedium),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const AdminHomePage(),
      ),
    );
  }
}
