import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget musicTitle({required String name}) {
  return Text(
    name,
    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
  );
}
