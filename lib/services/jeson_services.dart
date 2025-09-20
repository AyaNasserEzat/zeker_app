import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:zker/feature/adhkar/data/models/adhkar_category.dart';

class JesonAdhkarServices {
  Future<List<AdhkarCategory>> loadFromJeson()async{
final String jesonString=await rootBundle.loadString("assets/adhkar/adhkar.json");
final List jesonData=json.decode(jesonString);
return jesonData.map((e) => AdhkarCategory.fromJson(e)).toList();
}


}
