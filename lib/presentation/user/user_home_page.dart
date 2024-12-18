import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(onPressed: (){moveForward(context: context, page: const Settings());}, icon: const Icon(Icons.settings)),
                  )
                ],
              ),
              body: ConditionalBuilder(
                  condition: state is! LoadingGetPersonalDataState,
                  builder: (context) => Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (PersonalDataCubit.get(context)
                                  .userPersonalData!
                                  .isEmpty)
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.h),
                                  child: defaultButton(context ,
                                      label: "Enter your Data",
                                      fontSize: 30,
                                      function: () {
                                        moveForward(
                                            context: context,
                                            page: const PersonalData());
                                      }),
                                ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                child: defaultButton(context ,
                                    label: "TIPS",
                                    fontSize: 30,
                                    function: () {
                                      moveForward(
                                          context: context,
                                          page: const TipsPage());
                                    }),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: defaultButton(context ,
                                    label: "Exercises",
                                    fontSize: 30,
                                    function: () {
                                      moveForward(
                                          context: context,
                                          page:  Days(
                                            isExercise: true,
                                            uid: SharedPrefs.getData(key: "UID"),
                                            isAdmin: false,
                                          ));
                                    }),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: defaultButton(context ,
                                    label: "Food",
                                    fontSize: 30,
                                    function: () {
                                      moveForward(
                                          context: context,
                                          page:  Days(
                                            isExercise: false,
                                            uid: SharedPrefs.getData(key: "UID"),
                                            /////////////////////////////////////////////////////////////
                                            isAdmin: false,
                                          ));
                                    }),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: defaultButton(context ,
                                    label: "Supplements",
                                    fontSize: 30,
                                    function: () {
                                      moveForward(
                                          context: context,
                                          page:  ShowSupplements(
                                              uid: SharedPrefs.getData(key: "UID"),
                                              ////////////////////////////////////////////////
                                              isAdmin:
                                                  false)); /*Not to Days*/
                                    }),
                              ),
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
