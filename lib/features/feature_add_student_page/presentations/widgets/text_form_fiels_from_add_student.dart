import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared_widgets/app_text_feild.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

class TextFormFieldFromAddStudent extends StatelessWidget {
  const TextFormFieldFromAddStudent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            S.of(context).full_name,
            style: TextStyles.font16SemiBoldBlack,
          ),
          verticalSpacing(10),
          AppTextFormField(
            fillColorFromBackground: ColorsManager.mainWhite,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.sp),
                borderSide: BorderSide(color: ColorsManager.mainBlack.withOpacity(0.3))),
            hintText: S.of(context).enter_full_name,
            validator: (p0) {},
          ),
          verticalSpacing(20),
          Text(

            S.of(context).national_iD,
            style: TextStyles.font16SemiBoldBlack,
          ),
          verticalSpacing(10),
          AppTextFormField(
            fillColorFromBackground: ColorsManager.mainWhite,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.sp),
                borderSide: BorderSide(color: ColorsManager.mainBlack.withOpacity(0.3))),
            hintText: S.of(context).enter_national_id,
            validator: (p0) {},
          ),
          verticalSpacing(20),

          Text(
            S.of(context).email,
            style: TextStyles.font16SemiBoldBlack,
          ),
          verticalSpacing(10),
          AppTextFormField(
            fillColorFromBackground: ColorsManager.mainWhite,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.sp),
                borderSide: BorderSide(color: ColorsManager.mainBlack.withOpacity(0.3))),
            hintText:  S.of(context).enter_email,
            validator: (p0) {},
          ),
          verticalSpacing(20),
          Text(
            S.of(context).class_code,
            style: TextStyles.font16SemiBoldBlack,
          ),
          verticalSpacing(10),
          AppTextFormField(
            fillColorFromBackground: ColorsManager.mainWhite,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.sp),
                borderSide: BorderSide(color: ColorsManager.mainBlack.withOpacity(0.3))),
            hintText:  S.of(context).enter_class_code,
            validator: (p0) {},
          ),

        ]);
  }
}