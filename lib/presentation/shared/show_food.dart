import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_coach/logic/food/food_cubit.dart';
import 'package:online_coach/shared/components/components.dart';

class ShowFood extends StatelessWidget {
  final String type;
  final String day;

  final String uid;
  const ShowFood({super.key, required this.type, required this.day, required this.uid});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodCubit()..getFoodCubit(userId: uid, day: day),
      child: BlocConsumer<FoodCubit, FoodState>(builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              text(text: "Show Food Page")
            ],
          ),
        );
      }, listener: (context, state) {}),
    );
  }
}
