import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/feature/profile/presentation/cubits/rimider_cubit.dart';
import 'package:zker/feature/profile/presentation/views/widgets/riminder_dialog.dart';


class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
   bool isOn=true;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
              context: context, // This context is inside the BlocProvider
      builder: (dialogContext) {
        // You can now access the cubit from the parent
        final cubit = context.read<RimiderMoringCubit>();
        return BlocProvider.value(
          value: cubit, // Pass the existing cubit instance to the dialog's context
          child: const RiminderDialog(),
        );
      },

        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0,right: 8),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.white,
           boxShadow: [BoxShadow(color: Color(0x40000000),offset: Offset(0, 1),blurRadius: 4)],
                  
          ),
          child: Row(
            
            spacing: 10,
            textDirection: TextDirection.rtl,
            children: [
         IconButton(
              onPressed: () async {
               
              },
              icon: Icon(Icons.notifications_active),
            ),
           Text("التنبيهات",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
           Spacer(),
         Switch(value: isOn, onChanged: (v) {
   setState(() {
            isOn=v;
   });
         }),
            ],
          )
        ),
      ),
    );
  }
}
