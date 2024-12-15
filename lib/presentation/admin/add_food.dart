import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_coach/logic/food/food_cubit.dart';
import 'package:online_coach/shared/components/components.dart';

class AddFood extends StatelessWidget {
  final String uID;

  final String day;

  AddFood({super.key, required this.uID, required this.day});

  final formKey = GlobalKey<FormState>();
  final TextEditingController mealTypeController = TextEditingController();
  final TextEditingController mealController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodCubit()..getFoodCubit(userId: uID, day: day),
      child: BlocConsumer<FoodCubit, FoodState>(builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: text(text: "Add Food"),
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
                      label: "Add meal type",
                      prefixIcon: Icons.fastfood_outlined,
                      controller: mealTypeController),
                  verticalSpace(space: 10),
                  textField(
                      type: TextInputType.text,
                      label: "Add the meal",
                      prefixIcon: Icons.fastfood_outlined,
                      controller: mealController),
                  verticalSpace(space: 10),
                  ConditionalBuilder(
                      condition: state is! LoadingAddFoodState,
                      builder: (context) => Center(
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: defaultButton(
                                  label: "Save",
                                  fontSize: 20,
                                  function: () {
                                    if (formKey.currentState!.validate()) {
                                      FoodCubit.get(context).addFoodCubit(
                                          userId: uID,
                                          day: day,
                                          data: [mealController.text],
                                          mealType: mealTypeController.text);
                                    }
                                  }))),
                      fallback: (context) =>
                          const Center(child: CircularProgressIndicator())),
                ],
              ),
            ),
          ),
        );
      }, listener: (context, state) {
        if (state is SuccessfullyAddFoodState) {
          toastMSG(text: "Added food successfully", color: Colors.green);
        } else if (state is ErrorAddFoodState) {
          toastMSG(text: state.error.toString(), color: Colors.red);
        }
      }),
    );
  }
}
