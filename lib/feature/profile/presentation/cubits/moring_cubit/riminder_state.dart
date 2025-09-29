import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class RiminderState extends Equatable {
  // وقت البداية لإشعارات الأذكار
  final TimeOfDay? startTime;
  // وقت النهاية لإشعارات الأذكار
  final TimeOfDay? endTime;
  // الفاصل الزمني بين الإشعارات بالدقائق
  final int interval;
  // هل الإشعارات فعالة (مفعلة)
  final bool isNotificationActive;

  const RiminderState({
    this.startTime,
    this.endTime,
    this.interval=1,
    this.isNotificationActive = true,
  });
    RiminderState copyWith({
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    int? interval,
    bool? isNotificationActive,
  }) {
    return RiminderState(
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      interval: interval ?? this.interval,
      isNotificationActive: isNotificationActive ?? this.isNotificationActive,
    );
  }
  @override
  List<Object?> get props => [  startTime,
        endTime,
        interval,
        isNotificationActive,];



}