import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_coach/logic/exercise/exercise_cubit.dart';
import 'package:online_coach/presentation/admin/add_exercise.dart';
import 'package:online_coach/presentation/admin/add_food.dart';
import 'package:online_coach/shared/components/components.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowExercise extends StatelessWidget {
  final String day;
  final bool isAdmin ;

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
              body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ConditionalBuilder(
                    condition: state is! LoadingGetExerciseState,
                    builder: (context) => Column(
                          children: [
                            if (ExerciseCubit.get(context).exerciseData.isNotEmpty)
                              Expanded(
                                child: ListView.separated(
                                    itemBuilder: (context, index) => Column(
                                          children: [
                                            text(
                                                text: ExerciseCubit.get(context)
                                                        .exerciseData[0][index]
                                                    ["label"]),
                                            text(
                                                text: ExerciseCubit.get(context)
                                                        .exerciseData[0][index]
                                                    ["times"]),
                                            text(
                                                text: ExerciseCubit.get(context)
                                                        .exerciseData[0][index]
                                                    ["link"]),
                                          ],
                                        ),
                                    separatorBuilder: (context, index) =>
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 1.h,
                                          color: Colors.black,
                                        ),
                                    itemCount: ExerciseCubit.get(context)
                                        .exerciseData[0]
                                        .length),
                              ),
                            if (ExerciseCubit.get(context).exerciseData.isEmpty)
                              Center(child: text(text: "There is no exercises yet\n coooming soon!!" , fontSize: 25 , fontColor: Colors.green)),
                            if(isAdmin)
                            Center(
                                child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: defaultButton(
                                        label: "Add an Exercise",
                                        fontSize: 20,
                                        function: () {
                                          moveForward(
                                              context: context,
                                              page: AddExercise(
                                                uid: uid,
                                                day: day,
                                              ));
                                        }))),
                          ],
                        ),
                    fallback: (context) =>
                        const Center(child: CircularProgressIndicator())),
              ),
            );
          },
          listener: (context, state) {}),
    );
  }
}
