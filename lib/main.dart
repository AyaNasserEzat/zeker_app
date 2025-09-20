import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:zker/core/routs/app_router.dart';
import 'package:zker/core/utils/hive_box.dart';


import 'package:zker/feature/home/presentation/views/widgets/bottom_nav_bar.dart';
import 'package:zker/feature/sapha/data/models/ziker_model/ziker_model.dart';
import 'package:zker/firebase_options.dart';
import 'package:zker/services/android_alarm_manager_plus_service.dart';
import 'package:zker/services/notification_services.dart';
import 'package:zker/services/push_notification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await PushNotification.init();
  // await NotificationServices.init();

// await AndroidAlarmManagerPlusService.initAndroidAlarmManager();
// await AndroidAlarmManagerPlusService.scheduledDailyNotification();

  // init hive
  await Hive.initFlutter();

  // register adapter
 Hive.registerAdapter(ZikerModelAdapter());

  // open box
  await Hive.openBox<ZikerModel>(HiveBoxes.ziker);



  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  return  ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
   
    );}
    );
  }
}