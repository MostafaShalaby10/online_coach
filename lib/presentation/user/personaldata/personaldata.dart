import 'package:flutter/material.dart';
import 'package:online_coach/shared/components/components.dart';
import 'package:online_coach/shared/constants/constants.dart';


class PersonalData extends StatefulWidget {
  const PersonalData({super.key});

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  String _selectedGender = 'male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0 , left: 20 , right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              text(text: "Personal Data" , fontSize: 40 , fontWeight: FontWeight.w900) ,

              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textField(
                      type: TextInputType.number,
                      label: "Age",
                      prefixIcon: Icons.person_rounded,
                    ),
                    verticalSpace(space: 20),
                    textField(
                      type: TextInputType.number,
                      label: "Tall",
                      prefixIcon: Icons.height,
                    ),
                    verticalSpace(space: 20),
                    textField(
                      type: TextInputType.number,
                      label: "Weight",
                      prefixIcon: Icons.numbers,
                    ),
                    verticalSpace(space: 20),

                    Row(
                      children: [
                        text(text: "Gender" ) ,
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
                        ),                      ],
                    ) ,

                    verticalSpace(space: 40),

                    Center(
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: defaultButton(label: "Next", fontSize: 20, function: (){}))),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
