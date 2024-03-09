import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/styles.dart';
class RowLabelAndAnyWidget extends StatelessWidget {
  const RowLabelAndAnyWidget({super.key, required this.text, required this.theSecondWidget});
 final String text;
 final Widget theSecondWidget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 10.w,right: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text(text,style: TextStyles.font20Black600,),
        theSecondWidget,
      ],),
    );
  }
}
