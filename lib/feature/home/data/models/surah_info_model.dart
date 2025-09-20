class SurahInfoModel {
  final int number;
  final String name;
  final int numberOfAyahs;
  final String revelationType;

  SurahInfoModel({
    required this.number,
    required this.name,
    required this.numberOfAyahs,
    required this.revelationType,
  });

  factory SurahInfoModel.fromJson(Map<String, dynamic> json) {
    return SurahInfoModel(
      number: json['number'],
      name: json['name'],
      numberOfAyahs: json['numberOfAyahs'],
      revelationType: json['revelationType'],
    );
  }
}