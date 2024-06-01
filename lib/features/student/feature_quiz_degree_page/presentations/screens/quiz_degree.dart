import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/Routing/routers.dart';
import '../../../../../core/shared_widgets/appBar_widget.dart';
import '../../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';

class QuizDegree extends StatelessWidget {
  const QuizDegree(
      {super.key,
      required this.quizName,
      required this.imageExam,
      required this.totalDegreeFromExam,
      required this.studentExamGrade,
      required this.roleName,
      required this.TeacherId,
      required this.studentId,
      required this.token,
      required this.ExamId});

  final String quizName, imageExam, roleName, TeacherId, studentId, token;
  final int totalDegreeFromExam, studentExamGrade, ExamId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppBarWidget(pageName: quizName),
          verticalSpacing(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 400.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorsManager.lighterPurple,
                    borderRadius: BorderRadius.circular(8.sp),
                  ),
                  child: Center(child: Image.network(imageExam)),
                ),
                verticalSpacing(50),
                Text(
                  "student grade  :  $studentExamGrade/$totalDegreeFromExam",
                  style: TextStyles.font20BoldBlack,
                ),
                verticalSpacing(50),
                roleName == 'Teacher'
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50.w),
                        child: AppTextButton(
                          textButton: "Edit Student Degree",
                          onPressed: () {
                            // final String token = args['token'];
                            // final String TeacherId = args['TeacherId'];
                            // final String studentId = args['studentId'];
                            // final int ExamId = args['ExamId'];
                            Navigator.pushNamed(
                                context, Routes.quizUpdatedDegreePage,
                                arguments: {
                                  'imageExam': imageExam,
                                  'quizName': quizName,
                                  'token': token,
                                  'TeacherId': TeacherId,
                                  'studentId': studentId,
                                  'ExamId': ExamId,
                                  'studentGradeId': studentExamGrade
                                });
                          },
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          )
        ],
      ),
    );
  }
}
