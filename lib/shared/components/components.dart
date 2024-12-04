import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants/constants.dart';

Widget textField({
  bool isPass = false,
  required TextInputType type,
  required String label,
  required IconData prefixIcon,
  IconData? suffixIcon,
  Function()? suffixIconFunction,
}) {
  return TextFormField(
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
      label: Text(label),
      prefixIcon: Icon(prefixIcon),
      suffixIcon: IconButton(
        icon: Icon(suffixIcon),
        onPressed: suffixIconFunction,
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: primaryColor)),
    ),
  );
}

Widget text({
  required String text,
  double fontSize = 17,
  Color fontColor = Colors.black,
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

Widget defaultButton(
    {required String label,
    required double fontSize,
    required Function() function}) {
  return MaterialButton(
    shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
    padding: const EdgeInsets.all(10),
    color: secondaryColor,
    onPressed: function,
    child: Text(
      label,
      style: TextStyle(fontSize: fontSize.sp),
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
    height: space.w,
  );
}

Future<bool?> toastMSG({required String text, required Color color}) {
  return Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
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
    MaterialPageRoute(
        builder: (context) =>  page),
        (route) => false,
  );
}

void moveBackWord({required BuildContext context}){
  return Navigator.pop(context) ;
}