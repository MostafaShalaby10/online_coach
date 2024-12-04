import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_coach/shared/components/components.dart';

class Days extends StatelessWidget {
  const Days({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Column(
              children: [
                InkWell(
                  onTap: (){},
                  child: SizedBox(
                    height: 90.h,
                    width: MediaQuery.of(context).size.width,
                    child: Center(child: text(text: "Day 1\n 1/12/2024" , fontSize: 25)),
                  ),
                ),
                verticalSpace(space: 20),
                InkWell(
                  onTap: (){},
                  child: SizedBox(
                    height: 90.h,
                    width: MediaQuery.of(context).size.width,
                    child: Center(child: text(text: "Day 2\n 1/12/2024" , fontSize: 25)),
                  ),
                ),
                verticalSpace(space: 20),
                InkWell(
                  onTap: (){},
                  child: SizedBox(
                    height: 90.h,
                    width: MediaQuery.of(context).size.width,
                    child: Center(child: text(text: "Day 3\n 1/12/2024" , fontSize: 25)),
                  ),
                ),
                verticalSpace(space: 20),
                InkWell(
                  onTap: (){},
                  child: SizedBox(
                    height: 90.h,
                    width: MediaQuery.of(context).size.width,
                    child: Center(child: text(text: "Day 4\n 1/12/2024" , fontSize: 25)),
                  ),
                ),
                verticalSpace(space: 20),
                InkWell(
                  onTap: (){},
                  child: SizedBox(
                    height: 90.h,
                    width: MediaQuery.of(context).size.width,
                    child: Center(child: text(text: "Day 5\n 1/12/2024" , fontSize: 25)),
                  ),
                ),
                verticalSpace(space: 20),
                InkWell(
                  onTap: (){},
                  child: SizedBox(
                    height: 90.h,
                    width: MediaQuery.of(context).size.width,
                    child: Center(child: text(text: "Day 6\n 1/12/2024" , fontSize: 25)),
                  ),
                ),
                verticalSpace(space: 20),
                InkWell(
                  onTap: (){},
                  child: SizedBox(
                    height: 90.h,
                    width: MediaQuery.of(context).size.width,
                    child: Center(child: text(text: "Day 7\n 1/12/2024" , fontSize: 25)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
