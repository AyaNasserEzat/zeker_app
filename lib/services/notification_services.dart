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
static List<String> morningazkarList = [
 "أصبحنا وأصبح الملك لله، والحمد لله، لا إله إلا الله وحده لا شريك له، له الملك وله الحمد وهو على كل شيء قدير 🌅",
  "اللهم إني أسألك خير هذا اليوم: فتحه، ونصره، ونوره، وبركته، وهداه، وأعوذ بك من شر ما فيه وشر ما بعده 🤲",
  "أصبحنا وأصبح الملك لله رب العالمين، اللهم إني أسألك خير هذا اليوم فتحه ونصره ونوره وبركته وهداه ☀️",
  "رضيت بالله ربًا، وبالإسلام دينًا، وبمحمد ﷺ نبيًا ورسولًا 💚",
  "اللهم ما أصبح بي من نعمة أو بأحد من خلقك فمنك وحدك لا شريك لك، فلك الحمد ولك الشكر 🌸",
  "اللهم بك أصبحنا، وبك أمسينا، وبك نحيا، وبك نموت، وإليك النشور 🙌",
  "حسبي الله لا إله إلا هو عليه توكلت وهو رب العرش العظيم (7 مرات) 🛡️",
  "بسم الله الذي لا يضر مع اسمه شيء في الأرض ولا في السماء وهو السميع العليم (3 مرات) ✨",
  "أعوذ بكلمات الله التامات من شر ما خلق (3 مرات) 🕊️",
  "اللهم إني أصبحت أشهدك وأشهد حملة عرشك وملائكتك وجميع خلقك أنك أنت الله لا إله إلا أنت وحدك لا شريك لك وأن محمدًا عبدك ورسولك (4 مرات) 🌿",
  "سبحان الله وبحمده (100 مرة) 🌟",
  "لا إله إلا الله وحده لا شريك له، له الملك وله الحمد وهو على كل شيء قدير (100 مرة) 🕋",
  "أستغفر الله وأتوب إليه (100 مرة) 💧",
  "اللهم صل وسلم على نبينا محمد (10 مرات أو أكثر) ﷺ",
];
static List<String> azkarEveningList = [
  "أمسينا وأمسى الملك لله، والحمد لله، لا إله إلا الله وحده لا شريك له، له الملك وله الحمد وهو على كل شيء قدير 🌙",
  "اللهم إني أسألك خير هذه الليلة: فتحها، ونصرها، ونورها، وبركتها، وهداها، وأعوذ بك من شر ما فيها وشر ما بعدها 🤲",
  "أمسينا على فطرة الإسلام، وعلى كلمة الإخلاص، وعلى دين نبينا محمد ﷺ، وعلى ملة أبينا إبراهيم حنيفًا مسلمًا وما كان من المشركين 💚",
  "رضيت بالله ربًا، وبالإسلام دينًا، وبمحمد ﷺ نبيًا ورسولًا 🌿",
  "اللهم ما أمسى بي من نعمة أو بأحد من خلقك فمنك وحدك لا شريك لك، فلك الحمد ولك الشكر 🌸",
  "اللهم بك أمسينا، وبك أصبحنا، وبك نحيا، وبك نموت، وإليك المصير 🙌",
  "حسبي الله لا إله إلا هو عليه توكلت وهو رب العرش العظيم (7 مرات) 🛡️",
  "بسم الله الذي لا يضر مع اسمه شيء في الأرض ولا في السماء وهو السميع العليم (3 مرات) ✨",
  "أعوذ بكلمات الله التامات من شر ما خلق (3 مرات) 🕊️",
  "اللهم إني أمسيت أشهدك وأشهد حملة عرشك وملائكتك وجميع خلقك أنك أنت الله لا إله إلا أنت وحدك لا شريك لك وأن محمدًا عبدك ورسولك (4 مرات) 🌙",
  "سبحان الله وبحمده (100 مرة) 🌟",
  "لا إله إلا الله وحده لا شريك له، له الملك وله الحمد وهو على كل شيء قدير (100 مرة) 🕋",
  "أستغفر الله وأتوب إليه (100 مرة) 💧",
  "اللهم صل وسلم على نبينا محمد (10 مرات أو أكثر) ﷺ",
];

  static Future showNotification(DateTime start,DateTime end,Duration interval,List azkarList,int baseId) async {

    const NotificationDetails android = NotificationDetails(
      android: AndroidNotificationDetails(
        "channelId",
        "channelName",
        importance: Importance.high,
        priority: Priority.high,
      ),
    );
    tz.initializeTimeZones();
   tz.TZDateTime scheduledTime= tz.TZDateTime.from(start,tz.local);
    for (var i = 0; i< azkarList.length ;i++) {
  await flutterLocalNotificationsPlugin.zonedSchedule(
    baseId+i,
    ' أذكار الصباح والمساء',
    azkarList[i],
  
   // tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
  scheduledTime,
    android,
    matchDateTimeComponents: DateTimeComponents.time,
  
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
  );
    // نزود الوقت بالفاصل اللي حدده اليوزر
    scheduledTime = scheduledTime.add(interval);
}
  }

 static void cancleAllNotification(int ids) async {
for(int i=ids+100;i<200+ids;i++){
      await flutterLocalNotificationsPlugin.cancel(i);
}
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
  title: ' أذكار الصباح والمساء' ,
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
