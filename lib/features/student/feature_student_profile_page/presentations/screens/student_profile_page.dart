import 'package:flutter/material.dart';
import '../../../../../core/shared_widgets/appBar_widget.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/image_and_name_profile_student.dart';
import '../widgets/text_form_field_profile_student.dart';
class StudentProfilePage extends StatelessWidget {
  const StudentProfilePage({super.key, required this.imageStudent, required this.nameStudent, required this.emailStudent, required this.nationalIdStudent, required this.classId});
final String imageStudent,nameStudent,emailStudent,nationalIdStudent;
final int classId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppBarWidget(pageName: S.of(context).student_profile,),
          Column(children: [
             ImageAndNameProfileStudent(
            nameStudent: nameStudent,
            imageStudent: imageStudent,
            ),
             TextFormFieldProfileStudent(
               nameStudent: nameStudent,
               emailStudent: emailStudent,
               classId: classId,
               nationalIdStudent: nationalIdStudent,
             ),
            verticalSpacing(40),

          ],)
        ],
      ),
    );
  }
}
