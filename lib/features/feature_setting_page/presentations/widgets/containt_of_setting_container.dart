import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../core/theming/styles.dart';
class ContantOfSettingContainer extends StatelessWidget {
  const ContantOfSettingContainer({
    super.key,
    required this.iconName,
    required this.text,
    required this.onPressedFromArrow,
  });
  final Widget iconName;
  final String text;
  final Callback onPressedFromArrow;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 20.h),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            iconName,
            horizontalSpacing(20),
            Text(text,
                style: TextStyles.font14MediumLightBlack),
          ],
        ),
        GestureDetector(
          onTap:
            onPressedFromArrow,

          child: Icon(Icons.arrow_back_ios,
              color: ColorsManager.mainBlack.withOpacity(0.5)),
        ),
      ]),
    );
  }
}
