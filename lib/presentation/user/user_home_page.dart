import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_coach/logic/personal_data/personal_data_cubit.dart';
import 'package:online_coach/presentation/authentication/login.dart';
import 'package:online_coach/presentation/shared/days.dart';
import 'package:online_coach/presentation/shared/show_supplements.dart';
import 'package:online_coach/presentation/user/personaldata/personal_data.dart';
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
                  InkWell(
                    onTap: () {
                      SharedPrefs.removeData(key: "UID");
                      SharedPrefs.removeData(key: "type");
                      moveForwardAndRemove(
                          context: context, page: const Login());
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          text(text: "Logout", fontColor: Colors.red),
                          const Icon(
                            EvaIcons.logOut,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
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
                                  child: SizedBox(
                                      width: 300.w,
                                      height: 70.h,
                                      child: defaultButton(
                                          label: "Enter your Data",
                                          fontSize: 30,
                                          function: () {
                                            moveForward(
                                                context: context,
                                                page: const PersonalData());
                                          })),
                                ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                child: SizedBox(
                                    width: 300.w,
                                    height: 70.h,
                                    child: defaultButton(
                                        label: "TIPS",
                                        fontSize: 30,
                                        function: () {
                                          moveForward(
                                              context: context,
                                              page: const TipsPage());
                                        })),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: SizedBox(
                                    width: 300.w,
                                    height: 70.h,
                                    child: defaultButton(
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
                                        })),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: SizedBox(
                                    width: 300.w,
                                    height: 70.h,
                                    child: defaultButton(
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
                                        })),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: SizedBox(
                                    width: 300.w,
                                    height: 70.h,
                                    child: defaultButton(
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
                                        })),
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
