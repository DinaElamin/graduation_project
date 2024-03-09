import 'colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'font_weight_helper.dart';

class TextStyles {
  static TextStyle font20BoldWhite = TextStyle(
      color: ColorsManager.mainWhite,
      fontSize: 20.sp,
      fontWeight: FontWeightHelper.bold);
  static TextStyle font14MediumWhite = TextStyle(
      color: ColorsManager.mainWhite,
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.medium);
  static TextStyle font14MediumGray = TextStyle(
      color: ColorsManager.grey,
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.medium);
  static TextStyle font18SemiBoldPurple = TextStyle(
      color: ColorsManager.mainColor,
      fontSize: 18.sp,
      fontWeight: FontWeightHelper.semiBold);
}
