import 'package:ablexa/core/helper/extentions.dart';
import 'package:ablexa/core/shared_widgets/appBar_widget.dart';
import 'package:ablexa/core/shared_widgets/app_elevated_button.dart';
import 'package:ablexa/core/shared_widgets/app_text_feild.dart';
import 'package:ablexa/core/theming/colors.dart';
import 'package:ablexa/core/theming/image_manager.dart';
import 'package:ablexa/core/theming/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/Routing/routers.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

class ChangeProfile extends StatefulWidget {
  const ChangeProfile({Key? key});

  @override
  State<ChangeProfile> createState() => _ChangeProfileState();
}

class _ChangeProfileState extends State<ChangeProfile> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppBarWidget(pageName: S.of(context).change_profile),
          verticalSpacing(50),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(ImageManager.changeProfileImage),
                verticalSpacing(20),
                Text(
                  S.of(context).login_text,
                  textAlign: TextAlign.center,
                  style: TextStyles.font20BoldBlack,
                ),
                verticalSpacing(20),
                Form(
                  key: formKey,
                  child: AppTextFormField(
                    controller: emailController,
                    contentPadding: EdgeInsets.only(top: 25.h, bottom: 25.h, right: 20.w, left: 20.w),
                    prefixIcon: Icon(Icons.person_3, size: 30.sp, color: ColorsManager.mainBlack.withOpacity(0.5)),
                    hintText: "Dina Mohamed Elamin",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email cannot be empty';
                      }
                      // Use a regular expression to validate the email format
                      bool isValidEmail = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
                      if (!isValidEmail) {
                        return 'Please enter a valid email address';
                      }
                      return null; // Return null if the email is valid
                    },
                  ),
                ),
                verticalSpacing(50),
                Padding(
                  padding:  EdgeInsets.only(left: 50.w,right: 50.w),
                  child: AppTextButton(
                      textButton: "Log into another account", onPressed: () {

                        if(formKey.currentState!.validate()){
                          context.pushNamed(Routes.studentExamsPage);
                        }
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
