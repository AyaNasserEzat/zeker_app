import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zker/feature/sapha/presentation/views/widgets/add_btn.dart';

class RiminderDialog<TCubit extends Cubit<TState>, TState> extends StatelessWidget {
  final int Function(TState) intervalSelector;
  final TimeOfDay? Function(TState) startTimeSelector;
  final void Function(BuildContext context, TimeOfDay time) onStartTimePicked;
  final void Function(BuildContext context, int interval) onIntervalChanged;
  final void Function(BuildContext context, TimeOfDay startTime) onSave;

  const RiminderDialog({
    super.key,
    required this.intervalSelector,
    required this.startTimeSelector,
    required this.onStartTimePicked,
    required this.onIntervalChanged,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    final List<int> availableIntervals = const [1, 3, 5, 10];

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 220,
          child: BlocBuilder<TCubit, TState>(
            builder: (context, state) {
              final interval = intervalSelector(state);
              final startTime = startTimeSelector(state);

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "اختر وقت التنبيه",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),

                  /// اختيار بداية التنبيه
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
                            onStartTimePicked(context, pickedTime);
                          }
                        },
                        child: Text(
                          startTime != null
                              ? "البداية: ${startTime.hour}:${startTime.minute.toString().padLeft(2, '0')}"
                              : "اختر بداية التنبيه",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  /// اختيار المدة
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      const Text(": التنبيه كل "),
                      DropdownButton<int>(
                        value: interval,
                        items: availableIntervals.map((duration) {
                          return DropdownMenuItem<int>(
                            value: duration,
                            child: Text("$duration دقيقة"),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            onIntervalChanged(context, value);
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
                          if (startTime != null) {
                            onSave(context, startTime);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("من فضلك اختر وقت البداية"),
                              ),
                            );
                          }
                        },
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
