import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';

import '../constants/constants.dart';

Widget textField({
  bool isPass = false,
  required TextInputType type,
  required String label,
  required IconData prefixIcon,
  IconData? suffixIcon,
  Function()? suffixIconFunction,
  required TextEditingController controller,
}) {
  return TextFormField(
    style: const TextStyle(color: Colors.white),
    controller: controller,
    validator: (value) {
      if (value!.isEmpty) {
        return "$label Can't be empty";
      } else {
        return null;
      }
    },
    obscureText: isPass,
    keyboardType: type,
    decoration: InputDecoration(
        label: Text(
          label,
          style: TextStyle(color: HexColor("#ffffff")),
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.white,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            suffixIcon,
            color: Colors.white,
          ),
          onPressed: suffixIconFunction,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: HexColor("#ffffff"))),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: HexColor("#ffffff"), width: 3),
        )),
  );
}

Widget text({
  required String text,
  double fontSize = 17,
  Color fontColor = Colors.white,
  FontWeight fontWeight = FontWeight.w500,
  double height = 0,
  TextAlign textAlign = TextAlign.center,
}) {
  return Text(
    textAlign: textAlign,
    text,
    style: TextStyle(
      fontSize: fontSize.sp,
      color: fontColor,
      fontWeight: fontWeight,
      height: height,
    ),
  );
}

Widget defaultButton(context,
    {required String label,
    required double fontSize,
    Color? color,
    required Function() function}) {
  return Center(
    child: SizedBox(
      width: MediaQuery.of(context).size.width,
      child: MaterialButton(
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.all(10),
        color: color ?? secondaryColor,
        onPressed: function,
        child: Text(
          label,
          style: TextStyle(fontSize: fontSize.sp, color: Colors.black),
        ),
      ),
    ),
  );
}

Widget verticalSpace({required double space}) {
  return SizedBox(
    height: space.h,
  );
}

Widget horizontalSpace({required double space}) {
  return SizedBox(
    width: space.w,
  );
}

Future<bool?> toastMSG({required String text, required Color color}) {
  return Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0);
}

Future moveForward({required BuildContext context, required Widget page}) {
  return Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

Future moveForwardAndRemove(
    {required BuildContext context, required Widget page}) {
  return Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => page),
    (route) => false,
  );
}

void moveBackWord({required BuildContext context}) {
  return Navigator.pop(context);
}

Widget homePageCard(
  context, {
  required String mainText,
  required String description,
  required String image,
  required AlignmentGeometry imageAlignment,
  required AlignmentGeometry textAlignment,
  required double rightPadding,
  required Color color,
      required Function() function ,
  required double leftPadding,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10.h),
    child: InkWell(
      onTap: function,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 140.h,
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(30)),
        child: Stack(
          alignment: imageAlignment,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Image(
                // fit: BoxFit.cover,
                image: AssetImage(
                  image,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: rightPadding, left: leftPadding),
              child: Align(
                alignment: textAlignment,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      text(text: mainText, fontSize: 24.sp),
                      Text(
                        description,
                        overflow: TextOverflow.visible,
                        maxLines: 2,
                        style: TextStyle(fontSize: 14.sp),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
