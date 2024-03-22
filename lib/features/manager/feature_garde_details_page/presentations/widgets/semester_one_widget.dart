import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/image_manager.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
class SemesterOneWidget extends StatefulWidget {
  const SemesterOneWidget({Key? key}) : super(key: key);

  @override
  State<SemesterOneWidget> createState() => _SemesterOneDropDownState();
}

class _SemesterOneDropDownState extends State<SemesterOneWidget> {
  final List<String> items = ['Math', 'English', 'Arabic', 'Science','Computer Science','History'];
  bool showSubjectsList = false;
  List<String> selectedSubjects = []; // Initialize selectedSubjects list

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 20.h),
          GestureDetector(
            onTap: () {
              setState(() {
                showSubjectsList = !showSubjectsList;
              });
            },
            child: Container(
              height: 60.h,
              width: double.infinity,
              padding: EdgeInsets.only(left: 14.w, right: 14.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.black26,
                ),
                color: ColorsManager.mainColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).semester_one_subject,
                    style: TextStyles.font16SemiBoldBlack.copyWith(
                      color: ColorsManager.mainWhite,
                    ),
                  ),
                  Icon(Icons.arrow_drop_down, color: ColorsManager.mainWhite, size: 25.sp,),
                ],
              ),
            ),
          ),
          if (showSubjectsList && selectedSubjects.isNotEmpty) // Only show list if not empty
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 5.h,
              ),
              decoration: BoxDecoration(
                color: ColorsManager.mainWhite,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: selectedSubjects
                    .map(
                      (subject) => Chip(
                    padding: EdgeInsets.all(20.sp),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          subject,
                          style: TextStyles.font16SemiBoldBlack,
                        ),
                      ],
                    ),
                    backgroundColor: ColorsManager.grey.withOpacity(0.5),
                    deleteIconColor: Colors.black,
                    deleteIcon: Image.asset(ImageManager.minusIcon),
                    onDeleted: () {
                      setState(() {
                        selectedSubjects.remove(subject);
                      });
                    },
                  ),
                )
                    .toList(),
              ),
            ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
