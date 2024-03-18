import 'package:ablexa/core/helper/extentions.dart';
import 'package:ablexa/core/shared_widgets/app_elevated_button.dart';
import 'package:ablexa/core/shared_widgets/app_text_feild.dart';
import 'package:ablexa/core/theming/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/Routing/routers.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../widgets/semester_one_drop_down_widget.dart';

class AddGradePage extends StatefulWidget {
  const AddGradePage({Key? key}) : super(key: key);

  @override
  State<AddGradePage> createState() => _AddGradePageState();
}

class _AddGradePageState extends State<AddGradePage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController gradeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).add_grade),
        elevation: 0,
        backgroundColor: ColorsManager.mainWhite,
        foregroundColor: ColorsManager.mainBlack,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  gradeWidget(context),
                  semester1Widget(context),
                  semester2Widget(context),
                  saveButton(context),
                  verticalSpacing(20),
                  // Add more widgets here as needed
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column gradeWidget(BuildContext context) {
    return Column(children: [Text(S.of(context).grade,
                  style: TextStyles.font16SemiBoldBlack),
                verticalSpacing(10),
                gradeTextFormField(context),],);
  }

  AppTextFormField gradeTextFormField(BuildContext context) {
    return AppTextFormField(
      controller: gradeController,
                hintText: S.of(context).add_grade,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a grade';
                  }
                  return null; // Return null if the input is valid
                },
              );
  }

  Padding saveButton(BuildContext context) {
    return Padding(
                padding: EdgeInsets.only(left: 50.w, right: 50.w),
                child: AppTextButton(
                  textButton: S.of(context).save,
                  onPressed: () {
                    validateThenDoAddGrade(context);
                  },
                ),
              );
  }

  Column semester2Widget(BuildContext context) {
    return Column(
      children: [
        Text(S.of(context).semester_two, style: TextStyles.font16SemiBoldBlack),
        verticalSpacing(10),
        const SemesterOneDropDown(),
        verticalSpacing(20),
      ],
    );
  }

  Column semester1Widget(BuildContext context) {
    return Column(
      children: [
        verticalSpacing(20),
        Text(S.of(context).semester_one, style: TextStyles.font16SemiBoldBlack),
        verticalSpacing(10),
        const SemesterOneDropDown(),
        verticalSpacing(20),
      ],
    );
  }
  void validateThenDoAddGrade(BuildContext context) {
    if (formKey.currentState!.validate()) {
      print("Validation successful. Navigating to verifyEmailManagerPage");
      context.pushNamed(Routes.gradePage);
    } else {
      print("Validation failed. Please check the form fields.");
    }
  }
}
