import 'package:ablexa/core/helper/extentions.dart';

import '../../../../../core/Routing/routers.dart';
import '../../../../../core/theming/image_manager.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ProfileAndSettingWidget extends StatelessWidget {
  const ProfileAndSettingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector
          (
          onTap: (){
            context.pushNamed(Routes.teacherProfilePage);
          },
          child: Row(
            children: [
              Image.asset(ImageManager.defaultImageProfile,
                  width: 50.w, height: 50.h),
              horizontalSpacing(10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ahmed Mohamed",
                      style: TextStyles.font16SemiBoldBlack),
                  Text("Ahmed Mohamed@gmail.com",
                      style: TextStyles.font14MediumLightBlack),
                ],
              )
            ],
          ),
        ),
        IconButton(
            onPressed: () {
context.pushNamed(Routes.settingPage);
            }, icon: const Icon(Icons.settings_rounded)),
      ],
    );
  }
}