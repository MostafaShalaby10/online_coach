import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            moveBackWord(context: context);
          },
          icon: const Icon(
            FontAwesomeIcons.arrowLeft,
            size: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: 7,
            itemBuilder: (BuildContext ctx, index) {
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
                child: Card(
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  color: HexColor("#FF805E"),
                  child: Center(
                      child: text(text: "Day ${index + 1}", fontSize: 20)),
                ),
              );
            }),
      ),
    );
  }
}
