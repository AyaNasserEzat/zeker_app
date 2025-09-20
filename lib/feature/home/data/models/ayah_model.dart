class AyahModel {
  final int number;
  final String text;
  final int numberInSurah;
  final int page;

  AyahModel({
    required this.number,
    required this.text,
    required this.numberInSurah,
    required this.page,
  });

  factory AyahModel.fromJson(Map<String, dynamic> json) {
    return AyahModel(
      number: json['number'],
      text: json['text'],
      numberInSurah: json['numberInSurah'],
      page: json['page'],
    );
  }
}
