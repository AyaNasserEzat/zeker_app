import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zker/core/utils/app_colors.dart';

import 'package:zker/feature/sapha/presentation/views/widgets/spha_container.dart';
import 'package:zker/feature/sapha/data/models/ziker_model/ziker_model.dart';
import 'package:zker/feature/sapha/presentation/view_model/cubits/add_ziker_cubit/add_ziker_cubit.dart';
import 'package:zker/feature/sapha/presentation/view_model/cubits/add_ziker_cubit/add_ziker_state.dart';
import 'package:zker/feature/sapha/presentation/views/widgets/zero_dailog.dart';

class SaphaItemDetails extends StatelessWidget {
  const SaphaItemDetails({super.key, required this.zikerModel});
final ZikerModel zikerModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          context.pop();
        }, icon: Icon(Icons.arrow_back_ios_sharp,color: AppColors.white,)),
        backgroundColor: AppColors.primaryColor,
        title: Text("المسبحه",style: TextStyle(color: AppColors.white),),
        centerTitle: true,
    actions: [
      IconButton(onPressed: (){
        showDialog(context: context, builder: (builder){
    return BlocProvider.value(
      value: BlocProvider.of<AddZikerCubit>(context),
      child: ZeroDailog(zikerModel: zikerModel,));
        });
      }, icon: Icon(Icons.restart_alt,color: AppColors.white,))
    ],
      ),
      body: BlocBuilder<AddZikerCubit,AddZikerStates>(
        builder: (context,state) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                 zikerModel.name,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Row(
                  spacing: 30,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${zikerModel.maxCount} عدد الحبات",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                        Text(
                      "${zikerModel.cycles} عدد الدورات",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SphaContainer(zikerModel: zikerModel,onTap: () {
                  BlocProvider.of<AddZikerCubit>(context).increament(ziker: zikerModel);
                },),
                Text(
                  "${zikerModel.totalCount} عدد المرات الاجمالي ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        }, 
      ),
    );
  }
}
