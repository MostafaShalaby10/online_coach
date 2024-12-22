import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_coach/logic/supplements/supplements_cubit.dart';
import 'package:online_coach/presentation/admin/add_supplements.dart';
import 'package:online_coach/shared/components/components.dart';

class ShowSupplements extends StatelessWidget {
  final String uid;

  final bool isAdmin;

  const ShowSupplements({super.key, required this.uid, required this.isAdmin});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SupplementsCubit()..getSupplementsCubit(userId: uid),
      child: BlocConsumer<SupplementsCubit, SupplementsState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(),
              body: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ConditionalBuilder(
                    condition: state is! LoadingGetSupplementsState,
                    builder: (context) => Column(
                          children: [
                            if (SupplementsCubit.get(context)
                                .supplementsData
                                .isNotEmpty)
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: ListView.separated(
                                      itemBuilder: (context, index) => Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Center(
                                                child: text(
                                                    text: SupplementsCubit.get(
                                                                    context)
                                                                .supplementsData[
                                                            0][index]
                                                        ["supplementsName"],
                                                    fontSize: 24,
                                                    fontColor:HexColor("#26619C"),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              text(
                                                  text: SupplementsCubit.get(
                                                              context)
                                                          .supplementsData[0]
                                                      [index]["quantity"]),
                                            ],
                                          ),
                                      separatorBuilder: (context, index) =>
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 1.h,
                                            color: Colors.black,
                                          ),
                                      itemCount: SupplementsCubit.get(context)
                                          .supplementsData[0]
                                          .length),
                                ),
                              ),
                            if (SupplementsCubit.get(context)
                                .supplementsData
                                .isEmpty)
                              text(text: "There is no supplements"),
                            if (isAdmin)
                              defaultButton(context,
                                  label: "Add supplements",
                                  fontSize: 20,
                                  function: () {
                                    moveForward(
                                        context: context,
                                        page: AddSupplements(uid: uid));
                                  })
                          ],
                        ),
                    fallback: (context) =>
                        const Center(child: CircularProgressIndicator())),
              ),
            );
          },
          listener: (context, state) {}),
    );
  }
}
