import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_coach/presentation/shared/days.dart';
import 'package:online_coach/presentation/shared/show_supplements.dart';
import 'package:online_coach/shared/components/components.dart';

import '../../logic/userData/user_data_cubit.dart';

class ShowPersonalData extends StatelessWidget {
  final String userId;

  const ShowPersonalData({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserDataCubit()..getPersonalDataCubit(userId: userId),
      child: BlocConsumer<UserDataCubit, UserDataState>(
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
                              UserDataCubit.get(context)
                                      .userPersonalData!
                                      .isNotEmpty
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        text(
                                            text:
                                                "Weight"),
                                        Container(
                                          width: MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 5.0 , horizontal: 20),
                                            child: text(fontColor: Colors.black,text: UserDataCubit.get(context).userPersonalData!["weight"] , textAlign: TextAlign.start),
                                          ),
                                        ) ,
                                        verticalSpace(space: 10),
                                        text(
                                            text:
                                                "Tall"),
                                        Container(
                                          width: MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 5.0 , horizontal: 20),
                                            child: text(fontColor: Colors.black,text: UserDataCubit.get(context).userPersonalData!["tall"] , textAlign: TextAlign.start),
                                          ),
                                        ) ,
                                        verticalSpace(space: 10),
                                        text(
                                            text:
                                                "Goal"),
                                        Container(
                                          width: MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 5.0 , horizontal: 20),
                                            child: text(fontColor: Colors.black,text: UserDataCubit.get(context).userPersonalData!["goal"] , textAlign: TextAlign.start),
                                          ),
                                        ) ,
                                        verticalSpace(space: 10),
                                        text(
                                            text:
                                                "Gender"),
                                        Container(
                                          width: MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 5.0 , horizontal: 20),
                                            child: text(fontColor: Colors.black,text: UserDataCubit.get(context).userPersonalData!["gender"] , textAlign: TextAlign.start),
                                          ),
                                        ) ,
                                        verticalSpace(space: 10),
                                        text(
                                            text:
                                                "Gym History"),
                                        Container(
                                          width: MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 5.0 , horizontal: 20),
                                            child: text(fontColor: Colors.black , text: UserDataCubit.get(context).userPersonalData!["gymHistory"] , textAlign: TextAlign.start),
                                          ),
                                        ) ,
                                        verticalSpace(space: 10),
                                        text(
                                            text:
                                                "Age"),
                                        Container(
                                          width: MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 5.0 , horizontal: 20),
                                            child: text(fontColor: Colors.black,text: UserDataCubit.get(context).userPersonalData!["age"] , textAlign: TextAlign.start),
                                          ),
                                        ) ,
                                        verticalSpace(space: 10),
                                        text(
                                            text:
                                                "History of gym"),
                                        Container(
                                          width: MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 5.0 , horizontal: 20),
                                            child: text(fontColor: Colors.black , text: UserDataCubit.get(context).userPersonalData!["period"]==""?"No History":UserDataCubit.get(context).userPersonalData!["period"] , textAlign: TextAlign.start),
                                          ),
                                        ) ,
                                        verticalSpace(space: 10),
                                        text(
                                            text:
                                                "Times per week"),
                                        Container(
                                          width: MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 5.0 , horizontal: 20),
                                            child: text(fontColor: Colors.black , text: UserDataCubit.get(context).userPersonalData!["weeks"] , textAlign: TextAlign.start),
                                          ),
                                        ) ,
                                        verticalSpace(space: 10),
                                        text(
                                            text:
                                                "Times per day"),
                                        Container(
                                          width: MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 5.0 , horizontal: 20),
                                            child: text(fontColor: Colors.black ,text: UserDataCubit.get(context).userPersonalData!["days"] , textAlign: TextAlign.start),
                                          ),
                                        ) ,
                                        verticalSpace(space: 10),
                                      ],
                                    )
                                  : text(
                                      text: "There is no data for this user",
                                      textAlign: TextAlign.center,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20,
                                    ),
                              verticalSpace(space: 30),
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
