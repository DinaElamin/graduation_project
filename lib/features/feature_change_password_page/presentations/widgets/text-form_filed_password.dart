import '../../../../core/helper/extentions.dart';
import '../../../../core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/Routing/routers.dart';
import '../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../core/shared_widgets/app_text_feild.dart';
import '../../../../core/shared_widgets/success_widget.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

class TextFormFieldPassword extends StatefulWidget {
  const TextFormFieldPassword({super.key});

  @override
  State<TextFormFieldPassword> createState() => _TextFormFieldPasswordState();
}

class _TextFormFieldPasswordState extends State<TextFormFieldPassword> {
  final formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController newConfirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(S.of(context).new_password,
                style: TextStyles.font16SemiBoldBlack),
            verticalSpacing(10),
            AppTextFormField(
              controller: newPasswordController,
              maxLines: 1,
              textInputType: TextInputType.visiblePassword,
              obscureText: !isPasswordVisible,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                child: Icon(
                  isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off_rounded,
                  size: 22,
                  color: ColorsManager.mainColor,
                ),
              ),
              hintText: S.of(context).enter_new_password,
              validator: (password) {
                if (password!.isEmpty) {
                  return 'Password cannot be empty';
                } else if (password.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                // You can add more complex validation rules if needed
                return null; // Return null if the password is valid
              },
            ),
            verticalSpacing(10),
            Text(S.of(context).confirm_new_password,
                style: TextStyles.font16SemiBoldBlack),
            verticalSpacing(10),
            AppTextFormField(
              controller: newConfirmPasswordController,
              maxLines: 1,
              textInputType: TextInputType.visiblePassword,
              obscureText: !isPasswordVisible,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                child: Icon(
                  isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off_rounded,
                  size: 22,
                  color: ColorsManager.mainColor,
                ),
              ),
              hintText: S.of(context).enter_new_password,
              validator: (password) {
                if (password!.isEmpty) {
                  return 'Password cannot be empty';
                } else if (password.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                // You can add more complex validation rules if needed
                return null; // Return null if the password is valid
              },
            ),
            verticalSpacing(50),
            AppTextButton(
                textButton: S.of(context).update_password,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    showSuccessDialog(context, onPressed: () {
                      context.pop();
                      context.pushNamed(Routes.loginPage);
                    },
                        text: S.of(context).change_password,
                        contentText: S.of(context).text_password_change);
                  }
                })
          ],
        ),
      ),
    );
  }
}
