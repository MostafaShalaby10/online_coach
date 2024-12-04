import 'package:flutter/material.dart';
import 'package:online_coach/shared/components/components.dart';

class TipsPage extends StatelessWidget {
  const TipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text(
                  text: "WATER INTAKE ( 4 – 6 ) liter daily.",
                  fontSize: 20,
                  fontWeight: FontWeight.w900),
              verticalSpace(space: 20),
              text(
                  text: "Sleeping TIME (8_10 ) hour daily.",
                  fontSize: 20,
                  fontWeight: FontWeight.w900),
              verticalSpace(space: 20),
              text(
                  text: "SALT INTAKE ( 2_ 5 ) gram daily.",
                  fontSize: 20,
                  fontWeight: FontWeight.w900),
              verticalSpace(space: 5),
              text(
                            text: "Prefer to put it after preparation not during it  .",
                            fontSize: 15,
                            fontColor: Colors.grey.shade400,
                          ),
              verticalSpace(space: 20),
              text(
                  text: "Snacks", fontSize: 20, fontWeight: FontWeight.w900),
              verticalSpace(space: 20),
              text(
                  text: "Coffee - Green tea - Cinnamon ",
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
              verticalSpace(space: 20),
              text(
                  text:
                      "Spices such as black pepper - Turmeric - Chili - paprika ",
                  fontSize: 17,
                  fontWeight: FontWeight.w700 , textAlign: TextAlign.start),
              verticalSpace(space: 20),
              text(
                  text: "Chicken - Meat - Fish ",
                  fontSize: 17,
                  fontWeight: FontWeight.w700),
              verticalSpace(space: 20),
              text(
                  text: "Onion - Mushroom - Garlic ",
                  fontSize: 17,
                  fontWeight: FontWeight.w700),
              verticalSpace(space: 20),
              text(
                  text: "Pepsi Diet (1-2) cans daily ",
                  fontSize: 17,
                  fontWeight: FontWeight.w700),
              verticalSpace(space: 20),
              text(
                  text:
                      "Olive oil can be used in cooking, but in small quantities not exceeding 5 grams. ",
                  fontSize: 17,
                  fontWeight: FontWeight.w700 , textAlign: TextAlign.start),
            ],
          ),
        ),
      ),
    );
  }
}
