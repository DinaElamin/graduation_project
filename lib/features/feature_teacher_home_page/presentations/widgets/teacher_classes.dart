import 'package:ablexa/core/Routing/routers.dart';
import 'package:ablexa/core/helper/extentions.dart';
import 'package:ablexa/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';

class TeacherClasses extends StatefulWidget {
  const TeacherClasses({Key? key}) : super(key: key);

  @override
  State<TeacherClasses> createState() => _ClassCardListViewState();
}

class _ClassCardListViewState extends State<TeacherClasses> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 6, // Example itemCount, replace with your actual data length
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              // Update the selected index
              selectedIndex = index;
            });
            context.pushNamed(Routes.studentsPage,arguments: "Grade ${index+1}");
          },
          child: Container(
            height: 90.h,
            padding: EdgeInsets.only( top: 10.h),
            child: Card(
              color: selectedIndex == index ? ColorsManager.mainColor : null,
              shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(16.sp),
              ),
              child: ListTile(
                mouseCursor: MouseCursor.uncontrolled,
                title: Text('Grade ${index + 1}',
                    style: TextStyles.font20BoldBlack),
              ),
            ),
          ),
        );
      },
    );
  }
}