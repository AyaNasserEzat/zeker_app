import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zker/feature/profile/presentation/cubits/riminder_state.dart';
import 'package:zker/services/notification_services.dart';

class RimiderMoringCubit extends Cubit<RiminderState> {
  RimiderMoringCubit() : super(RiminderState());

  void setStartTime(BuildContext context, TimeOfDay pickedTime) {
       final now = DateTime.now();

      final pickedDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        pickedTime.hour,
        pickedTime.minute,
      );
    DateTime finalStartTime = pickedDateTime;

    if (finalStartTime.isBefore(now)) {
      finalStartTime = finalStartTime.add(const Duration(days: 1));
    }
    emit(state.copyWith(startTime: pickedTime));
      debugPrint("البداية: $finalStartTime | النهاية: $finalStartTime");
  }

  void setEndTime(TimeOfDay time) {
    emit(state.copyWith(endTime: time));
  }

  void setInterval(int minutes) {
    emit(state.copyWith(interval: minutes));
  }

  void toggelIsActive(bool isOn){
  isOn!=isOn;
  emit(state.copyWith(isNotificationActive: isOn));
  }


  /// يحفظ الإشعار
  Future<void> saveReminder(BuildContext context,TimeOfDay startTime) async {
   
      final now = DateTime.now();
      final startTimeDateTime = DateTime(
        now.year,
        now.month,
        now.day,
      startTime.hour,
        startTime.minute,
      );
      // final endTimeDateTime = DateTime(
      //   now.year,
      //   now.month,
      //   now.day,
      //   state.endTime!.hour,
      //   state.endTime!.minute,
      // );

      await NotificationServices.showNotification(
        startTimeDateTime,
        startTimeDateTime,
     Duration(minutes:    state.interval!),
      );
      // إغلاق مربع الحوار بعد الحفظ
      context.pop();
    
  }

}
