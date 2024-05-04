import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/shared_widgets/appBar_widget.dart';
import '../../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/image_and_name_profile_student.dart';
import '../widgets/text_form_field_profile_student.dart';

class StudentEditProfilePage extends StatelessWidget {
  const StudentEditProfilePage({super.key, required this.nameStudent, required this.image, required this.email});
final String nameStudent,image,email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppBarWidget(
              pageName: S.of(context).student_profile,
              widget: Text(
                S.of(context).edit,
                style: TextStyles.font16SemiBoldBlack,
              )),
    Column(
    children: [
    ImageAndNameProfileStudent(name:nameStudent,image: image),
     TextFormFieldProfileStudent(nameStudent: nameStudent,email: email),
    verticalSpacing(40),
    Padding(
    padding: EdgeInsets.only(left: 50.w, right: 50.w),
    child: AppTextButton(
    buttonHeight: 60.h,
    textButton: S.of(context).save_change,
    onPressed: () {

    }),
    )
    ],
    ),
        ],
      ),
    );
  }
}
