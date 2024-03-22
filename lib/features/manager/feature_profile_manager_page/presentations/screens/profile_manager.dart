import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/image_and_name_profile_manager.dart';
import 'package:flutter/material.dart';
import '../widgets/add_buttons_from_managers.dart';
import '../widgets/text_form_field_profile_manager.dart';

class ProfileManagerPage extends StatefulWidget {
  const ProfileManagerPage({Key? key});

  @override
  State<ProfileManagerPage> createState() => _ProfileManagerPageState();
}

class _ProfileManagerPageState extends State<ProfileManagerPage> {
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
            verticalSpacing(40),
            const AddButtonsFromManager(),
          ],
        ),
      ),
    );
  }
}


