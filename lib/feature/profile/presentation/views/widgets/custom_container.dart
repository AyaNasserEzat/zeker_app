import 'package:flutter/material.dart';

import 'package:zker/core/utils/app_colors.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.text, required this.icon, this.onTap});
final String text;
final IconData icon;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return   InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8),
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.white,
                  boxShadow: [BoxShadow(color: Color(0x40000000),offset: Offset(0, 1),blurRadius: 4)],
                  
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    textDirection: TextDirection.rtl,
                    children: [
                      Icon(icon,color: AppColors.primaryColor,),
                      Text(text,style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.primaryColor),),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}