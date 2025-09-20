import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/feature/sapha/data/models/ziker_model/ziker_model.dart';
import 'package:zker/feature/sapha/presentation/view_model/cubits/add_ziker_cubit/add_ziker_cubit.dart';
import 'package:zker/feature/sapha/presentation/view_model/cubits/add_ziker_cubit/add_ziker_state.dart';
import 'package:zker/feature/sapha/presentation/views/widgets/add_btn.dart';

class ZeroDailog extends StatelessWidget {
  const ZeroDailog({super.key, required this.zikerModel});
final ZikerModel zikerModel;
  @override
  Widget build(BuildContext context) {
    return  Dialog(
      backgroundColor: AppColors.white,
      child: SizedBox(
              width: 400,
      height: 150,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<AddZikerCubit,AddZikerStates>(
            builder: (context,state) {
              return Column(
                spacing: 30,
                children: [
                  Text("هل تريد تصفير عداد الزكر",style: TextStyle(fontSize: 20),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 20,
                    children: [
                      AddBtn(onPressed: (){
                        BlocProvider.of<AddZikerCubit>(context).zero(ziker: zikerModel);
                        context.pop();
                        print("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
                      },text:  " تاكيد",),
                      AddBtn(onPressed: (){
                        context.pop();
                      },text: "الغاء",)
                    ],
                  )
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}