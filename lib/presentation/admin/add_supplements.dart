import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_coach/logic/supplements/supplements_cubit.dart';
import 'package:online_coach/shared/components/components.dart';

class AddSupplements extends StatelessWidget {
  final String uid;

  AddSupplements({super.key, required this.uid});

  final formKey = GlobalKey<FormState>();
  final TextEditingController supplementsController = TextEditingController();
  final TextEditingController supplementsQuantityController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SupplementsCubit()..getSupplementsCubit(userId: uid),
      child: BlocConsumer<SupplementsCubit, SupplementsState>(
          builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: text(text: "Add Supplements"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textField(
                      type: TextInputType.text,
                      label: "Add supplements",
                      prefixIcon: FontAwesomeIcons.supple,
                      controller: supplementsController),
                  verticalSpace(space: 10),
                  textField(
                      type: TextInputType.text,
                      label: "Add the quantity",
                      prefixIcon: Icons.numbers_outlined,
                      controller: supplementsQuantityController),
                  verticalSpace(space: 10),
                  ConditionalBuilder(
                      condition: state is! LoadingAddSupplementsState,
                      builder: (context) => defaultButton(context ,
                          label: "Save",
                          fontSize: 20,
                          function: () {
                            if (formKey.currentState!.validate()) {
                              SupplementsCubit.get(context)
                                  .addSupplementsCubit(
                                      userId: uid,
                                      data: [
                                    {
                                      "supplementsName":
                                          supplementsController.text,
                                      "quantity":
                                          supplementsQuantityController
                                              .text
                                    }
                                  ]);
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
        if (state is SuccessfullyAddSupplementsState) {
          toastMSG(text: "Added supplements successfully", color: Colors.green);
        } else if (state is ErrorAddSupplementsState) {
          toastMSG(text: state.error.toString(), color: Colors.red);
        }
      }),
    );
  }
}
