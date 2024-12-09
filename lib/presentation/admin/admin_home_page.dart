import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_coach/logic/userData/user_data_cubit.dart';
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
                    EvaIcons.logOut,
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
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: SizedBox(
                    width: 300.w,
                    height: 70.h,
                    child: defaultButton(
                        label: "All Users",
                        fontSize: 30,
                        function: () {
                          /* not finished*/
                       moveForward(context: context, page: const AllUsers()) ;
                        })),
              ),
              verticalSpace(space: 15),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: SizedBox(
                    width: 300.w,
                    height: 70.h,
                    child: defaultButton(
                        label: "Add User",
                        fontSize: 30,
                        function: () {
                          moveForward(
                              context: context, page: const Adduser());
                        })),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
