import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotification {
static FirebaseMessaging messaging=FirebaseMessaging.instance;
static Future init()async{
  await messaging.requestPermission();
String ?token=  await messaging.getToken();
print(token);
FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
}
static Future<void> handleBackgroundMessage(RemoteMessage message)async{
await  Firebase.initializeApp();
print(message.notification!.title);

}


}