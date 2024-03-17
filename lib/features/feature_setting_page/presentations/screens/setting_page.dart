import 'package:ablexa/core/theming/image_manager.dart';
import 'package:ablexa/core/theming/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../widgets/button_logout.dart';
import '../widgets/containt_of_setting_container.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).setting),
        elevation: 0,
        backgroundColor: ColorsManager.mainWhite,
        foregroundColor: ColorsManager.mainBlack,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                verticalSpacing(50),
                ContantOfSettingContainer(
                  iconName: ImageManager.resetPasswordIcon,
                  text: S.of(context).reset_password,
                  onPressedFromArrow: () {},
                ),
                ContantOfSettingContainer(
                  iconName: ImageManager.helpIcon,
                  text: S.of(context).help,
                  onPressedFromArrow: () {},
                ),
                ContantOfSettingContainer(
                  iconName: ImageManager.contactUsIcon,
                  text: S.of(context).contact_us,
                  onPressedFromArrow: () {},
                ),
                ContantOfSettingContainer(
                  iconName: ImageManager.privacyPolicyIcon,
                  text: S.of(context).privacy_policy,
                  onPressedFromArrow: () {},
                ),
                ContantOfSettingContainer(
                  iconName: ImageManager.aboutUsIcon,
                  text: S.of(context).about_us,
                  onPressedFromArrow: () {},
                ),

                verticalSpacing(50),
                const ButtonLogout()
              ],
            ),
          )
        ],
      ),
    );
  }
}



