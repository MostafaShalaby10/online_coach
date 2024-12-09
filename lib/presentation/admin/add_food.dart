import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_coach/logic/food/food_cubit.dart';
import 'package:online_coach/shared/components/components.dart';

class AddFood extends StatelessWidget {
   AddFood({super.key});
  final  formKey = GlobalKey<FormState>();
  final TextEditingController mealTypeController = TextEditingController();
  final  TextEditingController mealController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodCubit(),
      child: BlocConsumer<FoodCubit, FoodState>(
          builder: (context, state) {

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
                      Center(
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: defaultButton(
                                  label: "Save",
                                  fontSize: 20,
                                  function: () {
                                    if (formKey.currentState!.validate()) {}
                                  }))),
                    ],
                  ),
                ),
              ),
            );
          },
          listener: (context, state) {}),
    );
  }
}
