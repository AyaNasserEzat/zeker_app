import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/feature/profile/presentation/cubits/evening_cubit/evening_cubit.dart';
import 'package:zker/feature/profile/presentation/cubits/evening_cubit/evening_state.dart';

import 'package:zker/feature/profile/presentation/views/widgets/azkar_list_view.dart';
import 'package:zker/feature/profile/presentation/views/widgets/custom_switch.dart';
import 'package:zker/feature/profile/presentation/views/widgets/riminder_dialog.dart';
import 'package:zker/services/notification_services.dart';

class EveningAzkarDetailsView extends StatelessWidget {
  const EveningAzkarDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text( "أذكار المساء",style: TextStyle(color: AppColors.white),),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(onPressed: (){
          context.pop();
        }, icon: Icon(Icons.arrow_back_ios,color: AppColors.white,)),
      ),
      backgroundColor: AppColors.white,
      body: Column(
        children: [
         CustomSwitch<EveningCubit, EveningAzkarState>(
  title: "تنبيهات المساء",
  isActiveSelector: (state) => state.isNotificationActive,
  onToggle: (context, value) {
    context.read<EveningCubit>().toggelIsActive(value);
    
  }, widget: RiminderDialog<EveningCubit, EveningAzkarState>(
  intervalSelector: (state) => state.interval,
  startTimeSelector: (state) => state.startTime,
  onStartTimePicked: (context, time) =>
      context.read<EveningCubit>().setStartTime(context, time),
  onIntervalChanged: (context, value) =>
      context.read<EveningCubit>().setInterval(value),
  onSave: (context, startTime) =>
      context.read<EveningCubit>().saveReminder(context, startTime,NotificationServices.azkarEveningList),
),
),

          SizedBox(height: 20,),
          AzkarListView(list: NotificationServices.azkarEveningList,)
          
        ],
      ),
    );
  }
}