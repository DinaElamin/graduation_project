import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/Routing/routers.dart';
import '../../../../../core/shared_widgets/appBar_widget.dart';
import '../../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../../core/shared_widgets/app_text_feild.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';


class QuizUpdateDegreePage extends StatefulWidget {
  const QuizUpdateDegreePage({Key? key, required this.quizName}) : super(key: key);

  final String quizName;

  @override
  State<QuizUpdateDegreePage> createState() => _QuizUpdateDegreePageState();
}

class _QuizUpdateDegreePageState extends State<QuizUpdateDegreePage> {
  final formKey = GlobalKey<FormState>();

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
                    child: Center(child: Text("Exam Image", style: TextStyles.font20BoldBlack)),
                  ),
                  verticalSpacing(50),
                  Text("Student Grade", style: TextStyles.font20BoldBlack),
                  verticalSpacing(20),
                  AppTextFormField(
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    child: AppTextButton(
                      textButton: "Add student grade",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, Routes.studentExamsPage);
                        }
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
