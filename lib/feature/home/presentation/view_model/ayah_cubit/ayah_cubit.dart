import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/feature/home/data/models/ayah_model.dart';
import 'package:zker/feature/home/data/models/surah_info_model.dart';
import 'package:zker/feature/home/data/repositorys/home_repo.dart';
import 'package:zker/feature/home/presentation/view_model/ayah_cubit/ayah_state.dart';


class AyahListCubit extends Cubit<AyahListState> {
  AyahListCubit(this.homeRepo) : super(AyahListInitial());
  HomeRepo homeRepo;
List<SurahInfoModel>surahs=[];
List<AyahModel>ayahs=[];

  void getAyahsBySurahNumber({required int surahNumber}) async {
    emit(AyahListLoading());
    try {
      ayahs = await homeRepo.getAyahsBySurahNumber(surahNumber: surahNumber);
      emit(AyahListLoaded(ayahs));
    } catch (e) {
      emit(AyahListError(e.toString()));
    }}
}
