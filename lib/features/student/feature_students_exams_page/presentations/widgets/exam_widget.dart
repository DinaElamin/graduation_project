import '../../../../../core/helper/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/Routing/routers.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';

class ExamWidget extends StatelessWidget {
  const ExamWidget({Key? key, required this.subjectNameTeacher, required this.roleName}) : super(key: key);
final String subjectNameTeacher,roleName;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        verticalSpacing(10),
        Container(
          height: 70.h,
          decoration: BoxDecoration(
            color: ColorsManager.grey,
            borderRadius: BorderRadius.circular(8.sp),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Subjects ", style: TextStyles.font20BoldBlack),
                Text(
                  "Total grades",
                  style: TextStyles.font14MediumLightBlack
                      .copyWith(fontSize: 16.sp),
                ),
              ],
            ),
          ),
        ),
        verticalSpacing(10),
        SingleChildScrollView(
          child: Column(
            children: [
              roleName == 'Teacher'
                  ? examInformationWidget(
                      context,
                      subjectName: subjectNameTeacher,
                      totalDegree: "40/60",
                    )
                  : ListView.builder(
                      itemCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: examInformationWidget(
                          context,
                          subjectName: "Science",
                          totalDegree: "40/60",
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ],
    );
  }

  GestureDetector examInformationWidget(BuildContext context,
      {required String subjectName, required String totalDegree}) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.subjectDetailsPage, arguments: subjectName);
      },
      child: SizedBox(
        height: 70.h,
        child: Container(
          color: ColorsManager.lighterPurple,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(subjectName, style: TextStyles.font20BoldBlack),
                Text(totalDegree, style: TextStyles.font18SemiBoldPurple),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
