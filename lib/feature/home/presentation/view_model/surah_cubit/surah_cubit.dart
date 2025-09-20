import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:zker/feature/home/data/models/surah_info_model.dart';
import 'package:zker/feature/home/data/repositorys/home_repo.dart';
import 'package:zker/feature/home/presentation/view_model/surah_cubit/surah_state.dart';

class SurahListCubit extends Cubit<SurahListState> {
  SurahListCubit(this.homeRepo) : super(SurahListInitial());
  HomeRepo homeRepo;
List<SurahInfoModel>surahs=[];
 void getSurahList() async {
    emit(SurahListLoading());
    try {
      surahs = await homeRepo.getAllSurah();
      emit(SurahListLoaded(surahs));
    } catch (e) {
      emit(SurahListError(e.toString()));
    }
  }
}
