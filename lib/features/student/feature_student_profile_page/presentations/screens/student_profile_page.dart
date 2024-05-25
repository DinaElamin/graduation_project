import 'package:flutter/material.dart';
import '../../../../../core/shared_widgets/appBar_widget.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/image_and_name_profile_student.dart';
import '../widgets/text_form_field_profile_student.dart';
class StudentProfilePage extends StatefulWidget {
  const StudentProfilePage({super.key, required this.imageStudent, required this.nameStudent, required this.emailStudent, required this.nationalIdStudent, required this.classId});
final String imageStudent,nameStudent,emailStudent,nationalIdStudent;
final int classId;

  @override
  State<StudentProfilePage> createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppBarWidget(pageName: S.of(context).student_profile,),
          Column(children: [
             ImageAndNameProfileStudent(
               setImage: (image) => null,
            nameStudent: widget.nameStudent,
            imageStudent: widget.imageStudent,
            ),
             TextFormFieldProfileStudent(
               nameStudent: widget.nameStudent,
               emailStudent: widget.emailStudent,
               classId: widget.classId,
               nationalIdStudent: widget.nationalIdStudent,
             ),
            verticalSpacing(40),

          ],)
        ],
      ),
    );
  }
}
