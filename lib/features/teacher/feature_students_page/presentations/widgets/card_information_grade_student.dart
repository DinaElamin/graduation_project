import 'package:ablexa/core/helper/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/Routing/routers.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';

class CardInformationGradeStudents extends StatelessWidget {
  final String name, type, image, email, nationalIdStudent,subjectNameTeacher,roleName;
  final int classId;

  const CardInformationGradeStudents({
    Key? key,
    required this.name,
    required this.type,
    required this.image,
    required this.email,
    required this.nationalIdStudent,
    required this.classId, required this.subjectNameTeacher, required this.roleName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final String imageStudent = args['imageStudent'];
    // final String nameStudent = args['nameStudent'];
    // final String emailStudent = args['emailStudent'];
    // final String nationalIdStudent = args['nationalIdStudent'];
    // final int classId = args['classId'];
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.studentExamsPage, arguments: {
          'imageStudent': image,
          'nameStudent': name,
          'emailStudent': email,
          'nationalIdStudent': nationalIdStudent,
          'classId': classId,
          'subjectNameTeacher':subjectNameTeacher,
          'roleName':roleName,
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: ColorsManager.mainWhite,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage: NetworkImage(image)),
                horizontalSpacing(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(name, style: TextStyles.font12BlackBold),
                    verticalSpacing(10),
                    Text(
                      type,
                      style: TextStyles.font14MediumLightBlack
                          .copyWith(fontSize: 12.sp),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
