import 'package:flutter/material.dart';
import 'package:podcast/utlis/AppText/AppTextView.dart';

Widget primeryButton({
  Function? callback,
  required String title,
  double widthButton = 100,
  double heightButton = 50,
  bool active = true,
  Color buttonColor = Colors.grey,
}) {
  return GestureDetector(
    onTap: () {
      callback!();
    },
    child: Container(
      height: heightButton,
      width: widthButton, //size.width / 2.8,
      decoration: BoxDecoration(
          color: active ? buttonColor :Colors.grey,
          border: Border.all(
            color: buttonColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: AppText.customText(
            title: title,
            fontWeight: FontWeight.w400,
            color: !active ? buttonColor : Colors.white,
          )),
    ),
  );
}
