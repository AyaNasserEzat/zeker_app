import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/feature/profile/presentation/views/widgets/custom_container.dart';


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
    CustomContainer()
          
          ],
        ),
      ),
    );
  }
}