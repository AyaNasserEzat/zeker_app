import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/feature/adan/presentation/view_model/prayer_time_cubit/prayer_time_cubit.dart';
import 'package:zker/feature/adan/presentation/view_model/prayer_time_cubit/prayer_time_state.dart';

class PrayerTimeBody extends StatelessWidget {
  const PrayerTimeBody({super.key});

  @override
  Widget build(BuildContext context) {
final Map<String, IconData> prayerIcons = {
  "الفجر": LucideIcons.sunrise,
  "الشروق": LucideIcons.sunMedium, // أو IconData مناسب للشروق
  "الظهر": LucideIcons.sun,
  "العصر": LucideIcons.sunMedium,
  "المغرب": LucideIcons.sunset,
  "العشاء": LucideIcons.moon,
};



    return BlocProvider(
      create: (BuildContext context) => PrayerTimeCubit()..getPrayerTime(),
      child: BlocBuilder<PrayerTimeCubit, PrayerTimesState>(
        builder: (context, state) {
          if (state is PrayerTimesLodingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PrayerTimeErrorState) {
            return const Center(child: Text("حصل خطأ في تحميل أوقات الصلاة"));
          }

          final prayerTimes =
              BlocProvider.of<PrayerTimeCubit>(context).prayerTimes;

          return Scaffold(
            appBar: AppBar(
              title: Text("مواقيت الصلاه",style: TextStyle(color: AppColors.white),),
              centerTitle: true,
              backgroundColor: AppColors.primaryColor,
            ),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.separated(
                itemCount: prayerTimes.length,
                itemBuilder: (context, index) {
                  String prayer = prayerTimes.keys.elementAt(index);
                  String time = prayerTimes[prayer]!;

                  return Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                     // color: AppColors.purpulLight,
                     gradient: LinearGradient(colors: [
                         const Color.fromARGB(255, 35, 37, 53),
                                AppColors.primaryColor,
                      AppColors.purpuldark,
               
                      
                     ]),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
               
                      textDirection: TextDirection.rtl,
                      children: [
                        Icon(
                          prayerIcons[prayer] ?? Icons.access_time,
                          size: 40,
                          color: AppColors.white,
                        ),
                        const SizedBox(width: 16),
                        Text(
                          prayer,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white
                          ),
                        ),
                            Spacer(),
                        Text(
                          time,
                          style: const TextStyle(fontSize: 18,color: AppColors.white),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 10),
              ),
            ),
          );
        },
      ),
    );
  }
}
