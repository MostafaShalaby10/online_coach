import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_coach/logic/userData/user_data_cubit.dart';
import 'package:online_coach/presentation/admin/show_personal_data.dart';
import 'package:online_coach/shared/components/components.dart';

class AllUsers extends StatelessWidget {
  const AllUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDataCubit()..getAllUserData(),
      child: BlocConsumer<UserDataCubit, UserDataState>(
          builder: (context, state) {
            return Scaffold(
                appBar: AppBar(),
                body: ConditionalBuilder(
                    condition: state is! LoadingGetUserDataState,
                    builder: (context) => ListView.separated(
                        itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                moveForward(
                                    context: context,
                                    page: ShowPersonalData(
                                      userId: UserDataCubit.get(context)
                                          .usersData[index]
                                          .id,
                                    ));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300] ,
                                    borderRadius: BorderRadius.circular(25)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        text(
                                          fontColor: Colors.black,
                                          text: UserDataCubit.get(context)
                                              .usersData[index]
                                              .name,
                                        ),
                                        text(
                                            fontColor: Colors.black,
                                            text: UserDataCubit.get(context)
                                                .usersData[index]
                                                .phone),
                                        text(
                                            fontColor: Colors.black,
                                            text: UserDataCubit.get(context)
                                                .usersData[index]
                                                .email),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        separatorBuilder: (context, index) => Container(
                              width: MediaQuery.of(context).size.width,
                              height: 1.h,
                              color: Colors.black,
                            ),
                        itemCount: UserDataCubit.get(context).usersData.length),
                    fallback: (context) =>
                        const Center(child: CircularProgressIndicator())));
          },
          listener: (context, state) {}),
    );
  }
}
