import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_coach/presentation/user/tipspage.dart';
import 'package:online_coach/shared/components/components.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
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
                          label: "TIPS", fontSize: 30, function: () {
                            moveForward(context: context, page: const TipsPage());
                      })),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: SizedBox(
                      width: 300.w,
                      height: 70.h,
                      child: defaultButton(
                          label: "Exercises", fontSize: 30, function: () {})),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: SizedBox(
                      width: 300.w,
                      height: 70.h,
                      child: defaultButton(
                          label: "Food", fontSize: 30, function: () {})),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: SizedBox(
                      width: 300.w,
                      height: 70.h,
                      child: defaultButton(
                          label: "Supplements", fontSize: 30, function: () {})),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
