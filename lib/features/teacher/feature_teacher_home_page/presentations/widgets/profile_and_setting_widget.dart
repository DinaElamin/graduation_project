
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ProfileInformationWidget extends StatelessWidget {
  const ProfileInformationWidget({
    super.key, required this.nameTeacher, required this.emailTeacher, required this.imageTeacher,
  });
  final String nameTeacher,emailTeacher,imageTeacher;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage:  NetworkImage(imageTeacher),
              radius: 30.sp,
            ),
            horizontalSpacing(10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nameTeacher,
                    style: TextStyles.font16SemiBoldBlack),
                Text(emailTeacher,
                    style: TextStyles.font14MediumLightBlack),
              ],
            )
          ],
        ),

      ],
    );
  }
}