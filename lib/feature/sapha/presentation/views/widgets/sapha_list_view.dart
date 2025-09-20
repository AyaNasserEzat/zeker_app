import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/feature/sapha/presentation/view_model/cubits/add_ziker_cubit/add_ziker_cubit.dart';
import 'package:zker/feature/sapha/presentation/view_model/cubits/add_ziker_cubit/add_ziker_state.dart';
import 'package:zker/feature/sapha/presentation/views/widgets/sapha_item.dart';

class SaphaListView extends StatelessWidget {
  const SaphaListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddZikerCubit,AddZikerStates>(
      builder: (context,state) {
        var zikerList=BlocProvider.of<AddZikerCubit>(context).zikerList;
          if (zikerList.isEmpty) {
          // هنا لازم نرجع Sliver
          return const SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text("مفيش أذكار لسه"),
              ),
            ),
          );}
        return SliverList.separated(
          itemCount: BlocProvider.of<AddZikerCubit>(context).zikerList.length,
          itemBuilder: (context,index){
            
        
          return SaphaItem(zikerModel:zikerList[index] ,);
        }, separatorBuilder: (BuildContext context, int index) { 
          
          return SizedBox(height: 10,) ;},);
      }, listener: (BuildContext context, state) {

        },
    );
  }
}