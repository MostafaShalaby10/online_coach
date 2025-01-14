import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_coach/logic/userData/user_data_cubit.dart';
import 'package:online_coach/presentation/shared/update_data.dart';
import 'package:online_coach/presentation/shared/update_password.dart';
import 'package:online_coach/shared/components/components.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../shared/shared_preferences/shared_preferences.dart';
import '../authentication/login.dart';

class Settings extends StatelessWidget {
  final bool isAdmin;

  const Settings({super.key, required this.isAdmin});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDataCubit()
        ..getSpecificUserData(id: SharedPrefs.getData(key: "UID")),
      child:
          BlocConsumer<UserDataCubit, UserDataState>(builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              TextButton(onPressed: (){
              SharedPrefs.removeData(key: "UID");
              SharedPrefs.removeData(key: "type");
              moveForwardAndRemove(
                  context: context, page: const Login());
              SharedPrefs.removeData(key: "UID");
              SharedPrefs.removeData(key: "type");
              moveForwardAndRemove(context: context, page: Login());
            
              }, child: text(text: "Logout" , fontColor: Colors.red))
            ],
          ),
          body: state is! LoadingGetSpecificUserDataState
              ? Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: text(text: "Contact Coach", fontSize: 24)),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                  onPressed: () {
                                    launchUrlString(
                                        "https://www.instagram.com/mostafa.gamal32?igsh=MWZzZDA3ZHN5ZW56MA==",
                                        mode: LaunchMode.externalApplication);
                                  },
                                  icon: const Icon(FontAwesomeIcons.instagram , color: Colors.red,)),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                  onPressed: () {
                                    launchUrlString(
                                        "whatsapp://send?text=&phone=+201093080663",
                                        mode: LaunchMode.externalApplication);
                                  },
                                  icon: const Icon(FontAwesomeIcons.whatsapp , color: Colors.green,)),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                  onPressed: () {
                                    launchUrlString("tel:+201093080663",
                                        mode: LaunchMode.externalApplication);
                                  },
                                  icon: const Icon(Icons.call , color: Colors.white,)),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(25)),
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
                          ],
                        ),
                      ),
                      verticalSpace(space: 20),
                      InkWell(
                        onTap: () {
                          moveForward(context: context, page: UpdatePassword());
                        },
                        child: Container(
                          height: 50.h,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                text(
                                    text: "Change password",
                                    fontColor: Colors.black,
                                    fontSize: 17,
                                    textAlign: TextAlign.start),
                                Spacer(),
                                Icon(
                                  Icons.keyboard_arrow_right_rounded,
                                  size: 30,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      verticalSpace(space: 20),

                      Spacer(),
                      if (!isAdmin)
                       state is! LoadingDeleteCurrentAccountState ? InkWell(
                          onTap: () async {
                            if (await confirm(
                              context,
                              title:
                                  text(text: "Warning", fontColor: Colors.red),
                              canPop: true,
                              content: text(
                                  text: "Are you sure to delete account",
                                  fontColor: Colors.black),
                            )) {
                              UserDataCubit.get(context).deleteCurrentUser(
                                  id: SharedPrefs.getData(key: "UID"));

                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: HexColor("#B80F0A"),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    text(
                                        text: "Delete account",
                                        fontColor: Colors.black,
                                        fontSize: 20,
                                        textAlign: TextAlign.start),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ):Center(child: CircularProgressIndicator()),
                    ],
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
        );
      }, listener: (context, state) {
        if (state is SuccessfullyDeleteCurrentAccountState) {
          toastMSG(text: "Deleted account successfully", color: Colors.green);
          SharedPrefs.removeData(key: "UID");
          SharedPrefs.removeData(key: "type");
          moveForwardAndRemove(context: context, page: const Login());
        } else if (state is ErrorDeleteCurrentAccountState) {
          toastMSG(text: "Deleted account Failed", color: Colors.red);
        }
      }),
    );
  }
}
