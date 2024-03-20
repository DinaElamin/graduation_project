import 'package:ablexa/core/theming/spacing.dart';
import 'package:ablexa/features/feature_profile_manager_page/presentations/widgets/image_and_name_profile_manager.dart';
import 'package:flutter/material.dart';
import '../../../../core/theming/colors.dart';
import '../../../../generated/l10n.dart';
import '../widgets/text_form_field_profile_manager.dart';

class ProfileTeacherPage extends StatefulWidget {
  const ProfileTeacherPage({Key? key});

  @override
  State<ProfileTeacherPage> createState() => _ProfileTeacherPageState();
}

class _ProfileTeacherPageState extends State<ProfileTeacherPage> {
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
            verticalSpacing(20),
            const ImageAndNameProfile(),
            verticalSpacing(40),
            const TextFormFieldProfileManager(),
          ],
        ),
      ),
    );
  }
}


