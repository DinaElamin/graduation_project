import 'package:ablexa/core/theming/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../generated/l10n.dart';
import '../widgets/card_list_view_for_students_garde.dart';
class StudentsPage extends StatelessWidget {
  const StudentsPage({super.key, required this.gradeName});
 final String gradeName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.grey,
      appBar: AppBar(
      title: Text(S.of(context).students),
      elevation: 0,
      backgroundColor: ColorsManager.mainWhite,
      foregroundColor: ColorsManager.mainBlack,
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.only(left: 20.w,right: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          verticalSpacing(10),
           GradeStudents(gradeName: gradeName),
        ],),
      ),
    ),
    );
  }
}
