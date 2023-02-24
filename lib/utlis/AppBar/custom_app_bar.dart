import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:podcast/utlis/AppText/AppTextView.dart';
import 'package:podcast/utlis/Constants/AppConfig.dart';

Widget customAppBar({required String text,required BuildContext context}) {
  return Container(
    height: 50,
    color: Colors.white,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: AppText.customText(
            title: text,
            color: Colors.black,
            size: 20,
            overflow: TextOverflow.ellipsis),
      ),
    ),
  );
}
