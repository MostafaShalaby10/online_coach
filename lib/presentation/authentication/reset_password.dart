import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_coach/logic/authentication/authentication_cubit.dart';
import 'package:online_coach/presentation/authentication/login.dart';
import 'package:online_coach/shared/components/components.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});

  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AUTHCubit(),
      child: BlocConsumer<AUTHCubit, AUTHState>(builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textField(
                      type: TextInputType.emailAddress,
                      label: "Enter your email",
                      prefixIcon: Icons.email_outlined,
                      controller: emailController),
                  verticalSpace(space: 15),
                  ConditionalBuilder(
                      condition: state is! LoadingResetPasswordState,
                      builder: (context) => defaultButton(context,
                          label: "Login",
                          fontSize: 20,
                          function: () {
                            if (formKey.currentState!.validate()) {
                              AUTHCubit.get(context).resetPasswordCubit(
                                email: emailController.text,
                              );
                            }
                          }),
                      fallback: (context) =>
                          const Center(child: CircularProgressIndicator()))
                ],
              ),
            ),
          ),
        );
      }, listener: (context, state) {
        if (state is SuccessfullyResetPasswordState) {
          emailController.clear();
          toastMSG(text: "Check yor mail", color: Colors.green);
          moveForwardAndRemove(context: context, page: const Login());
        } else if (state is ErrorResetPasswordState) {
          toastMSG(text: state.error.toString(), color: Colors.red);
        }
      }),
    );
  }
}
