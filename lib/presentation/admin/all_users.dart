import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_coach/logic/userData/user_data_cubit.dart';
import 'package:online_coach/presentation/admin/show_personal_data.dart';
import 'package:online_coach/shared/components/components.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../shared/constants/constants.dart';

class AllUsers extends StatelessWidget {
  const AllUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDataCubit()..getAllUserData(),
      child: BlocConsumer<UserDataCubit, UserDataState>(
          builder: (context, state) {
            return Scaffold(
                appBar: AppBar(
                ),
                body: ConditionalBuilder(
                    condition: state is! LoadingGetUserDataState,
                    builder: (context) => UserDataCubit.get(context)
                            .usersData
                            .isNotEmpty
                        ? ListView.separated(
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
                                          color: Colors.grey[300],
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  text(
                                                    fontColor: Colors.black,
                                                    text: UserDataCubit.get(
                                                            context)
                                                        .usersData[index]
                                                        .name,
                                                  ),
                                                  text(
                                                      fontColor: Colors.black,
                                                      text: UserDataCubit.get(
                                                              context)
                                                          .usersData[index]
                                                          .phone),
                                                  text(
                                                      fontColor: Colors.black,
                                                      text: UserDataCubit.get(
                                                              context)
                                                          .usersData[index]
                                                          .email),
                                                ],
                                              ),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  launchUrlString(
                                                      "tel:+2${UserDataCubit.get(context).usersData[index].phone}");
                                                },
                                                icon: Icon(Icons.call)),
                                            IconButton(
                                                onPressed: () {
                                                  launchUrlString(
                                                      "whatsapp://send?text=&phone=+2${UserDataCubit.get(context).usersData[index].phone}");
                                                },
                                                icon: Icon(
                                                    FontAwesomeIcons.whatsapp)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            separatorBuilder: (context, index) =>
                                verticalSpace(space: 10),
                            itemCount:
                                UserDataCubit.get(context).usersData.length)
                        : Column(

                            children: [
                              Image(
                                  image: CachedNetworkImageProvider(
                                      "https://img.freepik.com/free-vector/glitch-error-404-page_23-2148105404.jpg?t=st=1735266602~exp=1735270202~hmac=ca600eb33b96958b9e0e41e8bdaffeab8505789aceaea46670f581cf7847408f&w=740")),
                              Center(
                                child: text(
                                    text:
                                        "There is no users yet!!",
                                    fontSize: 25,
                                    fontColor: secondaryColor),
                              ),
                            ],
                          ),
                    fallback: (context) =>
                        const Center(child: CircularProgressIndicator())));
          },
          listener: (context, state) {}),
    );
  }
}
