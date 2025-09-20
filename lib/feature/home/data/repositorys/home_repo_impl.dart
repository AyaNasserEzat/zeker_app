import 'package:zker/feature/home/data/models/ayah_model.dart';
import 'package:zker/feature/home/data/models/surah_info_model.dart';
import 'package:zker/feature/home/data/repositorys/home_repo.dart';
import 'package:zker/services/api_service.dart';

class HomeRepoImpl extends HomeRepo{
  final ApiService _apiService;
  HomeRepoImpl(this._apiService);
  @override
  Future<List<SurahInfoModel>> getAllSurah()async {
  final response=await  _apiService.get(endPoint: "surah");
  List list= response['data'];
  return list.map((e)=>SurahInfoModel.fromJson(e)).toList();
   
  }

  @override
  Future<List<AyahModel>> getAyahsBySurahNumber({required int surahNumber})async {
   final response=await  _apiService.get(endPoint: "surah/$surahNumber");
  List list= response['data']['ayahs'];
  return list.map((e)=>AyahModel.fromJson(e)).toList();
  }
}