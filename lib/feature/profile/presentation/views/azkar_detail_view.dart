import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/feature/profile/presentation/views/widgets/azkar_list_view.dart';
import 'package:zker/feature/profile/presentation/views/widgets/custom_switch.dart';


class AzkarDetailView extends StatelessWidget {
  const AzkarDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text( "ازكار الصباح",style: TextStyle(color: AppColors.white),),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(onPressed: (){
          context.pop();
        }, icon: Icon(Icons.arrow_back_ios,color: AppColors.white,)),
      ),
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          CustomSwitch(),
          SizedBox(height: 20,),
          AzkarListView()
          
        ],
      ),
    );
  }
}
