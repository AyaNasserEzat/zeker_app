import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/services/notification_services.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold
    (
      backgroundColor: AppColors.white,
      appBar: AppBar(title: Text('ازكار',style: TextStyle(color: AppColors.white),),centerTitle: true,backgroundColor: AppColors.primaryColor,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
          InkWell(
            onTap: () {
              context.push("/azkars");
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8),
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.white,
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(.2),offset: Offset(1, 1))],
                  
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
          ),
          
          ],
        ),
      ),
    );
  }
}