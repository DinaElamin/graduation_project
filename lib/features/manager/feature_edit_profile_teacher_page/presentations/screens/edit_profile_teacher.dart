import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/shared_widgets/appBar_widget.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/edit_teacher_contant_page.dart';

class EditTeacherProfilePage extends StatelessWidget {
  const EditTeacherProfilePage({super.key, required this.token, required this.userId});
  final String token,userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppBarWidget(pageName: S.of(context).edit_teacher),
          Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Column(
                children: [
                  verticalSpacing(10),
                  EditTeacherContantPage(token: token,userId: userId),

                ],
              )),
        ],
      ),
    );
  }
}
