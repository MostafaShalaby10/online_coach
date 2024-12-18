import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_coach/logic/userData/user_data_cubit.dart';
import 'package:online_coach/presentation/user/update_password.dart';
import 'package:online_coach/shared/components/components.dart';
import '../../shared/shared_preferences/shared_preferences.dart';
import '../authentication/login.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDataCubit()..getSpecificUserData(id: SharedPrefs.getData(key: "UID")),
      child:
          BlocConsumer<UserDataCubit, UserDataState>(builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: state is! LoadingGetSpecificUserDataState
              ? Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
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
                          label: "Update Pass", fontSize: 24, function: () {moveForward(context: context, page: const UpdatePassword());}),
                      verticalSpace(space: 20),
                      defaultButton(context,
                          label: "Logout",
                          color: Colors.red[400],
                          fontSize: 24, function: () {
                        SharedPrefs.removeData(key: "UID");
                        SharedPrefs.removeData(key: "type");
                        moveForwardAndRemove(
                            context: context, page: const Login());
                      }),
                      verticalSpace(space: 20),
                      defaultButton(context,
                          label: "Delete account",
                          color: Colors.red,
                          fontSize: 24, function: ()async{
                        if(await confirm(context)){
                          UserDataCubit.get(context).deleteCurrentUser(id: SharedPrefs.getData(key: "UID"));
                          return moveForward(context: context, page: const Login());
                        }else{
                          moveBackWord(context: context);
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
