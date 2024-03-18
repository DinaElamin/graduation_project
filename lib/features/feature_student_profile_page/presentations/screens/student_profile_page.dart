import 'package:ablexa/core/shared_widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../generated/l10n.dart';
import '../widgets/image_and_name_profile_student.dart';
import '../widgets/text_form_field_profile_student.dart';
class StudentProfilePage extends StatelessWidget {
  const StudentProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).student_profile),
        elevation: 0,
        backgroundColor: ColorsManager.mainWhite,
        foregroundColor: ColorsManager.mainBlack,
      ),
      body: ListView(
        children: [
          Column(children: [
            const ImageAndNameProfileStudent(),
            const TextFormFieldProfileStudent(),
            verticalSpacing(40),
            Padding(
              padding:  EdgeInsets.only(left: 50.w,right: 50.w),
              child: AppTextButton(
                  buttonHeight: 60.h,
                  textButton: S.of(context).save_change,
                  onPressed: (){}),
            )
          ],)
        ],
      ),
    );
  }
}
