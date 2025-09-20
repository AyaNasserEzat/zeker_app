import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_colors.dart';

class AddBtn extends StatelessWidget {
  const AddBtn({super.key,required this.onPressed, required this.text});
 final void Function()? onPressed;
 final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor, // لون الزر
            foregroundColor: Colors.white, // لون النص والأيقونات
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
      ),
      onPressed: onPressed, child: Text(text));
  }
}
