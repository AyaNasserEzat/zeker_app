import 'package:flutter/material.dart';
import 'package:zker/feature/adhkar/data/models/adhkar_category.dart';

import 'package:zker/feature/adhkar/presentation/views/widgets/adkar_item_body.dart';

class AdhkarItemView extends StatelessWidget {
  const AdhkarItemView({super.key, required this.item});
final AdhkarCategory item;
  @override
  Widget build(BuildContext context) {
    return  AdkarItemBody(item: item,);
  }
}