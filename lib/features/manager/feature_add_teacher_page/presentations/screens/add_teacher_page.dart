import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/shared_widgets/appBar_widget.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/text_form_fiels_from_add_teacher.dart';

class AddTeacherPage extends StatelessWidget {
  const AddTeacherPage({super.key, required this.token});
final String token;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppBarWidget(pageName: S.of(context).add_teacher),
          Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Column(
                children: [
                  verticalSpacing(10),
                   TextFormFieldFromAddTeacher(token: token),

                ],
              )),
        ],
      ),
    );
  }
}
