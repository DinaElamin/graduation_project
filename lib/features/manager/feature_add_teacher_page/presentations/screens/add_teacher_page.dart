import 'package:ablexa/core/helper/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/Routing/routers.dart';
import '../../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/text_form_fiels_from_add_teacher.dart';

class AddTeacherPage extends StatefulWidget {
  const AddTeacherPage({super.key});

  @override
  State<AddTeacherPage> createState() => _AddTeacherPageState();
}

class _AddTeacherPageState extends State<AddTeacherPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).add_teacher),
        elevation: 0,
        backgroundColor: ColorsManager.mainWhite,
        foregroundColor: ColorsManager.mainBlack,
      ),
      body: ListView(
        children: [
          Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    verticalSpacing(10),
                    const TextFormFieldFromAddTeacher(),
                    verticalSpacing(20),
                    Padding(
                      padding: EdgeInsets.only(left: 50.w, right: 50.w),
                      child: AppTextButton(
                          buttonHeight: 60.h,
                          textButton: S.of(context).add_teacher,
                          onPressed: () {
                            validateThenDoAddTeacher(context);
                          }),
                    ),
                    verticalSpacing(20),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  void validateThenDoAddTeacher(BuildContext context) {
    if (formKey.currentState!.validate()) {
      print("Validation successful. Navigating to verifyEmailManagerPage");
      context.pushNamed(Routes.homeManagerPage);
    } else {
      print("Validation failed. Please check the form fields.");
    }
  }
}
