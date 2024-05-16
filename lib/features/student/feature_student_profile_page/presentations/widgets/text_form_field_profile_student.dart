import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/shared_widgets/app_text_feild.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
class TextFormFieldProfileStudent extends StatelessWidget {
  const TextFormFieldProfileStudent({
    super.key, required this.nameStudent, required this.emailStudent, required this.nationalIdStudent, required this.classId,
  });
final String nameStudent,emailStudent,nationalIdStudent;
final int classId;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w,bottom: 20.h,top: 20.h),
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
            hintText: nameStudent,
            validator: (p0) {},
          ),
          verticalSpacing(10),
          Text(
            S.of(context).email,
            style: TextStyles.font16SemiBoldBlack,
          ),
          verticalSpacing(10),
          AppTextFormField(
            hintText:emailStudent,
            validator: (p0) {},
          ),
          verticalSpacing(10),
          Text(
            S.of(context).national_iD,
            style: TextStyles.font16SemiBoldBlack,
          ),
          verticalSpacing(10),
          AppTextFormField(
            hintText: nationalIdStudent,
            validator: (p0) {},
          ),
          verticalSpacing(10),
          Text(
            S.of(context).class_student,
            style: TextStyles.font16SemiBoldBlack,
          ),
          verticalSpacing(10),
          AppTextFormField(
            hintText: classId.toString(),
            validator: (p0) {},
          ),
          verticalSpacing(10),
        ],
      ),
    );
  }
}
