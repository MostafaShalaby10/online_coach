import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_coach/logic/authentication/authentication_cubit.dart';
import 'package:online_coach/presentation/authentication/reset_password.dart';
import 'package:online_coach/presentation/shared/home_page.dart';
import 'package:online_coach/shared/components/components.dart';
import 'package:online_coach/shared/shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isPassword = true;

  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AUTHCubit(),
      child: BlocConsumer<AUTHCubit, AUTHState>(builder: (context, state) {
        return Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text(
                        text: "Welcome",
                        fontColor: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: text(
                          fontColor: Colors.grey,
                          text: "Login Page",
                          fontSize: 25,
                        ),
                      ),
                      verticalSpace(space: 30),
                      textField(
                        controller: emailController,
                        label: "E-mail",
                        prefixIcon: Icons.email_outlined,
                        type: TextInputType.emailAddress,
                      ),
                      verticalSpace(space: 15),
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
                      verticalSpace(space: 40),
                      ConditionalBuilder(
                          condition: state is! LoadingLoginState,
                          builder: (context) => defaultButton(context,
                                  label: "Login", fontSize: 20, function: () {
                                if (formKey.currentState!.validate()) {
                                  AUTHCubit.get(context).loginCubitFunction(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              }),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator())),
                      verticalSpace(space: 15),
                      Center(
                          child: TextButton(
                              onPressed: () {
                                moveForward(
                                    context: context, page: ResetPassword());
                              },
                              child: text(
                                  text: "Reset password",
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  fontColor: HexColor("#FF0000")))),

                      /*    Center(
                        child: TextButton(

                            onPressed: () {},
                            child:
                                text(text: "Create an account!", fontColor: Colors.blue)),
                      )*/
                    ],
                  ),
                ),
              ),
            ),
          )),
        );
      }, listener: (context, state) {
        if (state is SuccessfullyLoginState) {
          moveForwardAndRemove(context: context, page: Homepage());
          emailController.clear();
          passwordController.clear();
        } else if (state is ErrorLoginState) {
          toastMSG(text: state.error.toString(), color: HexColor("#B0B0B0"));
        }
      }),
    );
  }
}
