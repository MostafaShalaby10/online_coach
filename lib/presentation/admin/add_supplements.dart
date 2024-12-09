import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_coach/logic/supplements/supplements_cubit.dart';
import 'package:online_coach/shared/components/components.dart';

class AddSupplements extends StatelessWidget {
  const AddSupplements({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SupplementsCubit(),
      child: BlocConsumer<SupplementsCubit, SupplementsState>(
          builder: (context, state) {
            var formKey = GlobalKey<FormState>();
            TextEditingController supplementsController =
                TextEditingController();
            TextEditingController supplementsQuantityController =
                TextEditingController();
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
                          prefixIcon: EvaIcons.power,
                          controller: supplementsController),
                      verticalSpace(space: 10),
                      textField(
                          type: TextInputType.text,
                          label: "Add the quantity",
                          prefixIcon: Icons.numbers_outlined,
                          controller: supplementsQuantityController),
                      verticalSpace(space: 10),
                      Center(
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: defaultButton(
                                  label: "Save",
                                  fontSize: 20,
                                  function: () {
                                    if (formKey.currentState!.validate()) {}
                                  }))),
                    ],
                  ),
                ),
              ),
            );
          },
          listener: (context, state) {}),
    );
  }
}
