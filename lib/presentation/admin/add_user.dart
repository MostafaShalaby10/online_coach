import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_coach/logic/authentication/authentication_cubit.dart';
import 'package:online_coach/shared/components/components.dart';

import '../../shared/constants/constants.dart';

class Adduser extends StatefulWidget {
  const Adduser({super.key});

  @override
  State<Adduser> createState() => _AdduserState();
}

String _selectRole = "user";
bool isPass = true;
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController phoneController = TextEditingController();
var formKey = GlobalKey<FormState>();

class _AdduserState extends State<Adduser> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AUTHCubit(),
      child: BlocConsumer<AUTHCubit, AUTHState>(builder: (context, state) {
        return Scaffold(
          appBar: AppBar(

            title: text(text: "Add User"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: formKey,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textField(
                          controller: nameController,
                          type: TextInputType.name,
                          label: "Name",
                          prefixIcon: Icons.person_outline_rounded),
                      verticalSpace(space: 20),
                      textField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          label: "E-mail",
                          prefixIcon: Icons.mail_outline),
                      verticalSpace(space: 20),
                      textField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          label: "Password",
                          prefixIcon: Icons.lock_outline,
                          isPass: isPass,
                          suffixIcon: isPass
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          suffixIconFunction: () {
                            setState(() {
                              isPass = !isPass;
                            });
                          }),
                      verticalSpace(space: 20),
                      textField(
                          controller: phoneController,
                          type: TextInputType.phone,
                          label: "Phone",
                          prefixIcon: Icons.phone_android_outlined),
                      verticalSpace(space: 20),
                      Row(
                        children: [
                          text(text: "Gender"),
                          Expanded(
                            child: ListTile(
                              leading: Radio<String>(
                                value: 'user',
                                groupValue: _selectRole,
                                onChanged: (value) {
                                  setState(() {
                                    _selectRole = value!;
                                  });
                                },
                                activeColor: secondaryColor,
                              ),
                              horizontalTitleGap: 0,
                              title: const Text('User'  , style: TextStyle(color: Colors.white),),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              leading: Radio<String>(
                                value: 'admin',
                                groupValue: _selectRole,
                                onChanged: (value) {
                                  setState(() {
                                    _selectRole = value!;
                                  });
                                },
                                activeColor: secondaryColor,
                              ),
                              horizontalTitleGap: 0,
                              title: const Text('Admin',style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ],
                      ),

                      verticalSpace(space: 20),
                      ConditionalBuilder(
                          condition: state is! LoadingCreateAccountState,
                          builder: (context) => defaultButton(context ,
                              label: "Add",
                              fontSize: 20,
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  if (passwordController.text.length > 5 && phoneController.text.length>10) {
                                    AUTHCubit.get(context)
                                        .createAnAccountCubitFunction(
                                            name: nameController.text,
                                            phone: phoneController.text,
                                            email: emailController.text,
                                            password:
                                                passwordController.text, role: _selectRole);
                                  } else {
                                   passwordController.text.length<5? toastMSG(
                                        text:
                                            "The password length must be at least 6 characters",
                                        color: Colors.red): toastMSG(
                                       text:
                                       "Enter valid phone number",
                                       color: Colors.red);
                                  }
                                }
                              }),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()))
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }, listener: (context, state) {
        if (state is SuccessfullyCreateAccountState) {
          toastMSG(text: "Added successfully", color: Colors.green);
          emailController.clear();
          passwordController.clear();
          phoneController.clear();
          nameController.clear();
        } else if (state is ErrorCreateAccountState) {
          toastMSG(text: state.error.toString(), color: Colors.red);
        }
      }),
    );
  }
}
