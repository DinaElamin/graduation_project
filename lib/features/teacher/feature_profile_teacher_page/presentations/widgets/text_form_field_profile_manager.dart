
import 'package:ablexa/core/helper/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/Routing/routers.dart';
import '../../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../../core/shared_widgets/app_text_feild.dart';
import '../../../../../core/theming/image_manager.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
class TextFormFieldProfileManager extends StatelessWidget {
  const TextFormFieldProfileManager({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            S.of(context).user_name,
            style: TextStyles.font16SemiBoldBlack,
          ),
          verticalSpacing(10),
          AppTextFormField(
            suffixIcon: Image.asset(ImageManager.editIcon),
            hintText: "Qassem Shaban",
            validator: (p0) {},
          ),
          verticalSpacing(10),
          Text(
            S.of(context).email,
            style: TextStyles.font16SemiBoldBlack,
          ),
          verticalSpacing(10),
          AppTextFormField(
            suffixIcon: Image.asset(ImageManager.editIcon),
            hintText: "QassemShaban@gmail.com",
            validator: (p0) {},
          ),
          verticalSpacing(10),
          Text(
            S.of(context).phone_number,
            style: TextStyles.font16SemiBoldBlack,
          ),
          verticalSpacing(10),
          AppTextFormField(
            suffixIcon: Image.asset(ImageManager.editIcon),
            hintText: "0102256486",
            validator: (p0) {},
          ),
          verticalSpacing(10),
          Text(
            S.of(context).subject,
            style: TextStyles.font16SemiBoldBlack,
          ),
          verticalSpacing(10),
          AppTextFormField(
            suffixIcon: Image.asset(ImageManager.editIcon),
            hintText: "Science , Math",
            validator: (p0) {},
          ),
          verticalSpacing(10),
          Text(
            S.of(context).classes,
            style: TextStyles.font16SemiBoldBlack,
          ),
          verticalSpacing(10),
          AppTextFormField(
            suffixIcon: Image.asset(ImageManager.editIcon),
            hintText: "Grade1 , Grade2",
            validator: (p0) {},
          ),
          verticalSpacing(20),
          Padding(
            padding:  EdgeInsets.only(left: 50.w,right: 50.w),
            child: AppTextButton(

                textButton: S.of(context).add_exam, onPressed: (){
                  context.pushNamed(Routes.addExamPage);
            }),
          )
        ],
      ),
    );
  }
}
