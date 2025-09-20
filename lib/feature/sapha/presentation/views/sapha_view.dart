import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/feature/sapha/presentation/view_model/cubits/add_ziker_cubit/add_ziker_cubit.dart';
import 'package:zker/feature/sapha/presentation/views/widgets/floating_container.dart';
import 'package:zker/feature/sapha/presentation/views/widgets/sapha_list_view.dart';

class SaphaView extends StatelessWidget {
  const SaphaView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context)=>AddZikerCubit()..fetchallZiker(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            title: Text("المسبحه",style: TextStyle(color: AppColors.white),),
            centerTitle: true,
        
          ),
          floatingActionButton: FloatingContainer(),
          
          body: CustomScrollView(
           slivers: [
            SliverToBoxAdapter(
              child: SizedBox(height: 15,),
            ),
            SaphaListView()
           ],
          ),
        ),
      ),
    );
  }
}