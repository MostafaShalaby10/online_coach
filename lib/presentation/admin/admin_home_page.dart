import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_coach/presentation/admin/add_user.dart';
import 'package:online_coach/presentation/admin/all_users.dart';
import 'package:online_coach/presentation/authentication/login.dart';
import 'package:online_coach/shared/components/components.dart';
import 'package:online_coach/shared/shared_preferences/shared_preferences.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              SharedPrefs.removeData(key: "UID");
              SharedPrefs.removeData(key: "type");
              moveForwardAndRemove(context: context, page: const Login());
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  text(text: "Logout", fontColor: Colors.red),
                  const Icon(
                    FontAwesomeIcons.signOut,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              homePageCard(context,
                  mainText: "All users",
                  description:
                  "See all users, their data, add exercise , diet and supplements ",
                  image: "assets/img.png",
                  imageAlignment: Alignment.centerRight,
                  textAlignment: Alignment.centerLeft,
                  rightPadding: 0,
                  color: Colors.teal,
                  function: () {
                    moveForward(context: context, page: const AllUsers());

                  },
                  leftPadding: 10) ,
              verticalSpace(space: 15),
              homePageCard(context,
                  mainText: "Add client",
                  description:
                  "Add new client",
                  image: "assets/img.png",
                  imageAlignment: Alignment.centerLeft,
                  textAlignment: Alignment.centerRight,
                  rightPadding: 10,
                leftPadding: 0 ,
                  color: Colors.cyan,
                  function: () {
                    moveForward(
                        context: context, page: const Adduser());
                  },
                 ) ,

            ],
          ),
        ),
      ),
    );
  }
}
