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
      appBar: AppBar(

      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Image(
            fit: BoxFit.cover,
            image: NetworkImage("https://s3-alpha-sig.figma.com/img/09a2/cebe/5e188ff8ed9974f2103aa922b218489b?Expires=1736121600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=QeQhpVB0RevfnLIQ7JlWkmJbX6aYogU5my3q6ycmxrDFrDnSwQZDk14wMwuOcW~jQXmEo0Yqy1UeXya1LXb-DuuYOmt1~Ub7fz5Mp7H0P-mvp5wkAz9TBV9vSBs8CLvr-4dd3U3bQHKViAGgR27usiofNToHzexHvdcm9JNXsHbbceP5n3ZuI19Vew-9CmZfx9RNTQ-BHyjVD99mI3b7svEvH6QfLuuf8tPCo~4sKEsR4sM~Nlldaqb3Vxzpq~-vluDGFX6AjaDi1dBYgR0qaURe6RoQ9U~eq8aT-c9ctu27bWd~WT4hoWij6IY1NX~6qO5qzwgkphLek0VSuqlm1g__"),
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
