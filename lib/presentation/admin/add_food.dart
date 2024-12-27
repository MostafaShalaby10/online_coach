import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_coach/logic/food/food_cubit.dart';
import 'package:online_coach/shared/components/components.dart';

class AddFood extends StatefulWidget {
  final String uID;

  final String day;

  const AddFood({super.key, required this.uID, required this.day});

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController mealController = TextEditingController();
  String dropdownValue = 'breakfast';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FoodCubit()..getFoodCubit(userId: widget.uID, day: widget.day),
      child: BlocConsumer<FoodCubit, FoodState>(builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: text(text: "Add Food"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton<String>(
                      dropdownColor: Colors.black,
                      value: dropdownValue,
                      items: <String>['breakfast', 'lunch', 'dinner']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                
                            value,
                            style: const TextStyle(fontSize: 24 , color: Colors.white),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                    ),
                    verticalSpace(space: 20),
                    textField(
                        type: TextInputType.text,
                        label: "Add the meal",
                        prefixIcon: Icons.fastfood_outlined,
                        controller: mealController),
                    verticalSpace(space: 20),
                    ConditionalBuilder(
                        condition: state is! LoadingAddFoodState,
                        builder: (context) => defaultButton(context,
                            label: "Save",
                            fontSize: 20,
                            function: () {
                              if (formKey.currentState!.validate()) {
                                FoodCubit.get(context).addFoodCubit(
                                    userId: widget.uID,
                                    day: widget.day,
                                    data: [mealController.text],
                                    mealType: dropdownValue);
                              }
                            }),
                        fallback: (context) =>
                            const Center(child: CircularProgressIndicator())),
                  ],
                ),
              ),
            ),
          ),
        );
      }, listener: (context, state) {
        if (state is SuccessfullyAddFoodState) {
          toastMSG(text: "Added food successfully", color: Colors.green);
          mealController.clear();
        } else if (state is ErrorAddFoodState) {
          toastMSG(text: state.error.toString(), color: Colors.red);
        }
      }),
    );
  }
}
