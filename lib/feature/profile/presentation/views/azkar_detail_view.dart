import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/feature/profile/presentation/views/widgets/custom_switch.dart';
import 'package:zker/services/notification_services.dart';

class AzkarDetailView extends StatelessWidget {
  const AzkarDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text( "ازكار الصباح",style: TextStyle(color: AppColors.white),),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          CustomSwitch(),
          SizedBox(height: 20,),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8),
                  child: Container(
                    width: double.infinity,

                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.white,
                      boxShadow: [BoxShadow(color: AppColors.black.withOpacity(.2),offset: Offset(1, 2))]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0,left: 8),
                      child: Text(NotificationServices.azkarList[index]),
                    )),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 20);
              },
              itemCount: NotificationServices.azkarList.length,
            ),
          ),
        ],
      ),
    );
  }
}
