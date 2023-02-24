import 'package:flutter/cupertino.dart';

import '../../../utlis/Constants/AppConfig.dart';

Widget backDropFilterImage(BuildContext context) {
  return Image.network(
    "https://www.indiewire.com/wp-content/uploads/2020/12/podcasting-gear.jpeg?resize=1024,699",
    fit: BoxFit.fill,
    width: AppConfig(context).width,
    height: AppConfig(context).height / 2.1,
  );
}
