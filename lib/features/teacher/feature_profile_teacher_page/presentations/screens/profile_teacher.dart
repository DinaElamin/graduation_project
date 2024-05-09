
import 'package:flutter/material.dart';
import '../../../../../core/shared_widgets/appBar_widget.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/image_and_name_profile_teacher.dart';
import '../widgets/text_form_field_profile_manager.dart';

class ProfileTeacherPage extends StatefulWidget {
  const ProfileTeacherPage({Key? key, required this.nameTeacher, required this.emailTeacher, required this.imageTeacher, required this.nationalNumber});
  final String nameTeacher,emailTeacher,imageTeacher,nationalNumber;
  @override
  State<ProfileTeacherPage> createState() => _ProfileTeacherPageState();
}

class _ProfileTeacherPageState extends State<ProfileTeacherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        children: [
          AppBarWidget(pageName: S.of(context).my_profile,),
          verticalSpacing(10),
           ImageAndNameProfileTeacher(
             nameTeacher: widget.nameTeacher,
             emailTeacher: widget.emailTeacher,
             imageTeacher: widget.imageTeacher,
           ),
          verticalSpacing(10),
           TextFormFieldProfileManager(
             emailTeacher: widget.emailTeacher,
             nameTeacher: widget.nameTeacher,
             nationalNumber: widget.nationalNumber,
           ),
          verticalSpacing(20),

        ],
      ),
    );
  }
}


