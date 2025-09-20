class AdhkarItem {
  final int id;
  final String text;
  final int count;
  final String audio;
  final String filename;
   int currentcount;

  AdhkarItem({
    required this.id,
    required this.text,
    required this.count,
    required this.audio,
    required this.filename,
    this.currentcount=0
  });

  factory AdhkarItem.fromJson(Map<String, dynamic> json) {
    return AdhkarItem(
      id: json['id'],
      text: json['text'],
      count: json['count'],
      audio: json['audio'],
      filename: json['filename'],
    );
  }
}
