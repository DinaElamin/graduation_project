import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';

class CardInformationGradeStudents extends StatelessWidget {
  final String name, type, image;

  const CardInformationGradeStudents({
    Key? key,
    required this.name,
    required this.type,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // context.pushNamed(Routes.studentExamsPage,arguments: {
        //
        // });
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
               CircleAvatar( backgroundImage: NetworkImage(image)),
                horizontalSpacing(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(name, style: TextStyles.font12BlackBold),
                    verticalSpacing(10),
                    Text(
                      type,
                      style: TextStyles.font14MediumLightBlack.copyWith(fontSize: 12.sp),
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
