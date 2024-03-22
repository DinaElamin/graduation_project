import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/shared_widgets/app_text_feild.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';


class AddExamTextFormFields extends StatelessWidget {
  const AddExamTextFormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(S.of(context).exam_name, style: TextStyles.font20BoldBlack),
        verticalSpacing(10),
        AppTextFormField(
          fillColorFromBackground: ColorsManager.mainWhite,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.sp),
            borderSide: BorderSide(color: ColorsManager.mainBlack.withOpacity(0.3)),
          ),
          hintText: S.of(context).enter_exam_name,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter an exam name';
            }
            return null;
          },
        ),
        verticalSpacing(20),
        Text(S.of(context).class_code, style: TextStyles.font20BoldBlack),
        verticalSpacing(10),
        AppTextFormField(
          fillColorFromBackground: ColorsManager.mainWhite,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.sp),
            borderSide: BorderSide(color: ColorsManager.mainBlack.withOpacity(0.3)),
          ),
          hintText: S.of(context).enter_class_code,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a class code';
            }
            return null;
          },
        ),
        verticalSpacing(20),
        Text(S.of(context).subject_id, style: TextStyles.font20BoldBlack),
        verticalSpacing(10),
        AppTextFormField(
          fillColorFromBackground: ColorsManager.mainWhite,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.sp),
            borderSide: BorderSide(color: ColorsManager.mainBlack.withOpacity(0.3)),
          ),
          hintText: S.of(context).enter_subject_id,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a subject ID';
            }
            return null;
          },
        ),
        verticalSpacing(20),
      ],
    );
  }
}
