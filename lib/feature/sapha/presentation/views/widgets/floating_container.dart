import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/feature/sapha/presentation/view_model/cubits/add_ziker_cubit/add_ziker_cubit.dart';
import 'package:zker/feature/sapha/presentation/views/widgets/add_daialog.dart';

// class FloatingContainer extends StatelessWidget {
//   const FloatingContainer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  InkWell(
//       onTap: () {
//         showDialog(context: context, builder: (context){
//           return AddDaialog();
//         });
//       },
//       child: Container(
//         width: 40,
//         height: 40,
//           decoration: BoxDecoration(
//             color: AppColors.grawn,
//             shape: BoxShape.circle
      
//           ),
//       child: Icon(Icons.add,size: 24,color: AppColors.white,),
//         ),
//     );
//   }
// }

class FloatingContainer extends StatelessWidget {
  const FloatingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (dialogContext) {
            return BlocProvider.value(
              value: BlocProvider.of<AddZikerCubit>(context),
              child: const AddDaialog(),
            );
          },
        );
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.add,
          size: 24,
          color: AppColors.white,
        ),
      ),
    );
  }
}
