import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:zker/feature/home/presentation/views/widgets/bottom_nav_bar.dart';
import 'package:zker/feature/profile/presentation/cubits/evening_cubit/evening_cubit.dart';
import 'package:zker/feature/profile/presentation/cubits/moring_cubit/rimider_cubit.dart';
import 'package:zker/feature/profile/presentation/views/evening_azkar_details_view.dart';
import 'package:zker/feature/profile/presentation/views/moring_azkar_detail_view.dart';
import 'package:zker/feature/profile/presentation/views/profile_view.dart';
import 'package:zker/feature/sapha/data/models/ziker_model/ziker_model.dart';
import 'package:zker/feature/sapha/presentation/view_model/cubits/add_ziker_cubit/add_ziker_cubit.dart';
import 'package:zker/feature/sapha/presentation/views/sapha_view.dart';
import 'package:zker/feature/sapha/presentation/views/widgets/sapha_item_details.dart';

class AppRouter {
  // Init router once and reuse
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: 'home',
        path: '/',
        builder: (context, state) => const BottomNavBarScreen(),
      ),
      GoRoute(
        name: 'sapha',
        path: '/sapha',
        // لو عايزة تبعتي بيانات: state.extra
        builder: (context, state) => const SaphaView(),
      ),
      GoRoute(
  path: '/saphaDetails',
  name: 'saphaDetails',
  builder: (context, state) {
    final zikerModel = state.extra as ZikerModel;
    return BlocProvider(
      create: (_) => AddZikerCubit(),
      child: SaphaItemDetails(zikerModel: zikerModel),
    );
  },
),
    GoRoute(
  path: '/profile',
  name: 'profile',
  builder: (context, state) {
   
    return BlocProvider(
      create: (_) => RimiderMoringCubit(),
      child: ProfileView(),
    );
    
  },
),

 GoRoute(
  path: '/azkarDetailView',
  name: 'azkarDetailView',
  builder: (context, state) {
   
    return BlocProvider(
      create: (_) => RimiderMoringCubit(),
      child: MorningAzkarDetailView(),
    );
    
  },
),
GoRoute(
  path: '/EveningAzkarDetailsView',
  name: 'EveningAzkarDetailsView',
  builder: (context, state) {
   
    return BlocProvider(
      create: (_) => EveningCubit(),
      child: EveningAzkarDetailsView(),
    );
    
  },
),

//  GoRoute(
//         name: 'azkars',
//         path: '/azkars',
//         // لو عايزة تبعتي بيانات: state.extra
//         builder: (context, state) => const AzkarDetailView(),
//       ),

    ],
  );
}
