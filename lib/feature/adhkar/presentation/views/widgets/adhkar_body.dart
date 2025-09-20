
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/feature/adhkar/presentation/view_model/adhkar_cubit/adhkar_cubit.dart';
import 'package:zker/feature/adhkar/presentation/view_model/adhkar_cubit/adhkar_state.dart';
import 'package:zker/feature/adhkar/presentation/views/widgets/app_bar.dart';
import 'package:zker/feature/adhkar/presentation/views/widgets/custom_card.dart';

import 'package:zker/services/jeson_services.dart';

class AdhkarBody extends StatelessWidget {
  const AdhkarBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AdhkarCubit(JesonAdhkarServices())..fetchAdhkar(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<AdhkarCubit,AdhkarState>(
          builder: (context,state) {
            if (state is AdhkarLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is AdhkarLoaded) {
            //final listadhkar = state.listAdhkar;
       
             return 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomScrollView(
                slivers: [
                  CustomAppBar(),
                  // SliverToBoxAdapter(
                  //   child: SearchAdkarTextFiled(),
                  // ),
                 SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final listadhkar = state.listAdhkar;
                    return CustomCard(
                    color: AppColors.purpulLight,
                    //index%2==0? Color(0xfffff0f1): Color(0xffecfdf5),
                      item: listadhkar[index],
                    );
                  },
                  childCount: state.listAdhkar.length, // ✅ مهم جداً لمنع RangeError
                ),
              ),
              
                ],
              ),
            )
            ;
          }
          return Text("error");
          }
          
        
        ),
      ),
    );
  }
}
