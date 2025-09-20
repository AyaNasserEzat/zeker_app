

class PrayerTimesState {}
class PrayerTimeInitialState extends PrayerTimesState{}

class PrayerTimesLodingState extends PrayerTimesState{}
class PrayerTimesSuccessState extends PrayerTimesState{
Map<String,String>? prayerList;
  PrayerTimesSuccessState({this.prayerList});
}
class PrayerTimeErrorState extends PrayerTimesState{
  final String errorMessage;

  PrayerTimeErrorState({required this.errorMessage});

}