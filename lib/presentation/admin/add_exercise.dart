import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_coach/logic/exercise/exercise_cubit.dart';
import 'package:online_coach/shared/components/components.dart';

class AddExercise extends StatelessWidget {
  final String uid;
  final String day;

  AddExercise({super.key, required this.uid, required this.day});

  final TextEditingController exerciseLabelController = TextEditingController();
  final TextEditingController exerciseSetController = TextEditingController();
  final TextEditingController exerciseRepsController = TextEditingController();
  final TextEditingController exerciseLinkController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ExerciseCubit()..getExerciseCubit(userId: uid, day: day),
      child:
          BlocConsumer<ExerciseCubit, ExerciseState>(builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: text(text: "Add Exercise"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textField(
                      type: TextInputType.text,
                      label: "Add exercise label",
                      prefixIcon: Icons.sports_gymnastics_outlined,
                      controller: exerciseLabelController),
                  verticalSpace(space: 10),
                  textField(
                      type: TextInputType.number,
                      label: "Add the Sets",
                      prefixIcon: Icons.numbers_outlined,
                      controller: exerciseSetController),
                  verticalSpace(space: 10),
                  textField(
                      type: TextInputType.number,
                      label: "Add the REPS",
                      prefixIcon: Icons.numbers_outlined,
                      controller: exerciseRepsController),
                  verticalSpace(space: 10),
                  textField(
                      type: TextInputType.text,
                      label: "Add exercise link",
                      prefixIcon: FontAwesomeIcons.link,
                      controller: exerciseLinkController),
                  verticalSpace(space: 10),
                  ConditionalBuilder(
                      condition: state is! LoadingAddExerciseState,
                      builder: (context) => defaultButton(context,
                              label: "Save", fontSize: 20, function: () {
                            if (formKey.currentState!.validate()) {
                              ExerciseCubit.get(context).addExerciseCubit(
                                  userId: uid,
                                  day: day,
                                  data: [
                                    {
                                      "link": exerciseLinkController.text,
                                      "Set": exerciseSetController.text,
                                      "reps": exerciseRepsController.text,
                                      "label": exerciseLabelController.text
                                    }
                                  ]);
                            }
                          }),
                      fallback: (context) =>
                          const Center(child: CircularProgressIndicator())),
                ],
              ),
            ),
          ),
        );
      }, listener: (context, state) {
        if (state is SuccessfullyAddExerciseState) {
          exerciseLinkController.clear();
          exerciseLabelController.clear();
          exerciseSetController.clear();
          exerciseRepsController.clear();
          toastMSG(text: "Added Exercise Successfully", color: Colors.green);
        } else if (state is ErrorAddExerciseState) {
          toastMSG(text: state.error.toString(), color: Colors.red);
        }
      }),
    );
  }
}
