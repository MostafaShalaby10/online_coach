import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_coach/logic/userData/user_data_cubit.dart';
import 'package:online_coach/presentation/shared/home_page.dart';
import 'package:online_coach/shared/components/components.dart';
import 'package:online_coach/shared/shared_preferences/shared_preferences.dart';

import '../../../shared/constants/constants.dart';

class GymHistory extends StatefulWidget {
  const GymHistory({super.key});

  @override
  State<GymHistory> createState() => _GymHistoryState();
}



class _GymHistoryState extends State<GymHistory> {
  TextEditingController goalController = TextEditingController();
  TextEditingController periodController = TextEditingController();
  TextEditingController dailyController = TextEditingController();
  TextEditingController weeklyController = TextEditingController();
  String _gymHistory = 'yes';
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDataCubit(),
      child: BlocConsumer<UserDataCubit, UserDataState>(
          builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: formKey,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textField(
                          type: TextInputType.text,
                          label: "What is your goal",
                          prefixIcon: FontAwesomeIcons.person,
                          controller: goalController),
                      verticalSpace(space: 20),
                      text(text: "Did you go th the gym before  ?"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ListTile(
                              leading: Radio<String>(
                                value: 'yes',
                                groupValue: _gymHistory,
                                onChanged: (value) {
                                  setState(() {
                                    _gymHistory = value!;
                                  });
                                },
                                activeColor: secondaryColor,
                              ),
                              horizontalTitleGap: 0,
                              title: const Text('Yes' , style: TextStyle(color: Colors.white)),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              leading: Radio<String>(
                                value: 'No',
                                groupValue: _gymHistory,
                                onChanged: (value) {
                                  setState(() {
                                    _gymHistory = value!;
                                  });
                                },
                                activeColor: secondaryColor,
                              ),
                              horizontalTitleGap: 0,
                              title: const Text('No' , style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                      if (_gymHistory == "yes")
                        textField(
                            type: TextInputType.text,
                            label: "How long are you training",
                            prefixIcon: Icons.sports_gymnastics_rounded,
                            controller: periodController),
                      verticalSpace(space: 20),
                      textField(
                          type: TextInputType.number,
                          label:
                              "How many times can you go to the gym weekly ",
                          prefixIcon: FontAwesomeIcons.calendar,
                          controller: weeklyController),
                      verticalSpace(space: 20),
                      textField(
                          type: TextInputType.number,
                          label:
                              "How many times can you go to the gym daily ",
                          prefixIcon: FontAwesomeIcons.calendar,
                          controller: dailyController),
                      verticalSpace(space: 20),
                      ConditionalBuilder(
                          condition: state is! LoadingAddPersonalDataState,
                          builder: (context) => defaultButton(context,
                              label: "Finish",
                              fontSize: 20,
                              function: () {
                                if (formKey.currentState!
                                    .validate()) {
                                  personalData.addAll({
                                    "goal": goalController.text,
                                    "days": dailyController.text,
                                    "weeks": weeklyController.text,
                                    "gymHistory": _gymHistory,
                                    "period": periodController.text,
                                    "id": SharedPrefs.getData(
                                        key: "UID")
                                  });
                                  UserDataCubit.get(context)
                                      .addPersonalDataCubit(
                                          userId: SharedPrefs.getData(
                                              key: "UID"),
                                          data: personalData);
                                }
                              }),
                          fallback: (context) => const Center(
                              child: CircularProgressIndicator()))
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }, listener: (context, state) {
        if (state is SuccessfullyAddPersonalDataState) {
          toastMSG(text: "Saved Data", color: Colors.green);
          moveForwardAndRemove(context: context, page: const Homepage());
        } else if (state is ErrorAddPersonalDataState) {
          toastMSG(text: "Saved Data Failed", color: Colors.red);
        }
      }),
    );
  }
}
