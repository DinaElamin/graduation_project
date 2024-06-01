import '../../../../../core/theming/media_query_helper.dart';

import '../../../../../core/shared_widgets/appBar_widget.dart';
import 'package:flutter/material.dart';
import '../widgets/subject_degree_widget.dart';

class SubjectDetailsPage extends StatelessWidget {
  const SubjectDetailsPage({super.key, required this.subjectName, required this.studentId, required this.materialId, required this.token, required this.roleName, required this.TeacherId});
  final String subjectName,studentId,token,roleName,TeacherId;
  final int materialId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Column(
          children: [
            AppBarWidget(pageName: subjectName),
            SizedBox(
                height: context.screenHeight * 0.9,
                child:  SubjectDegreeWidget(
                  TeacherId: TeacherId,
                  roleName:roleName,
                  token: token,
                  studentId: studentId,
                  materialId: materialId,
                )),
          ],
        )
      ]),
    );
  }
}
