import '../../../../core/helper/extentions.dart';
import '../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/image_manager.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/Routing/routers.dart';
import '../../../../generated/l10n.dart';

class SuccessfullyPage extends StatelessWidget {
  const SuccessfullyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(ImageManager.featuresResetPasswordScreenStudent),
          verticalSpacing(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(S.of(context).password_changed,
                  style: TextStyles.font24SemiBoldBlack),
              verticalSpacing(20),
              Text(S.of(context).text_password_change,
                  style: TextStyles.font16SemiBoldBlack.copyWith(
                      color: ColorsManager.mainBlack.withOpacity(0.5))),
              verticalSpacing(50),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.w, right: 30.w),
            child: AppTextButton(
                textButton: S.of(context).back,
                onPressed: () {
                  context.pushNamed(Routes.loginPage);
                }),
          )
        ],
      ),
    );
  }
}
