import 'package:flutter/material.dart';

import 'package:zker/feature/adhkar/data/models/adhkar_category.dart';

import 'package:zker/feature/adhkar/presentation/views/adhkar_item_view.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.item, required this.color});

  final AdhkarCategory item;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return AdhkarItemView(item: item);
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: const Color.fromARGB(255, 224, 188, 200)),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
     mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(item.category),
              // CircleAvatar(
              //   radius: 16,

              //   child: Icon(FlutterIslamicIcons.tasbih3, color: Colors.white),
              // ),
              const SizedBox(width: 12),
            ],
          ),
        ),
      ),
    );
  }
}
