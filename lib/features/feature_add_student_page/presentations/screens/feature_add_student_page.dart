import 'package:ablexa/core/shared_widgets/app_elevated_button.dart';
import 'package:ablexa/core/theming/image_manager.dart';
import 'package:ablexa/core/theming/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../widgets/drop_down_grade.dart';
import '../widgets/text_form_fiels_from_add_student.dart';

class AddStudentPage extends StatelessWidget {
  const AddStudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).add_student),
        elevation: 0,
        backgroundColor: ColorsManager.mainWhite,
        foregroundColor: ColorsManager.mainBlack,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Column(children: [
              const TextFormFieldFromAddStudent(),
              verticalSpacing(20),
              SizedBox(
                  height: 60.h,
                  child: const DropDownMenuGrade()),
              verticalSpacing(20),
              Container(
                height: 60.h,

                padding: EdgeInsets.only(left: 15.w,right: 15.w),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
                color: ColorsManager.grey,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Text(S.of(context).update_user_image,style: TextStyles.font16SemiBoldBlack,),
                Image.asset(ImageManager.uploadImageIcon),
              ]),),
              verticalSpacing(20),
              Padding(
                padding:  EdgeInsets.only(left: 50.w,right: 50.w),
                child: AppTextButton(
                    buttonHeight: 60.h,
                    textButton: S.of(context).add_student, onPressed: (){}),
              )

            ],)
          ),
        ],
      ),
    );
  }
}

