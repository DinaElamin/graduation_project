import 'package:ablexa/core/shared_widgets/app_elevated_button.dart';
import 'package:ablexa/core/shared_widgets/app_text_feild.dart';
import 'package:ablexa/core/theming/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

class AddExamPage extends StatelessWidget {
  const AddExamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).add_exam),
        elevation: 0,
        backgroundColor: ColorsManager.mainWhite,
        foregroundColor: ColorsManager.mainBlack,
      ),
      body: ListView(children: [
        verticalSpacing(50),
        Padding(
          padding:  EdgeInsets.only(left: 20.w,right: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Text(S.of(context).exam_name,style: TextStyles.font20BoldBlack,),
            verticalSpacing(10),
            AppTextFormField(hintText: S.of(context).enter_exam_name, validator:(p0) {

            },),
            verticalSpacing(20),
            Text(S.of(context).class_code,style: TextStyles.font20BoldBlack,),
            verticalSpacing(10),
            AppTextFormField(hintText: S.of(context).enter_class_code, validator: (p0) {

            },),
            verticalSpacing(20),
            Text(S.of(context).subject_id,style: TextStyles.font20BoldBlack,),
            verticalSpacing(10),
            AppTextFormField(
              hintText: S.of(context).enter_subject_id, validator: (p0) {

            },),
              verticalSpacing(70),
            Container(
              padding: EdgeInsets.all(10.sp),
              height: 60.h,
              decoration:
              BoxDecoration(color: ColorsManager.grey,borderRadius: BorderRadius.circular(8.sp),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Text(S.of(context).upload_exam_image,style: TextStyles.font20BoldBlack.copyWith(fontSize: 16.sp),),
                IconButton(onPressed: (){}, icon: const Icon(Icons.upload),color: ColorsManager.mainColor),

              ]),),
            verticalSpacing(70),
            Padding(
              padding:  EdgeInsets.only(left: 50.w,right: 50.w),
              child: AppTextButton(textButton: S.of(context).add_exam, onPressed: (){}),
            )
          ],),
        )
      ]),
    );
  }
}
