import 'package:ablexa/features/manager/feature_edit_profile_teacher_page/logic/cubits/edit_teacher_cubit/edit_teacher_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/shared_widgets/app_text_feild.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
class EditTeacherTextFormFieldWidgets extends StatefulWidget {
  const EditTeacherTextFormFieldWidgets({
    Key? key,
    required this.nameTeacher,
    required this.emailTeacher,
    required this.nationalNumberTeacher,
  }) : super(key: key);

  final String nameTeacher, emailTeacher, nationalNumberTeacher;

  @override
  State<EditTeacherTextFormFieldWidgets> createState() =>
      _EditTeacherTextFormFieldWidgetsState();
}

class _EditTeacherTextFormFieldWidgetsState
    extends State<EditTeacherTextFormFieldWidgets> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        fullNameWidget(context),
        nationalIdWidget(context),
        emailWidget(context),
      ],
    );
  }

  Column emailWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).email,
          style: TextStyles.font16SemiBoldBlack,
        ),
        verticalSpacing(10),
        AppTextFormField(
          controller: context.read<EditTeacherCubit>().emailController
            ..text = widget.emailTeacher,
          fillColorFromBackground: ColorsManager.mainWhite,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.sp),
            borderSide: BorderSide(
              color: ColorsManager.mainBlack.withOpacity(0.3),
            ),
          ),
          hintText: S.of(context).enter_email,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter email';
            }
            // Add email format validation here if needed
            return null; // Return null if the input is valid
          },
        ),
        verticalSpacing(20),
      ],
    );
  }

  Column nationalIdWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).national_iD,
          style: TextStyles.font16SemiBoldBlack,
        ),
        verticalSpacing(10),
        AppTextFormField(
          controller: context.read<EditTeacherCubit>().nationalIdController
            ..text = widget.nationalNumberTeacher,
          fillColorFromBackground: ColorsManager.mainWhite,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.sp),
            borderSide: BorderSide(
              color: ColorsManager.mainBlack.withOpacity(0.3),
            ),
          ),
          hintText: S.of(context).enter_national_id,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter national ID';
            }
            if (value.length != 14) {
              return 'National ID must be a 14-digit number';
            }
            if (!RegExp(r'^[0-9]*$').hasMatch(value)) {
              return 'National ID must contain only digits';
            }
            return null; // Return null if the input is valid
          },
        ),
        verticalSpacing(20),
      ],
    );
  }

  Column fullNameWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).full_name,
          style: TextStyles.font16SemiBoldBlack,
        ),
        verticalSpacing(10),
        AppTextFormField(
          controller: context.read<EditTeacherCubit>().fullNameController
            ..text = widget.nameTeacher,
          fillColorFromBackground: ColorsManager.mainWhite,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.sp),
            borderSide: BorderSide(
              color: ColorsManager.mainBlack.withOpacity(0.3),
            ),
          ),
          hintText: S.of(context).enter_full_name,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter full name';
            }
            return null; // Return null if the input is valid
          },
        ),
        verticalSpacing(20),
      ],
    );
  }
}
