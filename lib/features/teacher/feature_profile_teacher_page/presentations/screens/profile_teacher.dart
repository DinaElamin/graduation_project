
import 'package:ablexa/core/helper/extentions.dart';
import 'package:ablexa/core/shared_widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';
import '../../../../../core/Routing/routers.dart';
import '../../../../../core/shared_widgets/appBar_widget.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/image_and_name_profile_teacher.dart';
import '../widgets/text_form_field_profile_manager.dart';

class ProfileTeacherPage extends StatefulWidget {
  const ProfileTeacherPage({Key? key, required this.nameTeacher, required this.emailTeacher, required this.imageTeacher, required this.nationalNumber, required this.token, required this.teacherId});
  final String token,nameTeacher,emailTeacher,imageTeacher,nationalNumber,teacherId;
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
             teacherId: widget.teacherId,
             token: widget.token,
             emailTeacher: widget.emailTeacher,
             nameTeacher: widget.nameTeacher,
             nationalNumber: widget.nationalNumber,
           ),
          verticalSpacing(20),
          AppTextButton(textButton: "Add Exam", onPressed:
          (){
            context.pushNamed(Routes.addExamPage,arguments: {
              'token':widget.token,
              'TeacherId':widget.teacherId
            });
          })
        ],
      ),
    );
  }
}


