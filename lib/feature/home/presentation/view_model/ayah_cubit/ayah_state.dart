import 'package:zker/feature/home/data/models/ayah_model.dart';

abstract class AyahListState {}
class AyahListInitial extends AyahListState {}
class AyahListLoading extends AyahListState {}

class AyahListLoaded extends AyahListState {
  final List<AyahModel> ayahs;
  AyahListLoaded(this.ayahs);
}

class AyahListError extends AyahListState {
  final String message;
  AyahListError(this.message);
}
