import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_coach/logic/food/food_cubit.dart';
import 'package:online_coach/presentation/admin/add_food.dart';
import 'package:online_coach/shared/components/components.dart';

class ShowFood extends StatelessWidget {
  final String day;
final bool isAdmin ;
  final String uid;

  const ShowFood({super.key, required this.day, required this.uid, required this.isAdmin});

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
                                child: ListView.separated(
                                    itemBuilder: (context, index) => Column(
                                          children: [
                                            text(
                                                text: FoodCubit.get(context)
                                                    .foodData["breakfast"][0]??" "
                                                    ),
                                            text(
                                                text: FoodCubit.get(context)
                                                    .foodData
                                                    .length
                                                    .toString()),
                                            text(
                                                text: FoodCubit.get(context)
                                                    .foodData
                                                    .length
                                                    .toString()),
                                          ],
                                        ),
                                    separatorBuilder: (context, index) => Container(
                                          width: MediaQuery.of(context).size.width,
                                          height: 1.h,
                                          color: Colors.black,
                                        ),
                                    itemCount: 5),
                              ),
                            if (FoodCubit.get(context).foodData.isEmpty)
                              text(text: "There is no data yet"),
                            if(isAdmin)
                            Center(
                                child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: defaultButton(
                                        label: "Add an Food",
                                        fontSize: 20,
                                        function: () {
                                          moveForward(
                                              context: context,
                                              page: AddFood(
                                                uID: uid,
                                                day: day,
                                              ));
                                        }))),
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
