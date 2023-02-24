import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AppText {


  static Widget customText(
      {TextAlign alignment = TextAlign.start,
      required String title,
      double letterspace = 0.0,
      Color color = Colors.black,
      double size = 15,
      double height = 1.2,
      TextOverflow overflow = TextOverflow.visible,
      FontWeight fontWeight = FontWeight.w500}) {
    return Text(
      title,
      textAlign: alignment,
      style: TextStyle(
        fontFamily: 'Avenir',
        overflow: overflow,
        color: color,
        letterSpacing: letterspace,
        fontWeight: fontWeight,
        height: height,
        fontSize: size,
      ),
    );
  }

  static Widget customTextButton(
      {TextAlign alignment = TextAlign.start,
      required String title,
      Color color = Colors.black,
      double size = 15,
      required VoidCallback callBack,
      FontWeight fontWeight = FontWeight.w500}) {
    return TextButton(
      onPressed: () {
        callBack();
      },
      child: Text(
        title,
        textAlign: alignment,
        style: TextStyle(
          fontFamily: 'Avenir',
          color: color,
          fontWeight: fontWeight,
          fontSize: size,
        ),
      ),
    );
  }
}
