import 'colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'font_weight_helper.dart';

class TextStyles {
  static TextStyle font18Black500 = TextStyle(
      color: ColorsManager.mainBlack,
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins');
  static TextStyle font16Black500 = TextStyle(
      color: ColorsManager.mainBlack,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins');
  static TextStyle font18Blue500 = TextStyle(
      color: ColorsManager.mainBlue,
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins');
  static TextStyle font16Blue500 = TextStyle(
      color: ColorsManager.mainBlue,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins');
  static TextStyle font14Black500 = TextStyle(
      color: ColorsManager.mainBlack,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins');
  static TextStyle font22Black600 = TextStyle(
    fontSize: 22.sp,
    color: ColorsManager.mainBlack,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );
  static TextStyle font14Blue500 = TextStyle(
    color: ColorsManager.mainBlue,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    fontFamily: "Poppins",
  );
  static TextStyle font16gray500 =  TextStyle(
    color: ColorsManager.mainBlack.withOpacity(0.5),
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle font12Blue500 = TextStyle(
    color: ColorsManager.mainBlue,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    fontFamily: "Poppins",
  );
  static TextStyle font12Black500 = TextStyle(
    color: ColorsManager.mainBlack,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    fontFamily: "Poppins",
  );
  static TextStyle font19White600 = TextStyle(
      fontSize: 19.sp,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
      color: ColorsManager.mainWhite);
  static TextStyle font24Black700 = TextStyle(
      color: ColorsManager.mainBlack,
      fontSize: 24.sp,
      fontWeight: FontWeight.w700);
  static TextStyle font20white600 =  TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
      color: ColorsManager.mainWhite
  );
  static TextStyle font20Blue600 = TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
      color: ColorsManager.mainBlue);
  static TextStyle font20Black600 = TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
      color: ColorsManager.mainBlack);
  static TextStyle font12white400 = TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,color: ColorsManager.mainWhite);
  static TextStyle font12blue400 = TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,color: ColorsManager.mainBlue);
  static TextStyle font14Gray = TextStyle(
    fontSize: 14.sp,
    color: ColorsManager.grey,
  );
  static TextStyle font14GrayRegular = TextStyle(
    fontSize: 14.sp,
    color: ColorsManager.grey,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font14LightGreyRegular = TextStyle(
    fontSize: 14.sp,
    color: ColorsManager.neutralGray,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font16WithMedium = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeightHelper.medium,
      color: Colors.white);
  static TextStyle font16WithSemiBold = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeightHelper.semiBold,
      color: Colors.white);
  static TextStyle font13BlueRegular = TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsManager.mainBlue);
}
