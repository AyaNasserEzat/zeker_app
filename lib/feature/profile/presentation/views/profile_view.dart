import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/feature/profile/presentation/views/widgets/custom_container.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold
    (
      backgroundColor: AppColors.white,
      appBar: AppBar(title: Text('أذكار',style: TextStyle(color: AppColors.white),),centerTitle: true,backgroundColor: AppColors.primaryColor,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 15,
          children: [
    CustomContainer(text: "أذكار الصباح",icon: LucideIcons.sun,onTap: () {
      context.push("/azkarDetailView");
    },),
              CustomContainer(text: "أذكار المساء",icon: LucideIcons.moon,onTap: () {
                context.push("/EveningAzkarDetailsView");
              },)
          ],
        ),
      ),
    );
  }
}