import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_colors.dart';


class AzkarListView extends StatelessWidget {
  const AzkarListView({super.key, required this.list});
final List list;
  @override
  Widget build(BuildContext context) {
    return Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8,top: 8),
                  child: Container(
                    width: double.infinity,

                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.white,
                   boxShadow: [BoxShadow(color: Color(0x40000000),offset: Offset(0, 1),blurRadius: 4)],
                  
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        textDirection: TextDirection.rtl,
                       list[index]),
                    )),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 15);
              },
              itemCount: list.length,
            ),
          );
  }
}