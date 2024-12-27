import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_coach/logic/userData/user_data_cubit.dart';
import 'package:online_coach/presentation/authentication/login.dart';
import 'package:online_coach/shared/components/components.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}



class _UpdatePasswordState extends State<UpdatePassword> {
  bool isPassword = true;
  bool isCONFPassword = true;
  var formKey = GlobalKey<FormState>();
  TextEditingController confPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDataCubit(),
      child:
          BlocConsumer<UserDataCubit, UserDataState>(builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    textField(
                        controller: passwordController,
                        label: "password",
                        prefixIcon: Icons.lock_outline,
                        type: TextInputType.visiblePassword,
                        isPass: isPassword,
                        suffixIcon: isPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        suffixIconFunction: () {
                          setState(() {
                            isPassword = !isPassword;
                          });
                        }),
                    verticalSpace(space: 15),
                    textField(
                        controller: confPasswordController,
                        label: "CONF-password",
                        prefixIcon: Icons.lock_outline,
                        type: TextInputType.visiblePassword,
                        isPass: isCONFPassword,
                        suffixIcon: isCONFPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        suffixIconFunction: () {
                          setState(() {
                            isCONFPassword = !isCONFPassword;
                          });
                        }),
                    verticalSpace(space: 25),
                    state is! LoadingUpdatePasswordState
                        ? defaultButton(context, label: "Confirm", fontSize: 20,
                            color: Colors.green[700],
                            function: () {
                            if (formKey.currentState!.validate()) {
                              if (passwordController.text.length > 5&&passwordController.text ==
                                  confPasswordController.text) {
                                UserDataCubit.get(context).updatePassword(
                                    password: passwordController.text);
                              } else {
                                passwordController.text.length < 5 ? toastMSG(text: "The password is less than 6 characters", color: Colors.red):toastMSG(
                                    text: "Passwords aren't match",
                                    color: Colors.red);
                              }
                            }
                          })
                        : const Center(child: CircularProgressIndicator())
                  ],
                ),
              ),
            ),
          ),
        );
      }, listener: (context, state) {
        if (state is SuccessfullyUpdatePasswordState) {
          passwordController.clear();
          confPasswordController.clear();
          toastMSG(text: "Password changed successfully", color: Colors.green);
          moveForwardAndRemove(context: context, page: const Login());
        } else if (state is ErrorUpdatePasswordState) {
          toastMSG(text: state.error.toString(), color: Colors.red);
        }
      }),
    );
  }
}
