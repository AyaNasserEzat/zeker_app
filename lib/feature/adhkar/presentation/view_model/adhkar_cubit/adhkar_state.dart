


import 'package:zker/feature/adhkar/data/models/adhkar_category.dart';

abstract class AdhkarState {}

class AdhkarInitial extends AdhkarState {}

class AdhkarLoading extends AdhkarState {}

class AdhkarLoaded extends AdhkarState {
  final List<AdhkarCategory> listAdhkar;
  AdhkarLoaded(this.listAdhkar);
}

class AdhkarError extends AdhkarState {
  final String message;
  AdhkarError(this.message);
}

