import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/shared_widgets/app_text_feild.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
import '../../logic/cubits/add_student_cubit/add_student_cubit.dart';
class AddStudentTextFormField extends StatefulWidget {
  const AddStudentTextFormField({super.key});

  @override
  State<AddStudentTextFormField> createState() => _AddStudentTextFormFieldState();
}

class _AddStudentTextFormFieldState extends State<AddStudentTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        fullNameWidget(context),
        nationalNumberWidget(context),
        emailWidget(context),
      ],);

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
          controller:  context.read<AddStudentCubit>().emailController,
          fillColorFromBackground: ColorsManager.mainWhite,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.sp),
            borderSide: BorderSide(color: ColorsManager.mainBlack.withOpacity(0.3)),
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
  Column nationalNumberWidget(BuildContext context) {
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
          textInputType: TextInputType.number,
          controller:  context.read<AddStudentCubit>().nationalIdController,
          fillColorFromBackground: ColorsManager.mainWhite,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.sp),
            borderSide: BorderSide(color: ColorsManager.mainBlack.withOpacity(0.3)),
          ),
          hintText: S.of(context).enter_national_id,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a national ID';
            } else if (value.length != 14) { // Check for exactly 14 digits
              return 'National ID must be 14 digits';
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
          controller:  context.read<AddStudentCubit>().fullNameController,
          fillColorFromBackground: ColorsManager.mainWhite,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.sp),
            borderSide: BorderSide(color: ColorsManager.mainBlack.withOpacity(0.3)),
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
