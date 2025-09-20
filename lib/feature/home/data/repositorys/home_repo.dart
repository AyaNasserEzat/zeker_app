import 'package:zker/feature/home/data/models/ayah_model.dart';
import 'package:zker/feature/home/data/models/surah_info_model.dart';

abstract class HomeRepo {
  Future<List<SurahInfoModel>>getAllSurah();
  Future<List<AyahModel>>getAyahsBySurahNumber({required int surahNumber});
}