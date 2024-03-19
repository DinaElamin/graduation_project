import 'package:ablexa/core/helper/extentions.dart';
import 'package:ablexa/core/theming/media_query_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/Routing/routers.dart';
import '../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
class TextAndButtonWidget extends StatelessWidget {
  const TextAndButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight*0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsManager.mainColor,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.sp),topRight:Radius.circular(20.sp)),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(S.of(context).landing_text1,
              style: TextStyles.font20BoldWhite,
            ),
            verticalSpacing(10),
            Text(S.of(context).landing_text2,
              style: TextStyles.font14MediumWhite,
            ),
            verticalSpacing(20),
            Padding(
              padding:  EdgeInsets.only(left: 30.w,right: 30.w),
              child: AppTextButton(
               backgroundColor: ColorsManager.mainWhite,
                  textStyle: TextStyles.font18SemiBoldPurple,
                  textButton: S.of(context).get_started,
                  onPressed: (){
                    context.pushNamed(Routes.loginPage);
              }),
            )
          ]),);
  }
}
