import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_coach/presentation/shared/show_exercise.dart';
import 'package:online_coach/presentation/shared/show_food.dart';
import 'package:online_coach/shared/components/components.dart';
import 'package:online_coach/shared/constants/constants.dart';

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
    List exerciseImages = [
      "https://img.freepik.com/free-photo/handsome-shirtless-man-with-stylish-hair-muscular-ectomorph-body-doing-exercises-with-dumbbells-dark-textured-background_613910-18438.jpg?t=st=1735251960~exp=1735255560~hmac=823609740af6a43bafa6fbedc40d3bf0fd00bf2aadb04ad8dc35456af8fd6f1b&w=1060",
      "https://img.freepik.com/free-photo/front-view-fit-shirtless-man-with-weights_23-2148700662.jpg?t=st=1735252042~exp=1735255642~hmac=cb9d5eb3db6625fd21ebdc69a19bea0fe42da8cabc9f44ab214af68318c7ed40&w=360",
      "https://img.freepik.com/free-photo/powerful-stylish-bodybuilder-with-tattoo-his-arm-doing-exercises-with-dumbbells-isolated-dark-background_613910-5209.jpg?t=st=1735252059~exp=1735255659~hmac=0551b7c2fa73d9a6b4036c82887dbb5682d8f47234d8027c0c094657668b22dc&w=996",
      "https://img.freepik.com/free-photo/fit-young-man-with-beautiful-torso-blue_155003-9444.jpg?t=st=1735252074~exp=1735255674~hmac=5f82fe7620575967323d5bc6c99067693527b72660dca07b2a2119301ce341fb&w=1060",
      "https://img.freepik.com/free-photo/smiling-attractive-bodybuilder-with-naked-torso-is-doing-leg-strechening-grey-background_613910-20873.jpg?t=st=1735252103~exp=1735255703~hmac=a881df8345c09859c17a38c34565a42d8122b6756c13c35a889a92960db6484c&w=360",
      "https://img.freepik.com/premium-photo/handsome-power-athletic-man-bodybuilder-fitness-muscular-body-dark-smoke-background-perfect-male-awesome-bodybuilder-tattoo-posing-hands-up-viktory_136403-1999.jpg?w=360",
      "https://img.freepik.com/free-photo/artistic-portrait-shirtless-muscular-male-with-burning-dumbbell_613910-7352.jpg?t=st=1735252146~exp=1735255746~hmac=aec01e12a0fc616ef426014662dc28f3d67eff34bf7bffce9ec21a11b009fc13&w=740",
    ];
    List foodImages=["https://img.freepik.com/premium-photo/bowl-buddha-chicken-broccoli-chickpeas-pumpkin-avocado-carrot-tomato-lettuce-plate-with-knife-fork_156140-4677.jpg?w=1060" ,
    "https://img.freepik.com/premium-photo/bowl-buddha-chicken-broccoli-chickpeas-pumpkin-avocado-carrot-tomato-lettuce-plate-with-knife-fork_156140-4711.jpg?w=1060" ,
    "https://img.freepik.com/free-photo/plate-with-keto-diet-food-cherry-tomatoes-chicken-breast-eggs-carrot-salad-with-arugula-spinach-keto-lunch-top-view_2829-16949.jpg?t=st=1735253483~exp=1735257083~hmac=8df8794c144401476c1b1c06615197d610a167bbbc4db7a080cfbc8a1d13ce2a&w=1060" ,
    "https://img.freepik.com/free-photo/plate-with-paleo-diet-food-boiled-eggs-avocado-cucumber-nuts-cherry-strawberries-paleo-breakfast-top-view_2829-17450.jpg?t=st=1735253191~exp=1735256791~hmac=e7b9604ff5d9252e656bcf486beec9319cee2f55b77b3b023c98b4041fa07d44&w=1060" ,
    "https://img.freepik.com/free-photo/healthy-vegetarian-balanced-food-concept-fresh-vegetable-salad-buddha-bowl_114579-7126.jpg?t=st=1735253232~exp=1735256832~hmac=cc5fe6e637532364c8e719a729a25692288afa2e62bf7392e8b23c8943298c8e&w=1060" ,
    "https://img.freepik.com/free-photo/plate-with-paleo-diet-food-boiled-eggs-avocado-cucumber-nuts-cherry-strawberries-paleo-breakfast-top-view_2829-17444.jpg?t=st=1735253268~exp=1735256868~hmac=a4c3c90bb60e4447d32bde71b95d9b79bde190e8506a020015a4d631d1d9afe3&w=1060" ,
    "https://img.freepik.com/free-photo/view-healthy-food-incased-pill-shaped-container_23-2151344842.jpg?t=st=1735253396~exp=1735256996~hmac=d279114415156fbd2d2197d165d1a6395bfd8058a823ac0302106ba1468dedf6&w=1060"];
    return Scaffold(
      appBar: AppBar(
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
      body: ListView.separated(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
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
              height: 170.h,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Image(
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      image: NetworkImage(isExercise?exerciseImages[index]:foodImages[index])),
                  Padding(
                    padding:  EdgeInsets.symmetric(
                        vertical: 10.h, horizontal: 20.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 72.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                                color: secondaryColor, width: 8),
                          ),
                          child: Center(
                              child: text(
                                  text: "${index + 1} /7",
                                  fontColor: Colors.white,
                                  fontSize: 20)),
                        ),
                        text(
                            text: "DAY ${index + 1}",
                            fontSize: 24,
                            fontWeight: FontWeight.w900)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        itemCount: 7,
        separatorBuilder: (context, index) => verticalSpace(space: 10),
      ),
    );
  }
}
