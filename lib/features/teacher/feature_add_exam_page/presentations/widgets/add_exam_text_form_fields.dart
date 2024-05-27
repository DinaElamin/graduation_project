import 'package:ablexa/features/teacher/feature_add_exam_page/logic/cubits/add_exam_cubit/add_exam_cubit.dart';
import 'package:ablexa/features/teacher/feature_add_exam_page/presentations/widgets/subjects_drop_down_add_exam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/shared_widgets/app_text_feild.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';


class AddExamTextFormFields extends StatefulWidget {
  const AddExamTextFormFields({Key? key, required this.teacherId, required this.onSubjectIdSelected}) : super(key: key);
 final String teacherId;
  final void Function(String) onSubjectIdSelected;
  @override
  State<AddExamTextFormFields> createState() => _AddExamTextFormFieldsState();
}
late String subjectId;
class _AddExamTextFormFieldsState extends State<AddExamTextFormFields> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(S.of(context).exam_name, style: TextStyles.font20BoldBlack),
        verticalSpacing(10),
        AppTextFormField(
          controller:  context.read<AddExamCubit>().examNameController,
          textInputType: TextInputType.text,
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
        Text("Exam Grade", style: TextStyles.font20BoldBlack),
        verticalSpacing(10),
        AppTextFormField(
          controller:  context.read<AddExamCubit>().examGradeController,
          textInputType: TextInputType.number,
          fillColorFromBackground: ColorsManager.mainWhite,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.sp),
            borderSide: BorderSide(color: ColorsManager.mainBlack.withOpacity(0.3)),
          ),
          hintText: "enter grade ",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a grade';
            }
            return null;
          },
        ),
        verticalSpacing(20),
        AddExamSubjectsDropDown(
          onSubjectSelected: (subject) {
            setState(() {
              subjectId = subject;
              print("the subject choose is :$subject");
              // Pass the subject ID to the callback function
              widget.onSubjectIdSelected(subject);
            });
          }, teacherId: widget.teacherId,
        ),
        verticalSpacing(20),
      ],
    );
  }
}
