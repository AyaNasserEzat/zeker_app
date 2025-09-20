import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/services/jeson_services.dart';

import 'adhkar_state.dart';

class AdhkarCubit extends Cubit<AdhkarState> {
  final JesonAdhkarServices _service;

  AdhkarCubit(this._service) : super(AdhkarInitial());

Future   fetchAdhkar() async {
    emit(AdhkarLoading());
    try {
      final data = await _service.loadFromJeson();
      print("sccccccccccccccccccs");
      emit(AdhkarLoaded(data));
    } catch (e) {
      emit(AdhkarError('فشل في تحميل الأذكار'));
    }
  }

}