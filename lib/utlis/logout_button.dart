import 'package:flutter/material.dart';
import 'package:podcast/utlis/Constants/AppConfig.dart';
import 'package:podcast/utlis/primary_button.dart';

onLogout({
  required BuildContext context,
  required String title,
  required String discription,
  double height = 175.0,
  required Function callback,
  String activeButtonText = "Yes"
}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            height: height,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        title, //
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child:   Text(
                          discription, //
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,),

                        ),
                      ),
                      const SizedBox(
                        height: 0,
                      ),
                    ],
                  ),
                ),
                // const Divider(
                //   thickness: 1.2,
                //   height: 0,
                //   color: AppColor.grey,
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      primeryButton(
                        title: "Cancel",

                        heightButton: 45,
                        widthButton: AppConfig(context).width / 3,
                        callback: () {
                          Navigator.pop(context);
                        },
                      ),
                      primeryButton(
                        title: activeButtonText,
                        heightButton: 45,

                        widthButton: AppConfig(context).width / 3,
                        callback: () {

                          callback();
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                // GestureDetector(
                //   onTap: () {
                //     Navigator.pop(context);
                //   },
                //   child: Container(
                //     width: double.infinity,
                //     height: 50,
                //     color: AppColor.transparent,
                //     child: Center(
                //       child: appText(
                //         text: "Ok",
                //         fontsize: 20,
                //         color: AppColor.primarycolor,
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
              ],
            ),
          ),
        );
      });
}
