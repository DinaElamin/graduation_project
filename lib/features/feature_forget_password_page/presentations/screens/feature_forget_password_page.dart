import 'package:ablexa/core/helper/extentions.dart';
import 'package:ablexa/core/theming/image_manager.dart';
import 'package:ablexa/core/theming/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/Routing/routers.dart';
import '../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../core/shared_widgets/app_text_feild.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Column(
          children: [
            verticalSpacing(50),
          Image.asset(ImageManager.featuresForgetPasswordScreenStudent),
          Padding(
            padding:  EdgeInsets.only(left: 20.w,right: 20.w,top: 50.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

              Text(S.of(context).forget_password,style: TextStyles.font20BoldBlack,),
              verticalSpacing(20),
              Text(S.of(context).text_forget_password,style: TextStyles.font14MediumLightBlack.copyWith(fontSize: 16.sp),),
              verticalSpacing(50),
              Form(
                key: formKey,
                child: Column(
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
              ),
              verticalSpacing(50),
            ],),
          ),
          Padding(
            padding:  EdgeInsets.only(right: 30.w,left: 30.w,top: 30.h,bottom: 30.h),
            child: AppTextButton(
                backgroundColor: ColorsManager.mainColor,
                textStyle: TextStyles.font18SemiBoldWhite,
                textButton: S.of(context).send_code, onPressed: (){
             if(formKey.currentState!.validate()){
               context.pushNamed(Routes.verifyCodePage);
             }
            }),
          ),

        ],)
      ],),
    );
  }
}
