import 'package:ablexa/features/manager/feature_student_edit_profile_page/presentations/widgets/drop_down_grade_edit_profile.dart';
import 'package:ablexa/features/manager/feature_student_edit_profile_page/presentations/widgets/year_drop_down_edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/shared_widgets/app_text_feild.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
class TextFormFieldProfileStudent extends StatefulWidget {
  const TextFormFieldProfileStudent({
    super.key, required this.nameStudent, required this.email,
  });
final String nameStudent,email;
  @override
  State<TextFormFieldProfileStudent> createState() => _TextFormFieldProfileStudentState();
}
late int termId;
late int pClassId;
class _TextFormFieldProfileStudentState extends State<TextFormFieldProfileStudent> {
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
            hintText: widget.nameStudent,
            validator: (p0) {},
          ),
          verticalSpacing(10),
          Text(
            S.of(context).email,
            style: TextStyles.font16SemiBoldBlack,
          ),
          verticalSpacing(10),
          AppTextFormField(
            hintText: widget.email,
            validator: (p0) {},
          ),
          verticalSpacing(10),
          Text(
            S.of(context).national_iD,
            style: TextStyles.font16SemiBoldBlack,
          ),
          verticalSpacing(10),
          AppTextFormField(
            hintText: "20011122241259",
            validator: (p0) {},
          ),
          verticalSpacing(10),
          EditProfileGradeDropDown(
            onGradeSelected: (gradeId) {
              setState(() {
                try {
                  pClassId = int.parse(gradeId); // Parse the String to int
                } catch (e) {
                  print("Error parsing gradeId to int: $e");
                  // Handle the error as needed
                }
              });
            },
          ),
          EditProfileYearDropDown(
            onSemesterSelected: (selectedTermId) {
              setState(() {
                try {
                  termId = int.parse(selectedTermId); // Parse the String to int
                } catch (e) {
                  print("Error parsing termId to int: $e");
                  // Handle the error as needed
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
