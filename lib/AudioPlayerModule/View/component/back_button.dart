import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

Widget backButton(BuildContext context, {required VoidCallback? onBack}) {
  return SizedBox(
    height: 50,
    child: InkWell(
      radius: 50,
      onTap: onBack,
      child: Icon(
        Icons.keyboard_arrow_left,
        size: 50,
        color: Colors.black,
      ),
    ),
  );
}
