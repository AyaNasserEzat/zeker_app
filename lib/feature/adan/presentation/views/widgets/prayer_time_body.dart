
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/feature/adan/presentation/view_model/prayer_time_cubit/prayer_time_cubit.dart';
import 'package:zker/feature/adan/presentation/view_model/prayer_time_cubit/prayer_time_state.dart';

class PrayerTimeBody extends StatelessWidget {
  const PrayerTimeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context)=>PrayerTimeCubit()..getPrayerTime(),
      child: BlocBuilder<PrayerTimeCubit,PrayerTimesState>(
        builder: (context,state) {
          return Scaffold(
            body: 
       
       state is PrayerTimesLodingState?CircularProgressIndicator():
       state is PrayerTimeErrorState? Text("error"):
          ListView.separated(itemBuilder: (context, index) {
            final prayerTimes=BlocProvider.of<PrayerTimeCubit>(context).prayerTimes;
                String prayer = prayerTimes.keys.elementAt(index);
                    String time = prayerTimes[prayer]!;
            return ListTile(
                      title: Text(
                        prayer,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        time,
                        style: TextStyle(fontSize: 18),
                      ),
                    );
          }, separatorBuilder: (BuildContext context, int index) { 
            return SizedBox(height: 10,);
            
           }, itemCount:6,)
            
          );
        }
      ),
    );
  }
}