import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/feature/profile/presentation/cubits/moring_cubit/rimider_cubit.dart';
import 'package:zker/feature/profile/presentation/cubits/moring_cubit/riminder_state.dart';
import 'package:zker/feature/profile/presentation/views/widgets/azkar_list_view.dart';
import 'package:zker/feature/profile/presentation/views/widgets/custom_switch.dart';
import 'package:zker/feature/profile/presentation/views/widgets/riminder_dialog.dart';
import 'package:zker/services/notification_services.dart';


class MorningAzkarDetailView extends StatelessWidget {
  const MorningAzkarDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text( "أذكار الصباح",style: TextStyle(color: AppColors.white),),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(onPressed: (){
          context.pop();
        }, icon: Icon(Icons.arrow_back_ios,color: AppColors.white,)),
      ),
      backgroundColor: AppColors.white,
      body: Column(
        children: [
    CustomSwitch<RimiderMoringCubit, RiminderState>(
  title: "تنبيهات الصباح",
  widget: RiminderDialog<RimiderMoringCubit, RiminderState>(
  intervalSelector: (state) => state.interval,
  startTimeSelector: (state) => state.startTime,
  onStartTimePicked: (context, time) =>
      context.read<RimiderMoringCubit>().setStartTime(context, time),
  onIntervalChanged: (context, value) =>
      context.read<RimiderMoringCubit>().setInterval(value),
  onSave: (context, startTime) =>
      context.read<RimiderMoringCubit>().saveReminder(context, startTime,NotificationServices.morningazkarList),
)
,
  isActiveSelector: (state) => state.isNotificationActive,
  onToggle: (context, value) {
    context.read<RimiderMoringCubit>().toggelIsActive(value);
    
  },
),

          SizedBox(height: 20,),
          AzkarListView(list: NotificationServices.morningazkarList,)
          
        ],
      ),
    );
  }
}
