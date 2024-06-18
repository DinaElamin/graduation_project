import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../../../../core/helper/extentions.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/spacing.dart';
import 'package:flutter/material.dart';
import '../../../../core/Routing/routers.dart';
import '../../../../core/shared_widgets/appBar_widget.dart';
import '../../../../generated/l10n.dart';
import '../widgets/button_logout.dart';
import '../widgets/containt_of_setting_container.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                AppBarWidget(pageName: S.of(context).setting),
                verticalSpacing(50),
                ContantOfSettingContainer(
                  iconName: Icon(Icons.key_outlined,color: ColorsManager.mainBlack.withOpacity(0.5)),
                  text: S.of(context).reset_password,
                  onPressedFromArrow: () {
                    context.pushNamed(Routes.resetPasswordPage);
                  },
                ),
                ContantOfSettingContainer(
                  iconName: Icon(Icons.help,color: ColorsManager.mainBlack.withOpacity(0.5)),
                  text: S.of(context).help,
                  onPressedFromArrow: () {},
                ),
                ContantOfSettingContainer(
                  iconName: Icon(Icons.email_outlined,color: ColorsManager.mainBlack.withOpacity(0.5)),
                  text: S.of(context).contact_us,
                  onPressedFromArrow: () {},
                ),
                ContantOfSettingContainer(
                  iconName: Icon(Icons.privacy_tip_outlined,color: ColorsManager.mainBlack.withOpacity(0.5)),
                  text: S.of(context).privacy_policy,
                  onPressedFromArrow: () {},
                ),
                ContantOfSettingContainer(
                  iconName: Icon(Icons.info_outline,color: ColorsManager.mainBlack.withOpacity(0.5)),
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
      //  bottomNavigationBar: CurvedNavigationBar(
      //    color: Color(0xff6C63FF),
      //    backgroundColor: Colors.transparent,
      //    buttonBackgroundColor: Color(0xff6C63FF),
      //    animationDuration: Duration(milliseconds: 500),
      //    items: [
      //      Icon(
      //       Icons.home_outlined,
      //        color: Colors.white,
      //        size: 30,
      //      ),
      //      Icon(
      //        Icons.settings_outlined,
      //        color: Colors.white,
      //        size: 30,
      //      ),
      //      Icon(
      //        Icons.person_2_sharp,
      //        color: Colors.white,
      //        size: 30,
      //      ),
      //    ],
      //  ),
    );
  }
}



