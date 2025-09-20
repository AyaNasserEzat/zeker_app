
import 'package:zker/feature/adhkar/data/models/adhkar_item.dart';

class AdhkarCategory {
  final String category;
  final String audio;
  final String filename;
  final List<AdhkarItem> array;

  AdhkarCategory({
    required this.category,
    required this.audio,
    required this.filename,
    required this.array,
  });

  factory AdhkarCategory.fromJson(Map<String, dynamic> json) {
    var items = (json['array'] as List)
        .map((item) => AdhkarItem.fromJson(item))
        .toList();

    return AdhkarCategory(
      category: json['category'],
      audio: json['audio'],
      filename: json['filename'],
      array: items,
    );
  }
}