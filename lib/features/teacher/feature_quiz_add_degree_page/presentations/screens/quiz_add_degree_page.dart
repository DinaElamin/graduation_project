import 'package:ablexa/core/helper/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/shared_widgets/appBar_widget.dart';
import '../../../../../core/shared_widgets/app_text_feild.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../logic/cubits/add_grade_cubit/add_grade_cubit.dart';
import '../widgets/add_student_grade_button.dart';


class QuizAddDegreePage extends StatefulWidget {
  const QuizAddDegreePage({Key? key, required this.quizName, required this.imageExam, required this.token, required this.TeacherId, required this.StudentId, required this.ExamId}) : super(key: key);

  final String quizName,imageExam,token,TeacherId,StudentId;
  final int ExamId;

  @override
  State<QuizAddDegreePage> createState() => _QuizAddDegreePageState();
}

class _QuizAddDegreePageState extends State<QuizAddDegreePage> {
  final formKey = GlobalKey<FormState>();
  late String studentGrade;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Form(
        key: formKey, // Set the key for the Form widget
        child: ListView(
          children: [
            AppBarWidget(pageName: widget.quizName,),
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
                  AppTextFormField(
                    onChange: (value) {
                      setState(() {
                        studentGrade = value; // Update the student's grade when the text changes
                      });
                    },
                    fillColorFromBackground: ColorsManager.mainWhite,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.sp),
                      borderSide: BorderSide(color: ColorsManager.mainBlack.withOpacity(0.3)),
                    ),
                    hintText: "Enter grade",

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a student grade';
                      }
                      return null;
                    },
                  ),
                  verticalSpacing(50),
                  AddStudentDegreeQuizButton(
                    token: widget.token,
                    onPressedFunction:(){
                   return   validateThenDoAddDegree(context);
                    } ,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  void validateThenDoAddDegree(BuildContext context) {
    int studentGradeInt = int.tryParse(studentGrade) ?? 0;
    if (context.read<AddGradeCubit>().formKey.currentState!.validate()) {

        context.read<AddGradeCubit>().emitAddGradeStates(
          widget.token,
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
