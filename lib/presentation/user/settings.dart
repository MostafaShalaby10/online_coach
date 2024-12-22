import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_coach/logic/userData/user_data_cubit.dart';
import 'package:online_coach/presentation/user/update_data.dart';
import 'package:online_coach/presentation/user/update_password.dart';
import 'package:online_coach/shared/components/components.dart';
import '../../shared/shared_preferences/shared_preferences.dart';
import '../authentication/login.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDataCubit()
        ..getSpecificUserData(id: SharedPrefs.getData(key: "UID")),
      child:
          BlocConsumer<UserDataCubit, UserDataState>(builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: state is! LoadingGetSpecificUserDataState
              ? Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                              onPressed: () {
                                moveForward(
                                    context: context, page: UpdateData());
                              },
                              icon: const Icon(
                                FontAwesomeIcons.penToSquare,
                                color: Colors.white,
                              ))),
                      text(
                          text: UserDataCubit.get(context)
                              .specificUserData["name"],
                          fontSize: 35),
                      text(
                          text: UserDataCubit.get(context)
                              .specificUserData["phone"],
                          fontSize: 20),
                      text(
                          text: UserDataCubit.get(context)
                              .specificUserData["email"],
                          fontSize: 20),
                      verticalSpace(space: 20),
                      defaultButton(context,
                          label: "Update Data",
                          color: HexColor("#EA3B52"),
                          fontSize: 24,
                          function: () {}),
                      verticalSpace(space: 20),
                      defaultButton(context,
                          label: "Logout",
                          color: HexColor("#EA3B52"),
                          fontSize: 24, function: () {
                        SharedPrefs.removeData(key: "UID");
                        SharedPrefs.removeData(key: "type");
                        moveForwardAndRemove(
                            context: context, page: const Login());
                      }),
                      verticalSpace(space: 20),
                      defaultButton(context,
                          label: "Delete account",
                          color: HexColor("#DB0F27"),
                          fontSize: 24, function: () async {
                        if (await confirm(
                          context,
                          title: text(text: "Warning", fontColor: Colors.red),
                          canPop: true,
                          content: text(
                              text: "Are you sure to delete account",
                              fontColor: Colors.black),
                        )) {
                          UserDataCubit.get(context).deleteCurrentUser(
                              id: SharedPrefs.getData(key: "UID"));
                          return moveForward(
                              context: context, page: const Login());
                        }
                      }),
                    ],
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
        );
      }, listener: (context, state) {
        if (state is SuccessfullyDeleteCurrentAccountState) {
          toastMSG(text: "Deleted account successfully", color: Colors.green);
          moveForwardAndRemove(context: context, page: const Login());
        } else if (state is ErrorDeleteCurrentAccountState) {
          toastMSG(text: "Deleted account Failed", color: Colors.red);
        }
      }),
    );
  }
}
