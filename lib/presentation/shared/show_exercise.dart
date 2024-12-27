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
import 'package:online_coach/shared/constants/constants.dart';
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
              backgroundColor: Colors.grey[900],
              appBar: AppBar(
                backgroundColor: Colors.grey[900],
              ),
              body: ConditionalBuilder(
                  condition: state is! LoadingGetExerciseState,
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                          children: [
                            if (ExerciseCubit.get(context)
                                .exerciseData
                                .isNotEmpty)
                              Expanded(
                                child: Column(
                                  children: [
                                    Image(image: NetworkImage("https://s3-alpha-sig.figma.com/img/751f/89e9/da95373f6eb2271dac57bcf9fb89f71f?Expires=1736121600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Z1M1lZIGvXDnycQHsmgKQAdtkB2RS857lx3Obbu7mJM-mbr6P8jh8nimOZvMlZmgfwiuHkpVs3~7avwfH32Pr8iOYy0sf4lbVFxPxTcNH7yz98LOc4EedO74WUVpl9NTjUu6IC2lXvU3EM5jSMLAwsoYyKJEkUJs-SZvOyePBR4Tx~hkqdNvyHdVpL0VCgCXF-jyC-VNA8OwNJazKGEFDAwvWiTfmQovnvDT2kLLc6xdmU4NDEmKRPQGKrd0q4-7vr39DzEkmmBXn-LiQdoZV5zgyP4DJvc-oL~vq1BsedBgK-KCzEsjfIPNBFutEN32ogblua0qG~KFHga4FywlaA__")),
                                    verticalSpace(space: 20),
                                    Expanded(
                                      child: ListView.separated(
                                          itemBuilder: (context, index) => Padding(
                                                padding: const EdgeInsets.all(10.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: HexColor("#292929"),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              text(
                                                                  text: ExerciseCubit.get(
                                                                                  context)
                                                                              .exerciseData[
                                                                          0][index]
                                                                      ["label"],
                                                                  fontSize: 24,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                              text(
                                                                  fontColor:
                                                                      Colors.grey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
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
                                                                      [
                                                                      index]["link"]);
                                                            },
                                                            icon: CircleAvatar(
                                                              backgroundColor:
                                                                  Colors.grey,
                                                              child: const Icon(
                                                                FontAwesomeIcons
                                                                    .circlePlay,
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
                                              verticalSpace(space: 10),
                                          itemCount: ExerciseCubit.get(context)
                                              .exerciseData[0]
                                              .length),
                                    ),
                                  ],
                                ),
                              ),
                            if (ExerciseCubit.get(context).exerciseData.isEmpty)
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                      image: NetworkImage(
                                          "https://img.freepik.com/free-psd/lying-down-watching-movies-home-3d-illustration_1419-2560.jpg?t=st=1735255085~exp=1735258685~hmac=41e4cc0ba502404ceb06ec0afb4ef2435f353087805de89f7404edc1df9ea25b&w=740")),
                                  Center(
                                    child: Expanded(
                                      child: text(
                                          text:
                                              "There is no exercises yet\n Waittttt!!",
                                          fontSize: 25,
                                          fontColor: secondaryColor),
                                    ),
                                  ),
                                ],
                              ),
                            if (isAdmin)
                              defaultButton(context,
                                  label: "Add Exercise",
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
                  ),
                  fallback: (context) =>
                      const Center(child: CircularProgressIndicator())),
            );
          },
          listener: (context, state) {}),
    );
  }
}
