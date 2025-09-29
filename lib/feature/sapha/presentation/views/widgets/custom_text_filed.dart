import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_colors.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({super.key, required this.hintText,required this.controller, this.validator,this.keyboardType});
final String hintText;
final TextEditingController controller;
final String? Function(String?)? validator;
final TextInputType? keyboardType; 
  @override
  Widget build(BuildContext context) {
    return  TextFormField
    (
      textDirection: TextDirection.rtl,
      keyboardType: keyboardType,
      controller: controller,
      validator:validator ,
decoration: InputDecoration(
  fillColor: AppColors.white,
  hintText:hintText,
  hintTextDirection: TextDirection.rtl,
  hintMaxLines: 5,

border: OutlineInputBorder(
  borderSide: BorderSide(color: AppColors.black),
  borderRadius: BorderRadius.circular(15)
),
enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.black),
  borderRadius: BorderRadius.circular(15),
  
),
focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.black),
  borderRadius: BorderRadius.circular(15),
  
),
),


    );
  }
}