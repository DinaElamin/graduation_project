import 'package:ablexa/features/manager/feature_student_edit_profile_page/logic/cubits/edit_student_cubit/edit_student_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/shared_widgets/app_text_feild.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';

class TextFormFieldProfileStudent extends StatefulWidget {
  const TextFormFieldProfileStudent({
    super.key,
    required this.nameStudent,
    required this.email,
  });
  final String nameStudent, email;
  @override
  State<TextFormFieldProfileStudent> createState() =>
      _TextFormFieldProfileStudentState();
}



class _TextFormFieldProfileStudentState
    extends State<TextFormFieldProfileStudent> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nationalIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Set default values to controllers
    fullNameController.text = widget.nameStudent;
    emailController.text = widget.email;
    nationalIdController.text = "20011122241259";
  }

  @override
  void dispose() {
    // Dispose controllers
    fullNameController.dispose();
    emailController.dispose();
    nationalIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h, top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            S.of(context).user_name,
            style: TextStyles.font16SemiBoldBlack,
          ),
          verticalSpacing(10),
          AppTextFormField(
            controller: fullNameController,
            hintText: widget.nameStudent,
            validator: (p0) {},
          ),
          verticalSpacing(10),
          Text(
            S.of(context).email,
            style: TextStyles.font16SemiBoldBlack,
          ),
          verticalSpacing(10),
          AppTextFormField(
            controller: emailController,
            hintText: widget.email,
            validator: (p0) {},
          ),
          verticalSpacing(10),
          Text(
            S.of(context).national_iD,
            style: TextStyles.font16SemiBoldBlack,
          ),
          verticalSpacing(10),
          AppTextFormField(
            controller: nationalIdController,
            hintText: "20011122241259",
            validator: (p0) {},
          ),
          verticalSpacing(10),
        ],
      ),
    );
  }
}

