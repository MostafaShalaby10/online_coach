import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_coach/logic/food/food_cubit.dart';
import 'package:online_coach/presentation/admin/add_food.dart';
import 'package:online_coach/shared/components/components.dart';

import '../../shared/constants/constants.dart';

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
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Image(
                                                    image: CachedNetworkImageProvider(
                                                        "https://img.freepik.com/free-psd/lying-down-watching-movies-home-3d-illustration_1419-2560.jpg?t=st=1735255085~exp=1735258685~hmac=41e4cc0ba502404ceb06ec0afb4ef2435f353087805de89f7404edc1df9ea25b&w=740")),
                                                Center(
                                                  child: text(
                                                      text:
                                                      "There is no breakfast yet\n Waittttt!!",
                                                      fontSize: 25,
                                                      fontColor: secondaryColor),
                                                ),
                                              ],
                                            ),

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
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Image(
                                                    image: CachedNetworkImageProvider(
                                                        "https://img.freepik.com/free-psd/lying-down-watching-movies-home-3d-illustration_1419-2560.jpg?t=st=1735255085~exp=1735258685~hmac=41e4cc0ba502404ceb06ec0afb4ef2435f353087805de89f7404edc1df9ea25b&w=740")),
                                                Center(
                                                  child: text(
                                                      text:
                                                      "There is no lunch yet\n Waittttt!!",
                                                      fontSize: 25,
                                                      fontColor: secondaryColor),
                                                ),
                                              ],
                                            ),
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
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Image(
                                                    image: CachedNetworkImageProvider(
                                                        "https://img.freepik.com/free-psd/lying-down-watching-movies-home-3d-illustration_1419-2560.jpg?t=st=1735255085~exp=1735258685~hmac=41e4cc0ba502404ceb06ec0afb4ef2435f353087805de89f7404edc1df9ea25b&w=740")),
                                                Center(
                                                  child: text(
                                                      text:
                                                      "There is no dinner yet\n Waittttt!!",
                                                      fontSize: 25,
                                                      fontColor: secondaryColor),
                                                ),
                                              ],
                                            ),
                                        ],
                                      ),
                                    ),
                                  if (widget.isAdmin)
                                    defaultButton(context,
                                        label: "Add Food",
                                        color: Colors.grey[700],
                                        fontSize: 20, function: () {
                                      moveForward(
                                          context: context,
                                          page: AddFood(
                                            uID: widget.uid,
                                            day: widget.day,
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
