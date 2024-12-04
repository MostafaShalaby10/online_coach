import 'package:flutter/material.dart';
import 'package:online_coach/presentation/user/homepage.dart';
import 'package:online_coach/shared/constants/constants.dart';


import '../../shared/components/components.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

bool isPassword = true;
var formKey = GlobalKey<FormState>();

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
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
                    fontColor: secondaryColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: text(
                      text: "Login Page",
                      fontSize: 25,
                    ),
                  ),
                  verticalSpace(space: 30),
                  textField(
                    label: "E-mail",
                    prefixIcon: Icons.email_outlined,
                    type: TextInputType.emailAddress,
                  ),
                  verticalSpace(space: 15),
                  textField(
                      label: "password",
                      prefixIcon: Icons.lock_outline,
                      type: TextInputType.visiblePassword,
                      isPass: isPassword,
                      suffixIcon:
                          isPassword ? Icons.visibility : Icons.visibility_off,
                      suffixIconFunction: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      }),
                  verticalSpace(space: 40),
                  Center(
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: defaultButton(
                              label: "login",
                              fontSize: 20,
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  moveForwardAndRemove(context: context, page: const Homepage());
                                }
                              }))),
                  verticalSpace(space: 15),


                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
