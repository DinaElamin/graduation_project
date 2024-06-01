import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/shared_widgets/appBar_widget.dart';
import '../../../../../core/shared_widgets/app_text_feild.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';

import '../../logic/cubits/edit_grade_cubit/edit_grade_cubit.dart';
import '../widgets/edit_student_grade_button.dart';

class QuizUpdateDegreePage extends StatefulWidget {
  const QuizUpdateDegreePage(
      {Key? key,
      required this.quizName,
      required this.imageExam,
      required this.token,
      required this.TeacherId,
      required this.StudentId,
      required this.ExamId,
      required this.studentGradeId})
      : super(key: key);

  final String quizName, imageExam, token, TeacherId, StudentId;
  final int ExamId, studentGradeId;

  @override
  State<QuizUpdateDegreePage> createState() => _QuizUpdateDegreePageState();
}

class _QuizUpdateDegreePageState extends State<QuizUpdateDegreePage> {
  final formKey = GlobalKey<FormState>();
  late String studentGrade;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey, // Set the key for the Form widget
        child: ListView(
          children: [
            AppBarWidget(
              pageName: widget.quizName,
            ),
            verticalSpacing(20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 300.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorsManager.lighterPurple,
                      borderRadius: BorderRadius.circular(8.sp),
                    ),
                    child: Center(child: Image.network(widget.imageExam)),
                  ),
                  verticalSpacing(50),
                  Text("Student Grade", style: TextStyles.font20BoldBlack),
                  verticalSpacing(20),
                  Form(
                    key: context.read<EditGradeCubit>().formKey,
                    child: AppTextFormField(
                      onChange: (value) {
                        setState(() {
                          studentGrade =
                              value; // Update the student's grade when the text changes
                        });
                      },
                      fillColorFromBackground: ColorsManager.mainWhite,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.sp),
                        borderSide: BorderSide(
                            color: ColorsManager.mainBlack.withOpacity(0.3),),
                      ),
                      hintText: "Enter grade",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a student grade';
                        }
                        return null;
                      },
                    ),
                  ),
                  verticalSpacing(50),
                  EditStudentButton(
                    token: widget.token,
                    onPressedFunction: () {
                      return validateThenDoEditDegree(context);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void validateThenDoEditDegree(BuildContext context) {
    int studentGradeInt = int.tryParse(studentGrade) ?? 0;
    if (context.read<EditGradeCubit>().formKey.currentState!.validate()) {
      context.read<EditGradeCubit>().emitEditGradeStates(
            widget.token,
            studentGradeId: widget.studentGradeId,
            StudentId: widget.StudentId,
            TeacherId: widget.TeacherId,
            Student_Grade: studentGradeInt,
            ExamId: widget.ExamId,
          );
    } else {
      // Validation failed
      print("Validation failed. Please check the form fields.");
    }
  }
}
