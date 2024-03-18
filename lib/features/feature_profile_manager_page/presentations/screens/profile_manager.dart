import 'package:ablexa/core/shared_widgets/app_elevated_button.dart';
import 'package:ablexa/core/shared_widgets/app_text_feild.dart';
import 'package:ablexa/core/theming/image_manager.dart';
import 'package:ablexa/core/theming/spacing.dart';
import 'package:ablexa/features/feature_profile_manager_page/presentations/widgets/image_and_name_profile_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../widgets/add_buttons_from_managers.dart';
import '../widgets/text_form_field_profile_manager.dart';

class ProfileManagerPage extends StatelessWidget {
  const ProfileManagerPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).my_profile),
        elevation: 0,
        backgroundColor: ColorsManager.mainWhite,
        foregroundColor: ColorsManager.mainBlack,
      ),
      body: SingleChildScrollView( // Wrap the ListView with SingleChildScrollView
        child: Column(
          children: [
            ImageAndNameProfile(),
            TextFormFieldProfileManager(),
            verticalSpacing(40),
            AddButtonsFromManager(),
          ],
        ),
      ),
    );
  }
}


