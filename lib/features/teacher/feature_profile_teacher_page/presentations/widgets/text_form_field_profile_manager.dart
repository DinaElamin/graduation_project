
import '../../../../../core/helper/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/Routing/routers.dart';
import '../../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../../core/shared_widgets/app_text_feild.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
class TextFormFieldProfileManager extends StatelessWidget {
  const TextFormFieldProfileManager({
    super.key, required this.nameTeacher, required this.emailTeacher, required this.nationalNumber, required this.token, required this.teacherId,
  });
final String nameTeacher,emailTeacher,nationalNumber,token,teacherId;
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
            hintText: nameTeacher,
            validator: (p0) {},
          ),
          verticalSpacing(10),
          Text(
            S.of(context).email,
            style: TextStyles.font16SemiBoldBlack,
          ),
          verticalSpacing(10),
          AppTextFormField(
            hintText: emailTeacher,
            validator: (p0) {},
          ),
          verticalSpacing(10),
          Text(
            S.of(context).national_iD,
            style: TextStyles.font16SemiBoldBlack,
          ),
          verticalSpacing(10),
          AppTextFormField(
            hintText: nationalNumber,
            validator: (p0) {},
          ),
          verticalSpacing(10),
          Text(
            S.of(context).subject,
            style: TextStyles.font16SemiBoldBlack,
          ),
          verticalSpacing(10),
          AppTextFormField(
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
            hintText: "Grade1 , Grade2",
            validator: (p0) {},
          ),
          verticalSpacing(20),
          Padding(
            padding:  EdgeInsets.only(left: 50.w,right: 50.w),
            child: AppTextButton(
                textButton: S.of(context).add_exam, onPressed: (){
                  context.pushNamed(Routes.addExamPage,arguments: {
                    'token':token,
                    'TeacherId':teacherId,
                  });
            }),
          )
        ],
      ),
    );
  }
}
