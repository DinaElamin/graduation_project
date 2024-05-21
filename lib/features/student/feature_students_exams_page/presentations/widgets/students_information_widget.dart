import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../generated/l10n.dart';
import 'attendence_widget.dart';
import 'behaviors_widget.dart';
import 'exam_widget.dart';

class StudentInformationsWidget extends StatelessWidget {
  const StudentInformationsWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultTabController(
          initialIndex: 1  ,
          length: 3, // Match the number of tabs
          child: Column(
            children: <Widget>[
              ButtonsTabBar(
                height: 50.h,
                labelSpacing: 20,
                radius: 16,
                contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  color: ColorsManager.mainColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                unselectedBackgroundColor: ColorsManager.grey,
                labelStyle: const TextStyle(
                  color: ColorsManager.mainWhite,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: TextStyle(
                  color: ColorsManager.mainBlack.withOpacity(0.4),
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                ),
                tabs: [
                  Tab(text: S.of(context).attendence),
                  Tab(text: S.of(context).exams),
                  Tab(text: S.of(context).behaviors),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7, // Adjust height as needed
                child: const TabBarView(
                  children: [
                    // Add your TabBarView children here
                    AttendenceWidget(),
                    ExamWidget(),
                    BehaviorsWidget(), // Adjust as needed
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
