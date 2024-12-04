import 'package:flutter/material.dart';
import 'package:online_coach/shared/components/components.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isPassword = true;

  bool isConfPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textField(
                            type: TextInputType.name,
                            label: "Name",
                            prefixIcon: Icons.person_2_outlined),
                        verticalSpace(space: 20) ,

                        textField(
                            type: TextInputType.emailAddress,
                            label: "E-mail",
                            prefixIcon: Icons.person_2_outlined),
                        verticalSpace(space: 20) ,

                        textField(
                            isPass: isPassword,
                            type: TextInputType.visiblePassword,
                            label: "Password",
                            prefixIcon: Icons.person_2_outlined,
                            suffixIcon: isPassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined ,
                        suffixIconFunction: ()
                            {
                              setState(() {
                                isPassword=!isPassword ;
                              });
                            }
                        ),
                        verticalSpace(space: 20) ,

                        textField(
                            isPass: isConfPassword,
                            type: TextInputType.visiblePassword,
                            label: "Conf-Password",
                            prefixIcon: Icons.person_2_outlined,
                            suffixIcon: isConfPassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined ,
                            suffixIconFunction: ()
                            {
                              setState(() {
                                isConfPassword=!isConfPassword ;
                              });
                            }
                        ),
                        verticalSpace(space: 20) ,

                        textField(
                            type: TextInputType.phone,
                            label: "Phone",
                            prefixIcon: Icons.person_2_outlined),
                        verticalSpace(space: 20) ,


                        Center(
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: defaultButton(label: "Signup", fontSize: 20, function: (){}))),
                        verticalSpace(space: 15) ,

                     /*   Center(
                          child: TextButton(
                    
                              onPressed: () {},
                              child:
                              text(text: "Have an account!", fontColor: Colors.blue)),
                        )*/
                    
                    
                    
                    
                    
                    
                      ],
                    ),
                  ),
          )),
    );
  }
}
