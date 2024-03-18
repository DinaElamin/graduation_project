import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/image_manager.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
class UploadImageWidget extends StatelessWidget {
  const UploadImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,

      padding: EdgeInsets.only(left: 15.w,right: 15.w),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
        color: ColorsManager.grey,
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(S.of(context).update_user_image,style: TextStyles.font16SemiBoldBlack,),
            Image.asset(ImageManager.uploadImageIcon),
          ]),);
  }
}