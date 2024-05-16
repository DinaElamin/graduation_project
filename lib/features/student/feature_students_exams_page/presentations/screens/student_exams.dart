import '../../../../../core/helper/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/Routing/routers.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/students_information_widget.dart';

class StudentExamsPage extends StatelessWidget {
  const StudentExamsPage({super.key, required this.nameStudent, required this.emailStudent, required this.imageStudent, required this.nationalIdStudent, required this.classId});
final String nameStudent,emailStudent,imageStudent,nationalIdStudent;
final int classId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const BackButton(
            color: ColorsManager.mainBlack,
          ),
          title: Text(S.of(context).student_exams,
              style: TextStyles.font20BoldBlack),
          actions: [
            IconButton(
              onPressed: () {
                context.pushNamed(Routes.settingPage);
              },
              icon: const Icon(Icons.settings),
              color: ColorsManager.mainBlack,
            ),
          ],
          backgroundColor: ColorsManager.mainWhite),
      body: ListView(children: [
        verticalSpacing(20),
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            children: [
              GestureDetector(
                onTap:
                () {
                  context.pushNamed(Routes.studentProfilePage,arguments: {
                    'nameStudent':nameStudent,
                    'emailStudent':emailStudent,
                    'nationalIdStudent':nationalIdStudent,
                    'imageStudent':imageStudent,
                    'classId':classId
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                       CircleAvatar(backgroundImage: NetworkImage(imageStudent),
                       radius: 25.sp,),
                        horizontalSpacing(10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(nameStudent,
                                style: TextStyles.font16SemiBoldBlack
                                    .copyWith(fontSize: 14.sp)),
                            verticalSpacing(5),
                            Text(emailStudent,
                                style:TextStyles.font14MediumLightBlack),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              verticalSpacing(20),
              const StudentInformationsWidget(),
            ],
          ),
        )
      ]),
    );
  }
}
