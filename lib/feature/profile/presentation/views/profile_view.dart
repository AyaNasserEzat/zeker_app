import 'package:flutter/material.dart';
import 'package:zker/services/notification_services.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold
    (
      appBar: AppBar(title: Text('Profile'),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              leading: IconButton(onPressed: (){
                NotificationServices.showNotification();
              }, icon: Icon(Icons.notifications_active)),
              title: Text("notifications"),
              trailing: Switch(value: false, onChanged: (v){
                
              }),
            )
          ],
        ),
      ),
    );
  }
}