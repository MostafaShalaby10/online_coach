import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_coach/shared/components/components.dart';

class TipsPage extends StatelessWidget {
  const TipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            moveBackWord(context: context);
          },
          icon: const Icon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.black,
            size: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Image(
            fit: BoxFit.cover,
            image: AssetImage("assets/tips.png"),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25)
              ),
              color: HexColor("#292929"),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: text(
                            text: "Tips",
                            fontColor: HexColor("#CDFB47"),
                            fontSize: 30)),
                    text(
                        text: "WATER INTAKE ( 4 – 6 ) liter daily.",
                        fontSize: 15.sp,
                        fontColor: Colors.white,
                        fontWeight: FontWeight.w500),
                    verticalSpace(space: 20),
                    text(
                        text: "Sleeping TIME (8_10 ) hour daily.",
                        fontColor: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500),
                    verticalSpace(space: 20),
                    text(
                        text: "SALT INTAKE ( 2_ 5 ) gram daily.",
                        fontColor: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500),
                    verticalSpace(space: 5),
                    text(
                      text:
                          "Prefer to put it after preparation not during it  .",
                      fontSize: 15.sp,
                      fontColor: Colors.grey.shade400,
                        fontWeight: FontWeight.w300
                    ),
                    verticalSpace(space: 20),
                    text(
                        text: "Coffee - Green tea - Cinnamon ",
                        fontColor: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500),
                    verticalSpace(space: 20),
                    text(
                        text:
                            "Spices such as black pepper - Turmeric - Chili - paprika ",
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        fontColor: Colors.white,
                        textAlign: TextAlign.start),
                    verticalSpace(space: 20),
                    text(
                        text: "Chicken - Meat - Fish ",
                        fontColor: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500),
                    verticalSpace(space: 20),
                    text(
                        text: "Onion - Mushroom - Garlic ",
                        fontColor: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500),
                    verticalSpace(space: 20),
                    text(
                        text: "Pepsi Diet (1-2) cans daily ",
                        fontColor: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500),
                    verticalSpace(space: 20),
                    text(
                        text:
                            "Olive oil can be used in cooking, but in small quantities not exceeding 5 grams. ",
                        fontColor: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.start),
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
