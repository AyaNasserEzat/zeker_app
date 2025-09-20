import 'package:zker/feature/home/data/models/surah_info_model.dart';


abstract class SurahListState {}

class SurahListInitial extends SurahListState {}

class SurahListLoading extends SurahListState {}

class SurahListLoaded extends SurahListState {
  final List<SurahInfoModel> surahs;
  SurahListLoaded(this.surahs);
}

class SurahListError extends SurahListState {
  final String message;
  SurahListError(this.message);
}