import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget playerButton({VoidCallback? onPressed, required String iconUrl, double iconSize = 32.0}) {
  return IconButton(
      onPressed: onPressed,
      icon: ImageIcon(
        AssetImage(iconUrl),
        color: Colors.black,
        
      ),
      iconSize: iconSize,
      );
}
