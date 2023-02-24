import 'package:flutter/material.dart';
import 'package:podcast/utlis/Constants/AppConfig.dart';

class SearchTextField extends StatelessWidget {
  TextEditingController controller;
  final TextAlign textAlign;
  final TextInputType keyboardType;
  double? width;
  Widget? prefixIcon;
  Function onComplete;
  final String hintText;
TextInputAction textInputAction;
  SearchTextField(
      {Key? key,
      required this.textInputAction,
      required this.controller,
      required this.hintText,
      required this.textAlign,
      required this.onComplete,
      this.width = double.infinity,
      this.prefixIcon = const SizedBox(),
      required this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: width,
      child: TextField(
        
        style: const TextStyle(
          fontSize: 12,
        ),
textInputAction: textInputAction,
        textAlign: textAlign,
        keyboardType: keyboardType,
        cursorColor: Colors.grey,
        onSubmitted: (value){
          onComplete();
        },
        decoration: InputDecoration(
            prefixIconConstraints: BoxConstraints(
              minWidth: AppConfig(context).width * 0.1,
              minHeight: AppConfig(context).width * 0.1,
            ),
            prefixIcon: prefixIcon,
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: Colors.black,
                )),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
        controller: controller,
        
        // onSubmitted: messageController.handleSubmitted,
      ),
    );
  }
}
