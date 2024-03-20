import 'package:ablexa/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/image_manager.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../core/theming/styles.dart';
class ImageAndNameProfile extends StatelessWidget {
  const ImageAndNameProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        imageProfile(),
        verticalSpacing(10),
        Text("Qassem Shaban",style: TextStyles.font16SemiBoldBlack,)
      ],
    );
  }
  SizedBox imageProfile() {
    return SizedBox(
      height: 80.h,
      width: 100.w,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 38.sp,
            child: Image.asset(ImageManager.defaultImageProfile),
          ),
          Positioned(
              bottom: -1.h,
              right: 18.w,
              height: 35.h,
              width: 35.w,
              child: CircleAvatar(
                backgroundColor: ColorsManager.mainColor,
                radius: 20.sp,child: const Icon(
                  Icons.camera_alt,color: ColorsManager.mainWhite),),),
        ],
      ),
    );
  }
}
