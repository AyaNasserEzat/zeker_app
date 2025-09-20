import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/feature/adhkar/data/models/adhkar_category.dart';
import 'package:zker/feature/adhkar/presentation/view_model/audio_player_cubit/audio_player_cubit.dart';

import 'package:zker/feature/adhkar/presentation/views/widgets/custom_card_item.dart';

class AdkarItemBody extends StatefulWidget {
  const AdkarItemBody({super.key, required this.item});
  final AdhkarCategory item;

  @override
  State<AdkarItemBody> createState() => _AdkarItemBodyState();
}

class _AdkarItemBodyState extends State<AdkarItemBody> {
  int itemcount = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AudioPlayerCubit(AudioPlayerService()),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(centerTitle: true, title: Text(widget.item.category)),
        body: ListView.separated(
          itemBuilder: (context, index) {
            return 
            CustomCardItem(item: widget.item.array[index],);
          },
          separatorBuilder: (context, index) {
            return SizedBox(width: 20);
          },
          itemCount: widget.item.array.length,
        ),
      ),
    );
  }
}
