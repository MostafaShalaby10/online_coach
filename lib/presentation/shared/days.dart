import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_coach/presentation/shared/show_exercise.dart';
import 'package:online_coach/presentation/shared/show_food.dart';
import 'package:online_coach/shared/components/components.dart';

class Days extends StatelessWidget {
  final bool isExercise;
  final String uid;

  final bool isAdmin;

  const Days(
      {super.key,
      required this.isExercise,
      required this.uid,
      required this.isAdmin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              moveBackWord(context: context);
            },
            icon: const Icon(
              EvaIcons.arrowIosBackOutline,
              size: 30,
            ),
          ),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  moveForward(
                      context: context,
                      page: isExercise
                          ? ShowExercise(
                              day: (index + 1).toString(),
                              uid: uid,
                              isAdmin: isAdmin,
                            )
                          : ShowFood(
                              day: (index + 1).toString(),
                              uid: uid,
                              isAdmin: isAdmin,
                            ));
                },
                child: SizedBox(
                  height: 90.h,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: text(text: "Day ${index + 1} ", fontSize: 30)),
                ),
              );
            },
            separatorBuilder: (context, index) => verticalSpace(space: 20),
            itemCount: 7));
  }
}
