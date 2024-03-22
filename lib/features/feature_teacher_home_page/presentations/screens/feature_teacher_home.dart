import 'package:ablexa/core/theming/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../widgets/profile_and_setting_widget.dart';
import '../widgets/teacher_classes.dart';

class TeacherHome extends StatelessWidget {
  const TeacherHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.grey,
      body: ListView(children: [
        verticalSpacing(20),
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            children: [
              const ProfileAndSettingWidget(),
              verticalSpacing(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).classes,
                    style: TextStyles.font20BoldBlack,
                  ),
                  verticalSpacing(10),
                  const TeacherClasses(),
                ],
              ),
              verticalSpacing(20),
            ],
          ),
        )
      ]),
    );
  }
}