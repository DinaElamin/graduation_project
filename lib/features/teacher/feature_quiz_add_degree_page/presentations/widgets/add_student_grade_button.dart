import 'package:ablexa/core/helper/extentions.dart';
import 'package:ablexa/features/teacher/feature_add_exam_page/logic/cubits/add_exam_cubit/add_exam_cubit.dart';
import 'package:ablexa/features/teacher/feature_add_exam_page/logic/cubits/add_exam_cubit/add_exam_state.dart';
import 'package:ablexa/features/teacher/feature_quiz_add_degree_page/logic/cubits/add_grade_cubit/add_grade_cubit.dart';
import 'package:ablexa/features/teacher/feature_quiz_add_degree_page/logic/cubits/add_grade_cubit/add_grade_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../../core/shared_widgets/success_widget.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
class AddStudentDegreeQuizButton extends StatefulWidget {
  const AddStudentDegreeQuizButton({super.key, required this.token, this.onPressedFunction});
final String token;
final Function()? onPressedFunction;
  @override
  State<AddStudentDegreeQuizButton> createState() => _AddStudentDegreeQuizButtonState();
}

class _AddStudentDegreeQuizButtonState extends State<AddStudentDegreeQuizButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 50.w, right: 50.w),
      child: BlocListener<AddGradeCubit, AddGradeState>(
        listener: (context, state) {
          state.when(
            initial: () {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.mainColor,
                ),
              );
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.mainColor,
                ),
              );
            },
            success: (data) {
              showSuccessDialog(onPressed: () {
                context.pop();
              }, context,
                  text:"Add Degree With Quiz",
                  contentText: "Add Quiz Successfully !!");
            },
              error: (error) {
                setupErrorState(context, error);
              });

        },
        child: AppTextButton(
            buttonHeight: 60.h,
            textButton: S.of(context).add_teacher,
            onPressed:
              widget.onPressedFunction
            ),
      ),
    );
  }
  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          error,
          style: TextStyles.font14MediumLightBlack,
        ),
        actions: [
          TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text(
                'Got It ',
                style: TextStyles.font20BoldBlack,
              )),
        ],
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
      ),
    );
  }

}
