import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/shared_widgets/app_text_feild.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
import 'package:ablexa/features/manager/feature_add_grade_page/logic/cubits/add_year_cubit/add_year_cubit.dart';

class IndexAndYearNameTextFormField extends StatefulWidget {


  const IndexAndYearNameTextFormField({
    Key? key,}) : super(key: key);

  @override
  State<IndexAndYearNameTextFormField> createState() => _IndexAndYearNameTextFormFieldState();
}

class _IndexAndYearNameTextFormFieldState extends State<IndexAndYearNameTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(S.of(context).grade, style: TextStyles.font16SemiBoldBlack),
        verticalSpacing(10),
        gradeTextFormField(context),
        verticalSpacing(10),
        Text(S.of(context).index_of_grade, style: TextStyles.font16SemiBoldBlack),
        verticalSpacing(10),
        indexOfGradeTextFormField(context),
      ],
    );
  }

  AppTextFormField gradeTextFormField(BuildContext context) {
    return AppTextFormField(
      controller: context.read<AddYearCubit>().yearNameController,
      hintText: S.of(context).add_grade_name,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).please_enter_grade;
        }
        return null; // Return null if the input is valid
      },
    );
  }

  AppTextFormField indexOfGradeTextFormField(BuildContext context) {
    return AppTextFormField(
      controller: context.read<AddYearCubit>().indexController,
      hintText: S.of(context).index_of_grade,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).please_inter_index;
        }
        return null; // Return null if the input is valid
      },
    );
  }
}
