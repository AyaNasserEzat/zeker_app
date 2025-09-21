import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/feature/profile/presentation/views/widgets/riminder_dialog.dart';
import 'package:zker/services/notification_services.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return RiminderDialog();
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0,right: 8),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.2),
                offset: Offset(1, 1),
              ),
            ],
          ),
          child: Row(
            
            spacing: 10,
            textDirection: TextDirection.rtl,
            children: [
         IconButton(
              onPressed: () async {
               
              },
              icon: Icon(Icons.notifications_active),
            ),
           Text("التنبيهات",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
           Spacer(),
         Switch(value: false, onChanged: (v) {}),
            ],
          )
        ),
      ),
    );
  }
}
