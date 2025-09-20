import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:zker/services/notification_services.dart';

class AndroidAlarmManagerPlusService {
  static Future<void> initAndroidAlarmManager() async {
    await AndroidAlarmManager.initialize();
  }
  // Schedule daily job every 24h

 static Future<void> scheduledDailyNotification() async {
  
    await AndroidAlarmManager.periodic(
      Duration(seconds: 15),
      22,
NotificationServices.runDailyAzkarTask
 ,
      wakeup: true,
      exact: true,
      startAt: DateTime.now().add(const Duration(seconds: 10)),
    );
  }
}
