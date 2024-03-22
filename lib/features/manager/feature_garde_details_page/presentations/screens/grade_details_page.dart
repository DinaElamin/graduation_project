import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../widgets/semester_one_widget.dart';
import '../widgets/semester_two_widget.dart';

class GradeDetailsPage extends StatelessWidget {
  const GradeDetailsPage({super.key, required this.gradeName});
  final String gradeName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).grade_details),
        elevation: 0,
        backgroundColor: ColorsManager.mainWhite,
        foregroundColor: ColorsManager.mainBlack,
      ),
      body: ListView(
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 20.w,right: 20.w)       ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpacing(20),
                Text(
                  gradeName,
                  style: TextStyles.font20BoldBlack,
                ),
                verticalSpacing(20),
                const SemesterOneWidget(),
                verticalSpacing(20),
                const SemesterTwoWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }

}
