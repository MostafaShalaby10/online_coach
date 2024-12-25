import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_coach/logic/userData/user_data_cubit.dart';
import 'package:online_coach/presentation/shared/home_page.dart';
import 'package:online_coach/shared/components/components.dart';

import '../../shared/shared_preferences/shared_preferences.dart';

class UpdateData extends StatelessWidget {
  UpdateData({Key? key}) : super(key: key);
  final phoneController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDataCubit()
        ..getSpecificUserData(id: SharedPrefs.getData(key: "UID")),
      child: BlocConsumer<UserDataCubit, UserDataState>(
          builder: (context, state) {
            return  Scaffold(
              appBar: AppBar(),
              body: state is! LoadingGetSpecificUserDataState ?
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                  children: [
                    textField(
                        type: TextInputType.name,
                        label:  UserDataCubit.get(context)
                            .specificUserData["name"],
                        prefixIcon: FontAwesomeIcons.person,
                        controller: nameController),
                    verticalSpace(space: 20),
                    textField(
                        type: TextInputType.phone,
                        label:  UserDataCubit.get(context)
                            .specificUserData["phone"],
                        prefixIcon: FontAwesomeIcons.phone,
                        controller: phoneController),
                    verticalSpace(space: 30),
                    state is! LoadingUpdateDataState ?defaultButton(context, label: "Update", fontSize: 24,
                        function: () {
                      UserDataCubit.get(context).updateUserData(
                          id: SharedPrefs.getData(key: "UID"),
                          data: {
                            "name": nameController.text,
                            "phone": phoneController.text
                          });
                    }):const Center(child: CircularProgressIndicator()),
                  ],
                                ),
                ):const Center(child: CircularProgressIndicator()),
            );
          },
          listener: (context, state) {

            if(state is SuccessfullyUpdateDataState){
              toastMSG(text: "Updated Successfully", color: Colors.green);
              moveForwardAndRemove(context: context, page: Homepage());
            }else if(state is ErrorUpdateDataState){
              toastMSG(text: "Updated Failed", color: Colors.red);
            }
          }),
    );
  }
}
