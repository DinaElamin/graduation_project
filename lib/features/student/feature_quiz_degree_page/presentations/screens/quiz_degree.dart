import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/Routing/routers.dart';
import '../../../../core/shared_widgets/appBar_widget.dart';
import '../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../core/theming/styles.dart';
class QuizDegree extends StatelessWidget {
  const QuizDegree({super.key, required this.quizName});
 final String quizName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppBarWidget(pageName:quizName),
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
                  child: Center(child: Text("Exam Image", style: TextStyles.font20BoldBlack)),
                ),
                verticalSpacing(50),

                Text("student grade  :  5/5",style: TextStyles.font20BoldBlack,),
                verticalSpacing(50),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: AppTextButton(
                    textButton: "Edit Student Degree",
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.quizUpdatedDegreePage,arguments: quizName);
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),);
  }
}
