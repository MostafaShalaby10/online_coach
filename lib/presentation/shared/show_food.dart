import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_coach/logic/food/food_cubit.dart';
import 'package:online_coach/presentation/admin/add_food.dart';
import 'package:online_coach/shared/components/components.dart';

class ShowFood extends StatelessWidget {
  final String day;
  final bool isAdmin;

  final String uid;

  const ShowFood(
      {super.key, required this.day, required this.uid, required this.isAdmin});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodCubit()..getFoodCubit(userId: uid, day: day),
      child: BlocConsumer<FoodCubit, FoodState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ConditionalBuilder(
                    condition: state is! LoadingGetFoodState,
                    builder: (context) => Column(
                          children: [
                            if (FoodCubit.get(context).foodData.isNotEmpty)
                              Expanded(
                                child: Column(
                                  children: [
                                    Center(
                                        child: text(
                                      text: "Breakfast",
                                      fontColor: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24,
                                    )),
                                    Expanded(
                                      child: ListView.builder(
                                        itemBuilder: (context, index) => text(
                                            textAlign: TextAlign.end,
                                            text: FoodCubit.get(context)
                                                        .foodData["breakfast"]
                                                    [index] ??
                                                " Wait for meals "),
                                        itemCount: FoodCubit.get(context)
                                            .foodData["breakfast"] !=
                                            null
                                            ? FoodCubit.get(context)
                                            .foodData["breakfast"]
                                            .length
                                            : 0,
                                      ),
                                    ),
                                    Center(
                                        child: text(
                                      text: "Lunch",
                                      fontColor: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24,
                                    )),
                                    Expanded(
                                      child: ListView.builder(
                                        itemBuilder: (context, index) => text(
                                            textAlign: TextAlign.end,
                                            text: FoodCubit.get(context)
                                                    .foodData["lunch"][index] ??
                                                " Wait for meals "),
                                        itemCount: FoodCubit.get(context)
                                            .foodData["lunch"] !=
                                            null
                                            ? FoodCubit.get(context)
                                            .foodData["lunch"]
                                            .length
                                            : 0,
                                      ),
                                    ),
                                    Center(
                                        child: text(
                                      text: "Dinner",
                                      fontColor: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24,
                                    )),
                                    Expanded(
                                      child: ListView.builder(
                                        itemBuilder: (context, index) => text(
                                            textAlign: TextAlign.end,
                                            text: FoodCubit.get(context)
                                                        .foodData["dinner"]
                                                    [index] ??
                                                " Wait for meals "),
                                        itemCount: FoodCubit.get(context)
                                                    .foodData["dinner"] !=
                                                null
                                            ? FoodCubit.get(context)
                                                .foodData["dinner"]
                                                .length
                                            : 0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (FoodCubit.get(context).foodData.isEmpty)
                              text(text: "There is no data yet"),
                            if (isAdmin)
                              defaultButton(context ,
                                  label: "Add an Food",
                                  fontSize: 20,
                                  function: () {
                                    moveForward(
                                        context: context,
                                        page: AddFood(
                                          uID: uid,
                                          day: day,
                                        ));
                                  }),
                          ],
                        ),
                    fallback: (context) =>
                        const Center(child: CircularProgressIndicator())),
              ),
            );
          },
          listener: (context, state) {}),
    );
  }
}
