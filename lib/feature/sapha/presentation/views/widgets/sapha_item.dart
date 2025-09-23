import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/feature/sapha/data/models/ziker_model/ziker_model.dart';

class SaphaItem extends StatelessWidget {
  const SaphaItem({super.key, required this.zikerModel});
final ZikerModel zikerModel;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 8.0,right: 8),
      child: InkWell(
        onTap: () {
          context.push("/saphaDetails",extra: zikerModel);
        },
        child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.purpulLight,strokeAlign: 1),
          borderRadius: BorderRadius.circular(15),
          color: AppColors.white,
         boxShadow: [
          BoxShadow(
        color:  Color(0x40000000),
        offset: Offset(0,1),
        blurRadius: 4
        
          )
         ]
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0,bottom: 8),
          child: Column(
            children: [
          Text(zikerModel.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          Text(" ${zikerModel.maxCount}  عدد الحبات"),
          Text(" ${zikerModel.totalCount} عدد المرات الاجمالي ")
            ],
          ),
        ),
        ),
      ),
    );
  }
}