import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:zker/core/utils/app_colors.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return   InkWell(
            onTap: () {
              context.push("/azkarDetailView");
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8),
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.white,
                  boxShadow: [BoxShadow(color: Color(0x40000000),offset: Offset(0, 1),blurRadius: 4)],
                  
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Row(
                    spacing: 10,
                    textDirection: TextDirection.rtl,
                    children: [
                      Icon(FlutterIslamicIcons.solidTasbih2),
                      Text("ازكار الصباح",style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}