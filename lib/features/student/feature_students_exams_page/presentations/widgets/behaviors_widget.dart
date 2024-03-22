import '../../../../core/theming/media_query_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
class BehaviorsWidget extends StatelessWidget {
  const BehaviorsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
height: context.screenHeight*0.6,
        decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.sp),
      color: ColorsManager.lighterPurple,),
        child: Center(child: Text("Violence image",style: TextStyles.font20BoldBlack,))),);
  }
}
