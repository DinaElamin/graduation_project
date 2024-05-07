import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/shared_widgets/app_text_feild.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';

class TextFormFieldProfileStudent extends StatefulWidget {
  const TextFormFieldProfileStudent({
    Key? key,
    required this.nameStudent,
    required this.email,
    required this.nationalNumber,
    required this.onTextChanged, // Callback function to pass text data
  }) : super(key: key);

  final String nameStudent, email, nationalNumber;
  final void Function(String fullName, String email, String nationalId) onTextChanged; // Callback function

  @override
  State<TextFormFieldProfileStudent> createState() =>
      _TextFormFieldProfileStudentState();
}

class _TextFormFieldProfileStudentState
    extends State<TextFormFieldProfileStudent> {
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController nationalIdController;

  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController(text: widget.nameStudent);
    emailController = TextEditingController(text: widget.email);
    nationalIdController = TextEditingController(text: widget.nationalNumber);
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    nationalIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
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
            validator: (value) {
              if (value!.isEmpty) {
                return S.of(context).full_name;
              }
              return null;
            },
            onChange: (value) {
              widget.onTextChanged(
                value,
                emailController.text,
                nationalIdController.text,
              );
            },
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
            validator: (value) {
              if (value!.isEmpty) {
                return S.of(context).email;
              }
              return null;
            },
            onChange: (value) {
              widget.onTextChanged(
                fullNameController.text,
                value,
                nationalIdController.text,
              );
            },
          ),
          verticalSpacing(10),
          Text(
            S.of(context).national_iD,
            style: TextStyles.font16SemiBoldBlack,
          ),
          verticalSpacing(10),
          AppTextFormField(
            controller: nationalIdController,
            hintText: widget.nationalNumber,
            validator: (value) {
              if (value!.isEmpty) {
                return S.of(context).national_iD;
              }
              return null;
            },
            onChange: (value) {
              widget.onTextChanged(
                fullNameController.text,
                emailController.text,
                value,
              );
            },
          ),
          verticalSpacing(10),
        ],
      ),
    );
  }
}
