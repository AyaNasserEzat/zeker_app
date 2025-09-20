import 'package:adhan/adhan.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationServices {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future init() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static Future showNotification() async {
    const NotificationDetails android = NotificationDetails(
      android: AndroidNotificationDetails(
        "channelId",
        "channelName",
        importance: Importance.high,
        priority: Priority.high,
      ),
    );
    tz.initializeTimeZones();
    //tz.TZDateTime(tz.local, 2025);
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      '🕌 أذكار الصباح',
      'ابدأ يومك بذكر الله 🌞',

      tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),

      android,
      matchDateTimeComponents: DateTimeComponents.time,

      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  void cancleAllNotification() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  static Future<void> notification({
    required String title,
    required String body,
    required int id,
    required DateTime time,
  }) async {
        tz.initializeTimeZones();
    final tzTime = tz.TZDateTime.from(time, tz.local);
    const NotificationDetails android = NotificationDetails(
      android: AndroidNotificationDetails(
        "channelId",
        "channelName",
        importance: Importance.high,
        priority: Priority.high,
      ),
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,

      tzTime,

      android,
      matchDateTimeComponents: DateTimeComponents.time,

      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  // This will be called daily by AlarmManager
  @pragma('vm:entry-point')
  static Future<void> runDailyAzkarTask() async {
    tz.initializeTimeZones();
  // مهم جدًا إعادة التهيئة داخل isolate
  await NotificationServices.init();
    // Get location
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    final coordinates = Coordinates(position.latitude, position.longitude);
    final params = CalculationMethod.egyptian.getParameters();
    final prayerTimes = PrayerTimes.today(coordinates, params);

    // Schedule Fajr or Sunrise for Azkar Al-Sabah
final now = DateTime.now();
final testTime = now.add(Duration(minutes: 1));

await notification(
  id: 1,
  title: '🕌 أذكار الصباح',
  body: 'ابدأ يومك بذكر الله 🌞',
  time:     tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
);


    // // Schedule Asr for Azkar Al-Masa
    // await notification(
    //   id: 2,
    //   title: '🌇 أذكار المساء',
    //   body: 'لا تنسَ أذكار المساء 🕔',
    //   time: prayerTimes.asr,
    // );
  }
}
