import 'package:flutter/material.dart';
import 'package:online_coach/presentation/user/personal_data/gym_history.dart';
import 'package:online_coach/shared/components/components.dart';
import 'package:online_coach/shared/constants/constants.dart';

class PersonalData extends StatefulWidget {
  const PersonalData({super.key});

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

String _selectedGender = 'male';
TextEditingController ageController = TextEditingController();
TextEditingController tallController = TextEditingController();
TextEditingController weightController = TextEditingController();
var formKey = GlobalKey<FormState>();

class _PersonalDataState extends State<PersonalData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    text(
                        text: "Personal Data",
                        fontSize: 40,
                        fontWeight: FontWeight.w900),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          textField(
                            controller: ageController,
                            type: TextInputType.number,
                            label: "Age",
                            prefixIcon: Icons.person_rounded,
                          ),
                          verticalSpace(space: 20),
                          textField(
                            controller: tallController,
                            type: TextInputType.number,
                            label: "Tall",
                            prefixIcon: Icons.height,
                          ),
                          verticalSpace(space: 20),
                          textField(
                            controller: weightController,
                            type: TextInputType.number,
                            label: "Weight",
                            prefixIcon: Icons.numbers,
                          ),
                          verticalSpace(space: 20),
                          Row(
                            children: [
                              text(text: "Gender"),
                              Expanded(
                                child: ListTile(
                                  leading: Radio<String>(
                                    value: 'male',
                                    groupValue: _selectedGender,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedGender = value!;
                                      });
                                    },
                                    activeColor: secondaryColor,
                                  ),
                                  horizontalTitleGap: 0,
                                  title: const Text('Male'),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  leading: Radio<String>(
                                    value: 'female',
                                    groupValue: _selectedGender,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedGender = value!;
                                      });
                                    },
                                    activeColor: secondaryColor,
                                  ),
                                  horizontalTitleGap: 0,
                                  title: const Text('Female'),
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(space: 40),
                          defaultButton(context,
                              label: "Next",
                              fontSize: 20,
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  personalData.addAll({
                                    "weight" : weightController.text ,
                                    "tall" : tallController.text ,
                                    "age" : ageController.text ,
                                    "gender" : _selectedGender ,
                                  });

                                  moveForward(context: context, page:const GymHistory());
                                }
                              }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
