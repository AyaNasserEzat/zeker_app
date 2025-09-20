import 'package:flutter_bloc/flutter_bloc.dart';

class ZekrCounterCubit extends Cubit<List<int>> {
  ZekrCounterCubit(int length) : super(List.filled(length, 0));

  void increment(int index) {
    final updated = List<int>.from(state);
    updated[index] += 1;
    emit(updated);
  }

  void reset(int index) {
    final updated = List<int>.from(state);
    updated[index] = 0;
    emit(updated);
  }
}
