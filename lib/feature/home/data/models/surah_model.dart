import 'package:zker/feature/home/data/models/ayah_model.dart';

class SurahModel {
  final int number;
  final String name;
  final int numberOfAyahs;
  final List<AyahModel> ayahs;

  SurahModel({
    required this.number,
    required this.name,
    required this.numberOfAyahs,
    required this.ayahs,
  });

  factory SurahModel.fromJson(Map<String, dynamic> json) {
    var ayahList = json['ayahs'] as List;
    List<AyahModel> ayahs = ayahList.map((e) => AyahModel.fromJson(e)).toList();

    return SurahModel(
      number: json['number'],
      name: json['name'],
      numberOfAyahs: json['numberOfAyahs'],
      ayahs: ayahs,
    );
  }
}
