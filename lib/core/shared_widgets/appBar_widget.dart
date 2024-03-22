import 'package:ablexa/core/helper/extentions.dart';
import 'package:ablexa/core/theming/colors.dart';
import 'package:ablexa/core/theming/spacing.dart';
import 'package:ablexa/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.pageName,  this.widget});
final String pageName;
final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
    decoration: BoxDecoration(color: ColorsManager.mainWhite,
        boxShadow: [BoxShadow(color: ColorsManager.mainBlack.withOpacity(0.5),),],),
      child: Padding(
        padding:  EdgeInsets.only(left: 10.w,right: 10.w),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
     Row(children: [   IconButton(

         color: ColorsManager.mainBlack,onPressed: (){

         context.pop();
     }, icon: const Icon(Icons.arrow_back)),
         horizontalSpacing(10),
         Text(pageName,style: TextStyles.font16SemiBoldBlack),],),

          widget ?? Container(),
        ]),
      ),
    );
  }
}
