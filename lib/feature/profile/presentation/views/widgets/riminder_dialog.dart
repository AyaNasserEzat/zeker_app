import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zker/feature/profile/presentation/cubits/rimider_cubit.dart';
import 'package:zker/feature/profile/presentation/cubits/riminder_state.dart';
import 'package:zker/feature/sapha/presentation/views/widgets/add_btn.dart';


class RiminderDialog extends StatelessWidget {
  const RiminderDialog({super.key});

  @override
  Widget build(BuildContext context) {
    // final reminderCubit = context.read<RimiderMoringCubit>();
    final List<int> availableIntervals = const [
  1,
  3,
  5,
  10

    ];

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 220,
          child: BlocBuilder<RimiderMoringCubit, RiminderState>(
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "اختر وقت التنبيه",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
    
                  /// صف لاختيار البداية والنهاية
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () async {
                          final pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (pickedTime != null) {
                            context.read<RimiderMoringCubit>().setStartTime(context, pickedTime);
                          }
                        },
                        child: Text(
                          state.startTime != null
                              ? "البداية: ${state.startTime!.hour}:${state.startTime!.minute.toString()}"
                              : "اختر بداية التنبيه",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
    
                  /// اختيار المدة بين التنبيهات
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      const Text(": التنبيه كل "),
                      DropdownButton<int>(
                        value: state.interval,
                        items: availableIntervals.map((duration) {
                          return DropdownMenuItem<int>(
                            value: duration,
                            child: Text("$duration دقيقة"),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            context.read<RimiderMoringCubit>().setInterval(value);
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
    
                  /// أزرار الحفظ والإلغاء
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AddBtn(
                        onPressed: () {
                         if(state.startTime!=null){
context.read<RimiderMoringCubit>().saveReminder(context,state.startTime!);
                         } 
                         else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("من فضلك اختر وقت البداية")),
      );
    }
                        } ,
                        text: "حفظ",
                      ),
                      const SizedBox(width: 10),
                      AddBtn(
                        onPressed: () => context.pop(),
                        text: "إلغاء",
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}