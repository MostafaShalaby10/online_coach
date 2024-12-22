import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_coach/logic/exercise/exercise_cubit.dart';
import 'package:online_coach/presentation/admin/add_exercise.dart';
import 'package:online_coach/shared/components/components.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ShowExercise extends StatelessWidget {
  final String day;
  final bool isAdmin;

  final String uid;

  const ShowExercise(
      {super.key, required this.uid, required this.day, required this.isAdmin});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return ExerciseCubit()..getExerciseCubit(userId: uid, day: day);
      },
      child: BlocConsumer<ExerciseCubit, ExerciseState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(),
              body: ConditionalBuilder(
                  condition: state is! LoadingGetExerciseState,
                  builder: (context) => Column(
                        children: [
                          Image(image: AssetImage("assets/img_1.png")) ,
                          verticalSpace(space: 20),
                          if (ExerciseCubit.get(context)
                              .exerciseData
                              .isNotEmpty)
                            Expanded(
                              child: ListView.separated(
                                  itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                          decoration: BoxDecoration(
                                              color: HexColor("#292929"),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      text(
                                                          text: ExerciseCubit.get(
                                                                      context)
                                                                  .exerciseData[0]
                                                              [index]["label"],
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      text(fontColor: Colors.grey,
                                                          fontWeight: FontWeight.w400,
                                                          text:
                                                              'Set : ${ExerciseCubit.get(context).exerciseData[0][index]["Set"]}   .     REPS : ${ExerciseCubit.get(context).exerciseData[0][index]["reps"]}'),
                                                    ],
                                                  ),
                                                ),
                                                IconButton(
                                                    onPressed: () {
                                                      launchUrlString(
                                                          ExerciseCubit.get(
                                                                      context)
                                                                  .exerciseData[0]
                                                              [index]["link"]);
                                                    },
                                                    icon: CircleAvatar(
                                                     backgroundColor: Colors.grey,
                                                      child: const Icon(

                                                        FontAwesomeIcons.circlePlay,
                                                        color: Colors.white,
                                                        size: 24,
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),
                                  ),
                                  separatorBuilder: (context, index) =>
                                     verticalSpace(space: 10) ,
                                  itemCount: ExerciseCubit.get(context)
                                      .exerciseData[0]
                                      .length),
                            ),
                          if (ExerciseCubit.get(context).exerciseData.isEmpty)
                            Center(
                                child: text(
                                    text:
                                        "There is no exercises yet\n coming soon!!",
                                    fontSize: 25,
                                    fontColor: Colors.grey)),
                          if (isAdmin)
                            defaultButton(context,
                                label: "Add an Exercise",
                                fontSize: 20, function: () {
                              moveForward(
                                  context: context,
                                  page: AddExercise(
                                    uid: uid,
                                    day: day,
                                  ));
                            }),
                        ],
                      ),
                  fallback: (context) =>
                      const Center(child: CircularProgressIndicator())),
            );
          },
          listener: (context, state) {}),
    );
  }
}
