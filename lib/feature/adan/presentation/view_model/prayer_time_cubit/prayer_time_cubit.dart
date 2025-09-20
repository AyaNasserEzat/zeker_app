
import 'package:adhan/adhan.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

import 'package:zker/feature/adan/presentation/view_model/prayer_time_cubit/prayer_time_state.dart';

class PrayerTimeCubit extends Cubit<PrayerTimesState>{
  PrayerTimeCubit():super(PrayerTimeInitialState());
Map<String,String> prayerTimes={};

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> getPrayerTime()async{
    
try {
  emit(PrayerTimesLodingState());

  Position position=await determinePosition();
    final coordinates = Coordinates(position.latitude, position.longitude);
      final params = CalculationMethod.egyptian.getParameters();
      params.madhab = Madhab.shafi;
  
      final date = DateComponents.from(DateTime.now());
      final prayerTimesData = PrayerTimes(coordinates, date, params);
      final formatter = DateFormat.jm();
      // List<PrayerModel> listPrayerModel=[
      //   PrayerModel(name: "",)
      // ];
      
          prayerTimes = {
        "الفجر": formatter.format(prayerTimesData.fajr),
        "الشروق": formatter.format(prayerTimesData.sunrise),
        "الظهر": formatter.format(prayerTimesData.dhuhr),
        "العصر": formatter.format(prayerTimesData.asr),
        "المغرب": formatter.format(prayerTimesData.maghrib),
        "العشاء": formatter.format(prayerTimesData.isha),
      };

      emit(PrayerTimesSuccessState(prayerList: prayerTimes));
}  catch (e) {
emit(PrayerTimeErrorState(errorMessage: e.toString()));
}


  }
}

