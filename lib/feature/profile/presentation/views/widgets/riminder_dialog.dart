import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zker/feature/sapha/presentation/views/widgets/add_btn.dart';
import 'package:zker/services/notification_services.dart';

class RiminderDialog extends StatefulWidget {
  const RiminderDialog({super.key});

  @override
  State<RiminderDialog> createState() => _RiminderDialogState();
}

class _RiminderDialogState extends State<RiminderDialog> {
  DateTime? start;
      Duration interval = const Duration(minutes: 1); 
   DateTime? end;
  
  Duration selectedInterval = const Duration(minutes: 3);

  final List<Duration> intervals = [
    const Duration(minutes: 1),
    const Duration(minutes: 3),
    const Duration(minutes: 5),
    const Duration(minutes: 10),
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
             
      height: 200,
          child: Column(
            spacing: 15,
            children: [
              const Text("اختر وقت التنبيه"),
            
              Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  InkWell(
                    onTap: () async{
                       TimeOfDay? pickedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (pickedTime != null) {
                DateTime now = DateTime.now();
            setState(() {
                 start = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  pickedTime.hour,
                  pickedTime.minute,
                );
            });
                 end = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  pickedTime.hour,
                  pickedTime.minute,
                );

 if(start!.isBefore(now)){
  start!.add(Duration(days: 1));
 }
                print(
                  "جدولة الإشعارات من ${start.toString()} لحد ${end.toString()}",
                );

              
              }
                    },
                    child: Text(start != null
                        ? "البداية: ${start!.hour}:${start!.minute}"
                        : "اختر بداية التنبيه"),),
                  Text(" 12.00 :نهاية التنبيه"),
                ],
              ),
              
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  const Text(": التنبيه كل "),
                  DropdownButton<Duration>(
                    value: selectedInterval,
                    items: intervals.map((duration) {
                      return DropdownMenuItem<Duration>(
                        value: duration, // 🔑 لازم نحدد value
                        child: Text("${duration.inMinutes} دقيقة"),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedInterval = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  AddBtn(onPressed: ()async{
  await NotificationServices.showNotification(
                  start!,
                  end!,
                  interval,
                );

                  }, text: "حفظ"),
                           AddBtn(onPressed: (){
                            context.pop();
                           }, text: "الغاء")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
