import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget musicTitle({required String name}) {
  return Text(

    name,
    overflow: TextOverflow.ellipsis,
    maxLines: 2,
    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,),
  );
}
