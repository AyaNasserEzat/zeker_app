import 'package:hive/hive.dart';
part 'ziker_model.g.dart';
@HiveType(typeId: 0)
class ZikerModel extends HiveObject {
@HiveField(0)
String name;//اسم الزكر
@HiveField(1)
int maxCount;//عدد الحبات 
@HiveField(2)
int curCount;//عدد الحالي 
@HiveField(3)
int totalCount;//عدد الاجمالي
@HiveField(4)
int cycles;//عددالدورات

ZikerModel({required this.name,required this.maxCount,this.curCount=0,this.cycles=0,this.totalCount=0});
}