import '../../../../core/helper/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/Routing/routers.dart';
import '../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../core/shared_widgets/app_text_feild.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
class AllTextFieldsWidget extends StatefulWidget {
  const AllTextFieldsWidget({super.key});

  @override
  State<AllTextFieldsWidget> createState() => _AllTextFieldsWidgetState();
}

class _AllTextFieldsWidgetState extends State<AllTextFieldsWidget> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  bool isPasswordVisible = false;
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Form(
        key: formKey,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpacing(10),
              ],),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(S.of(context).email,
                    style: TextStyles.font16SemiBoldBlack),
                verticalSpacing(10),
                AppTextFormField(
                  maxLines: 1,
                  controller: emailController,
                  hintText: S.of(context).email_hint_text,
                  validator: (email) {
                    if (email!.isEmpty) {
                      return 'Email cannot be empty';
                    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(email)) {
                      return 'Enter a valid email address';
                    }
                    return null; // Return null if the email is valid
                  },
                ),
                verticalSpacing(10),
              ],),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(S.of(context).password, style: TextStyles.font16SemiBoldBlack),
                verticalSpacing(10),
                AppTextFormField(
                  controller: passwordController,
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

              ],),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: Text(S.of(context).forget_password,style: TextStyles.font12RegularPurple),
                    onPressed: (){
                    context.pushNamed(Routes.forgetPasswordPage);
                    },
                    ),
              ],
            ),
            verticalSpacing(40),
            Padding(
              padding:  EdgeInsets.only(right: 30.w,left: 30.w,top: 30.h,bottom: 30.h),
              child: AppTextButton(
                  backgroundColor: ColorsManager.mainColor,
                  textStyle: TextStyles.font18SemiBoldWhite,
                  textButton: S.of(context).login, onPressed: (){
                validateThenDoSignUp(context);
              }),
            ),
          ],
        ),
      ),
    );
  }
  void validateThenDoSignUp(BuildContext context) {
    if (formKey.currentState!.validate()) {
      print("Validation successful. Navigating to verifyEmailManagerPage");
       context.pushNamed(Routes.teacherHomePage);
    } else {
      print("Validation failed. Please check the form fields.");
    }
  }

}
