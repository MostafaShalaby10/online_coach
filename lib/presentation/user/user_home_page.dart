import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_coach/logic/personal_data/personal_data_cubit.dart';
import 'package:online_coach/presentation/shared/days.dart';
import 'package:online_coach/presentation/shared/show_supplements.dart';
import 'package:online_coach/presentation/user/personal_data/personal_data.dart';
import 'package:online_coach/presentation/user/settings.dart';
import 'package:online_coach/presentation/user/tips_page.dart';
import 'package:online_coach/shared/components/components.dart';
import 'package:online_coach/shared/shared_preferences/shared_preferences.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonalDataCubit()
        ..getPersonalDataCubit(userId: SharedPrefs.getData(key: "UID")),
      child: BlocConsumer<PersonalDataCubit, PersonalDataState>(
          builder: (context, state) {
            return Scaffold(

              appBar: AppBar(
                centerTitle: true,
                title: text(text: "Welcome", fontColor: Colors.white),
                backgroundColor: Colors.black,
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                        onPressed: () {
                          moveForward(context: context, page: const Settings());
                        },
                        icon: const Icon(Icons.settings)),
                  )
                ],
              ),
              backgroundColor: Colors.black,
              body: ConditionalBuilder(
                  condition: state is! LoadingGetPersonalDataState,
                  builder: (context) => Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (PersonalDataCubit.get(context)
                                    .userPersonalData!
                                    .isEmpty)
                                  homePageCard(context, function: () {
                                    moveForward(
                                        context: context,
                                        page: const PersonalData());
                                  },
                                      mainText: "Your Data",
                                      color: HexColor("#CDFB47"),
                                      description:
                                          "Enter your data to set the exercise and diet",
                                      image: "assets/personal_data.png",
                                      imageAlignment: Alignment.centerRight,
                                      textAlignment: Alignment.centerLeft,
                                      rightPadding: 0,
                                      leftPadding: 20),
                                homePageCard(context, function: () {
                                  moveForward(
                                      context: context, page: const TipsPage());
                                },
                                    mainText: "Tips",
                                    color: HexColor("#CDFB47"),
                                    description:
                                        "Use these tips in your daily life for better health",
                                    image: "assets/tips_icon.png",
                                    imageAlignment: Alignment.centerLeft,
                                    textAlignment: Alignment.centerRight,
                                    rightPadding: 0,
                                    leftPadding: 0),
                                homePageCard(context, function: () {
                                  moveForward(
                                      context: context,
                                      page: Days(
                                        isExercise: true,
                                        uid: SharedPrefs.getData(key: "UID"),
                                        isAdmin: false,
                                      ));
                                },
                                    mainText: "Exercise",
                                    color: HexColor("#F6A010"),
                                    description:
                                        "This is the exercises for the current week",
                                    image: "assets/img.png",
                                    imageAlignment: Alignment.centerRight,
                                    textAlignment: Alignment.centerLeft,
                                    rightPadding: 0,
                                    leftPadding: 20),
                                homePageCard(context, function: () {
                                  moveForward(
                                      context: context,
                                      page: Days(
                                        isExercise: false,
                                        uid: SharedPrefs.getData(key: "UID"),
                                        isAdmin: false,
                                      ));
                                },
                                    mainText: "Food",
                                    color: HexColor("#29BFC9"),
                                    description:
                                        "This is your diet for the current week",
                                    image: "assets/foodImg.png",
                                    imageAlignment: Alignment.centerLeft,
                                    textAlignment: Alignment.centerRight,
                                    rightPadding: 0,
                                    leftPadding: 0),
                                homePageCard(context, function: () {
                                  moveForward(
                                      context: context,
                                      page: ShowSupplements(
                                          uid: SharedPrefs.getData(key: "UID"),
                                          isAdmin: false));
                                },
                                    mainText: "Supplements",
                                    color: HexColor("#FF805E"),
                                    description: "This is your supplements",
                                    image: "assets/supplements.png",
                                    imageAlignment: Alignment.centerRight,
                                    textAlignment: Alignment.centerLeft,
                                    rightPadding: 0,
                                    leftPadding: 20),
                              ],
                            ),
                          ),
                        ),
                      ),
                  fallback: (context) =>
                      const Center(child: CircularProgressIndicator())),
            );
          },
          listener: (context, state) {}),
    );
  }
}
