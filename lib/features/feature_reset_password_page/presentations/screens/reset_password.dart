import 'package:ablexa/core/helper/extentions.dart';
import 'package:ablexa/core/shared_widgets/app_elevated_button.dart';
import 'package:ablexa/core/shared_widgets/app_text_feild.dart';
import 'package:ablexa/core/theming/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/shared_widgets/appBar_widget.dart';
import '../../../../core/shared_widgets/success_widget.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final formKey = GlobalKey<FormState>();

  bool isPasswordVisible = false;

  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        children: [
          AppBarWidget(pageName: S.of(context).reset_password),
          verticalSpacing(80),
          Padding(
            padding:  EdgeInsets.only(left: 20.w,right: 20.w),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  currentPasswordWidget(context),
                 newPasswordWidget(context),
                confirmNewPasswordWidget(context),

                 AppTextButton(textButton: S.of(context).reset_password, onPressed: (){

                   if(formKey.currentState!.validate()){
                     context.pop();
                     showSuccessDialog(context,
                         text: S.of(context).password_changed,
                         contentText: S.of(context).text_password_change);
                   }
                 })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }




  Column confirmNewPasswordWidget(BuildContext context) {
    return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [  Text(
                S.of(context).confirm_new_password,
                style: TextStyles.font16SemiBoldBlack,
              ),
                verticalSpacing(10),
                AppTextFormField(
                  fillColorFromBackground: ColorsManager.mainWhite,
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorsManager.mainBlack.withOpacity(0.3))),
                  controller: confirmNewPasswordController,
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
                  hintText: S.of(context).password_hint_text,
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
                verticalSpacing(40),],);
  }

  Column newPasswordWidget(BuildContext context) {
    return Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [ verticalSpacing(20),
                 Text(
                   S.of(context).new_password,
                   style: TextStyles.font16SemiBoldBlack,
                 ),
                 verticalSpacing(10),
                 AppTextFormField(
                   fillColorFromBackground: ColorsManager.mainWhite,
                   enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorsManager.mainBlack.withOpacity(0.3))),
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
                   hintText: S.of(context).password_hint_text,
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
                 verticalSpacing(20),],);
  }

  Column currentPasswordWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text(
                  S.of(context).current_password,
                  style: TextStyles.font16SemiBoldBlack,
                ),
                  verticalSpacing(10),
                  AppTextFormField(
                    fillColorFromBackground: ColorsManager.mainWhite,
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(
                        color: ColorsManager.mainBlack.withOpacity(0.3))),
                    controller: currentPasswordController,
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
                    hintText: S.of(context).password_hint_text,
                    validator: (password) {
                      if (password!.isEmpty) {
                        return 'Password cannot be empty';
                      } else if (password.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      // You can add more complex validation rules if needed
                      return null; // Return null if the password is valid
                    },
                  ),],);
  }
}
