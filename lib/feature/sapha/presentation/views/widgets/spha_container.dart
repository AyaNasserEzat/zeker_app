
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/feature/sapha/data/models/ziker_model/ziker_model.dart';

class SphaContainer extends StatelessWidget {
  const SphaContainer({super.key, required this.zikerModel, this.onTap});
final ZikerModel zikerModel;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    double precent= zikerModel.curCount/zikerModel.maxCount;
    return GestureDetector(
      onTap:onTap,
       child: CircularPercentIndicator(
        addAutomaticKeepAlive: false,
        animateFromLastPercent: true,
        restartAnimation: false,
                radius: 130.0,
                animation: true,
                animationDuration: 300,
                animateToInitialPercent: true,
                lineWidth: 15.0,
                percent: precent,
                center:  Text(
                  zikerModel.curCount.toString(),
                  style:
                       TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
                circularStrokeCap: CircularStrokeCap.butt,
                backgroundColor: AppColors.primaryColor,
                progressColor: AppColors.purpulLight,
              ),
      
 
    );
  }
}