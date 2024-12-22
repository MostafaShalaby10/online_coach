import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_coach/logic/food/food_cubit.dart';
import 'package:online_coach/presentation/admin/add_food.dart';
import 'package:online_coach/shared/components/components.dart';

class ShowFood extends StatefulWidget {
  final String day;
  final bool isAdmin;

  final String uid;

  const ShowFood(
      {super.key, required this.day, required this.uid, required this.isAdmin});

  @override
  State<ShowFood> createState() => _ShowFoodState();
}

bool breakfastFlag = true;
bool lunchFlag = false;
bool dinnerFlag = false;

class _ShowFoodState extends State<ShowFood> {
  bool breakfastFlag = true;
  bool lunchFlag = false;
  bool dinnerFlag = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FoodCubit()..getFoodCubit(userId: widget.uid, day: widget.day),
      child: BlocConsumer<FoodCubit, FoodState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              color: breakfastFlag
                                  ? HexColor("#CDFB47")
                                  : Colors.grey[700],
                              child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      breakfastFlag = true;

                                      lunchFlag = false;

                                      dinnerFlag = false;
                                    });
                                  },
                                  child: text(
                                      text: "Breakfast",
                                      fontColor: breakfastFlag
                                          ? Colors.black
                                          : Colors.white))),
                        ),
                        horizontalSpace(space: 5),
                        Expanded(
                          child: Container(
                              color: lunchFlag
                                  ? HexColor("#CDFB47")
                                  : Colors.grey[700],
                              child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      lunchFlag = true;

                                      breakfastFlag = false;

                                      dinnerFlag = false;
                                    });
                                  },
                                  child: text(
                                      text: "Lunch",
                                      fontColor: lunchFlag
                                          ? Colors.black
                                          : Colors.white))),
                        ),
                        horizontalSpace(space: 5),
                        Expanded(
                          child: Container(
                              color: dinnerFlag
                                  ? HexColor("#CDFB47")
                                  : Colors.grey[700],
                              child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      dinnerFlag = true;

                                      lunchFlag = false;

                                      breakfastFlag = false;
                                    });
                                  },
                                  child: text(
                                      text: "Dinner",
                                      fontColor: dinnerFlag
                                          ? Colors.black
                                          : Colors.white))),
                        ),
                      ],
                    ),
                    state is! LoadingGetFoodState
                        ? Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  if (breakfastFlag)
                                    Expanded(
                                      child: Column(
                                        children: [
                                          if (FoodCubit.get(context)
                                                  .foodData["breakfast"] !=
                                              null)
                                            Expanded(
                                              child: ListView.separated(
                                                  itemBuilder:
                                                      (context, index) =>
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              text(
                                                                  text: FoodCubit.get(
                                                                              context)
                                                                          .foodData[
                                                                      "breakfast"][index])
                                                            ],
                                                          ),
                                                  separatorBuilder: (context,
                                                          index) =>
                                                      verticalSpace(space: 10),
                                                  itemCount:
                                                      FoodCubit.get(context)
                                                          .foodData["breakfast"]
                                                          .length),
                                            ),
                                          if (FoodCubit.get(context)
                                                  .foodData["breakfast"] ==
                                              null)
                                            text(
                                                text: "There is no breakfast "),
                                        ],
                                      ),
                                    ),
                                  if (lunchFlag)
                                    Expanded(
                                      child: Column(
                                        children: [
                                          if (FoodCubit.get(context)
                                                  .foodData["lunch"] !=
                                              null)
                                            Expanded(
                                              child: ListView.separated(
                                                  itemBuilder:
                                                      (context, index) =>
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              text(
                                                                  text: FoodCubit.get(
                                                                              context)
                                                                          .foodData[
                                                                      "lunch"][index])
                                                            ],
                                                          ),
                                                  separatorBuilder: (context,
                                                          index) =>
                                                      verticalSpace(space: 10),
                                                  itemCount:
                                                      FoodCubit.get(context)
                                                          .foodData["lunch"]
                                                          .length),
                                            ),
                                          if (FoodCubit.get(context)
                                                  .foodData["lunch"] ==
                                              null)
                                            text(text: "There is no lunch "),
                                        ],
                                      ),
                                    ),
                                  if (dinnerFlag)
                                    Expanded(
                                      child: Column(
                                        children: [
                                          if (FoodCubit.get(context)
                                                  .foodData["dinner"] !=
                                              null)
                                            Expanded(
                                              child: ListView.separated(
                                                  itemBuilder:
                                                      (context, index) =>
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              text(
                                                                  text: FoodCubit.get(
                                                                              context)
                                                                          .foodData[
                                                                      "dinner"][index])
                                                            ],
                                                          ),
                                                  separatorBuilder: (context,
                                                          index) =>
                                                      verticalSpace(space: 10),
                                                  itemCount:
                                                      FoodCubit.get(context)
                                                          .foodData["dinner"]
                                                          .length),
                                            ),
                                          if (FoodCubit.get(context)
                                                  .foodData["dinner"] ==
                                              null)
                                            text(text: "There is no dinner "),
                                        ],
                                      ),
                                    ),
                                  if (this.widget.isAdmin)
                                    defaultButton(context,
                                        label: "Add an Food",
                                        color: Colors.grey[700],
                                        fontSize: 20, function: () {
                                      moveForward(
                                          context: context,
                                          page: AddFood(
                                            uID: this.widget.uid,
                                            day: this.widget.day,
                                          ));
                                    }),
                                ],
                              ),
                            ),
                          )
                        : const Center(child: CircularProgressIndicator())
                  ],
                ),
              ),
            );
          },
          listener: (context, state) {}),
    );
  }
}
