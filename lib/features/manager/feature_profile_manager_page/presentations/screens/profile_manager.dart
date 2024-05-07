import '../../../../../core/shared_widgets/appBar_widget.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/image_and_name_profile_manager.dart';
import 'package:flutter/material.dart';
import '../widgets/add_buttons_from_managers.dart';
import '../widgets/text_form_field_profile_manager.dart';

class ProfileManagerPage extends StatelessWidget {
  const ProfileManagerPage({Key? key, required this.token, required this.nameManager, required this.emailManager, required this.nationalId, required this.imageManager});
final String token,nameManager,emailManager,nationalId,imageManager;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Wrap the ListView with SingleChildScrollView
        child: Column(
          children: [
            verticalSpacing(30),
            AppBarWidget(pageName: S.of(context).my_profile),
            verticalSpacing(20),
             ImageAndNameProfile(nameManager: nameManager,imageManager: imageManager),
            verticalSpacing(40),
             TextFormFieldProfileManager(nameManager: nameManager,nationalId: nationalId,emailManager: emailManager),
            verticalSpacing(40),
             AddButtonsFromManager(token: token),
          ],
        ),
      ),
    );
  }
}


