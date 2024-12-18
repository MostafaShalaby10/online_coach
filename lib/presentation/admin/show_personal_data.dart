import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_coach/logic/personal_data/personal_data_cubit.dart';
import 'package:online_coach/presentation/shared/days.dart';
import 'package:online_coach/presentation/shared/show_supplements.dart';
import 'package:online_coach/shared/components/components.dart';

class ShowPersonalData extends StatelessWidget {
  final String userId;

  const ShowPersonalData({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PersonalDataCubit()..getPersonalDataCubit(userId: userId),
      child: BlocConsumer<PersonalDataCubit, PersonalDataState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(),
              body: ConditionalBuilder(
                  condition: state is! LoadingGetPersonalDataState,
                  builder: (context) => Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PersonalDataCubit.get(context)
                                      .userPersonalData!
                                      .isNotEmpty
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        text(
                                            text:
                                                "Weight : ${PersonalDataCubit.get(context).userPersonalData!["weight"]}"),
                                        text(
                                            text:
                                                "Tall : ${PersonalDataCubit.get(context).userPersonalData!["tall"]}"),
                                        text(
                                            text:
                                                "Goal : ${PersonalDataCubit.get(context).userPersonalData!["goal"]}"),
                                        text(
                                            text:
                                                "Gender : ${PersonalDataCubit.get(context).userPersonalData!["gender"]}"),
                                        text(
                                            text:
                                                "Gym History : ${PersonalDataCubit.get(context).userPersonalData!["gymHistory"]}"),
                                        text(
                                            text:
                                                "Age : ${PersonalDataCubit.get(context).userPersonalData!["age"]}"),
                                        text(
                                            text:
                                                "Period : ${PersonalDataCubit.get(context).userPersonalData!["period"]}"),
                                        text(
                                            text:
                                                "Times per week: ${PersonalDataCubit.get(context).userPersonalData!["weeks"]}"),
                                        text(
                                            text:
                                                "Times per day : ${PersonalDataCubit.get(context).userPersonalData!["days"]}"),
                                      ],
                                    )
                                  : text(
                                      text: "There is no data for this user",
                                      textAlign: TextAlign.center,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20,
                                    ),
                              verticalSpace(space: 100),
                              defaultButton(context ,
                                  label: "Exercise",
                                  fontSize: 20,
                                  function: () {
                                    moveForward(
                                      context: context,
                                      page: Days(
                                        isExercise: true,
                                        uid: userId,
                                        isAdmin: true,
                                      ),
                                    );
                                  }),
                              verticalSpace(space: 10),
                              defaultButton(context ,
                                  label: "Food",
                                  fontSize: 20,
                                  function: () {
                                    moveForward(
                                      context: context,
                                      page: Days(
                                        isExercise: false,
                                        uid: userId,
                                        isAdmin: true,
                                      ),
                                    );
                                  }),
                              verticalSpace(space: 10),
                              defaultButton(context ,
                                  label: "Supplements",
                                  fontSize: 20,
                                  function: () {
                                    moveForward(
                                        context: context,
                                        page: ShowSupplements(
                                          uid: userId,
                                          isAdmin: true,
                                        ));
                                  }),
                            ],
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
