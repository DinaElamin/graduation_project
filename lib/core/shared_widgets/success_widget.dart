import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../../generated/l10n.dart';
import '../theming/colors.dart';
import '../theming/image_manager.dart';
import '../theming/spacing.dart';
import '../theming/styles.dart';
import 'app_elevated_button.dart';

Future<void> showSuccessDialog(BuildContext context, { Callback? onPressed, required String text, required String contentText}) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(16.sp)),
        content: successWidget(
            onPressed: onPressed,
            context, text: text, contentText: contentText),
      );
    },
  );
}

Widget successWidget(BuildContext context, {required String text, required String contentText, Callback? onPressed}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset(
        ImageManager.featuresResetPasswordScreenStudent,
        height: 100.h,
      ),
      verticalSpacing(20),
      Text(
        text,
        style: TextStyles.font24SemiBoldBlack,
      ),
      verticalSpacing(20),
      Text(
        contentText,
        style: TextStyles.font16SemiBoldBlack.copyWith(
          color: ColorsManager.mainBlack.withOpacity(0.5),
        ),
        textAlign: TextAlign.center,
      ),
      verticalSpacing(50),
      AppTextButton(
        textButton: S.of(context).back,
        onPressed: onPressed,
      ),
    ],
  );
}


