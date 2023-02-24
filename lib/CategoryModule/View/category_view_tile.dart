import 'package:flutter/material.dart';
import 'package:podcast/CategoryModule/Model/catevory_model.dart';
import 'package:podcast/utlis/AppText/AppTextView.dart';

Widget categoryViewTile({required CategoryModel categoryModel}) {
  return Container(
    alignment: Alignment.bottomCenter,
    height: 100,
    width: 50,
    decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
        ),
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
            image: AssetImage(categoryModel.image), fit: BoxFit.cover)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AppText.customText(
            title: categoryModel.name.toUpperCase(),
            color: Colors.white,
            fontWeight: FontWeight.bold,
            size: 20),
        const SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}
