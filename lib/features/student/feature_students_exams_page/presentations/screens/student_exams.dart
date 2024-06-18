import 'package:ablexa/features/feature_setting_page/presentations/screens/setting_page.dart';
import 'package:ablexa/features/student/feature_student_profile_page/presentations/screens/student_profile_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../../../../../core/helper/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/Routing/routers.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/image_manager.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/students_information_widget.dart';

class StudentExamsPage extends StatefulWidget {
  const StudentExamsPage(
      {super.key,
      required this.nameStudent,
      required this.emailStudent,
      required this.imageStudent,
      required this.nationalIdStudent,
      required this.classId,
      required this.roleName,
      required this.teacherId,
      required this.studentId,
      required this.token});
  final String nameStudent,
      emailStudent,
      studentId,
      imageStudent,
      nationalIdStudent,
      roleName,
      teacherId,
      token;
  final int classId;

  @override
  State<StudentExamsPage> createState() => _StudentExamsPageState();
}

class _StudentExamsPageState extends State<StudentExamsPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.roleName == 'Teacher'
          ? AppBar(
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
              backgroundColor: ColorsManager.mainWhite)
          : AppBar(
              automaticallyImplyLeading: false,
              backgroundColor:
                  ColorsManager.mainColor, // Change color to your preference
              title: Row(
                children: [
                  Image.asset(ImageManager.logoApp,
                      height: 50.sp, width: 50.sp),
                  horizontalSpacing(50),
                  const Text(
                    "Student Home",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              actions: [
                PopupMenuButton<String>(
                  offset: const Offset(0, 40),
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem(
                      onTap: () {
                        context
                            .pushNamed(Routes.studentProfilePage, arguments: {
                          'nameStudent': widget.nameStudent,
                          'emailStudent': widget.emailStudent,
                          'nationalIdStudent': widget.nationalIdStudent,
                          'imageStudent': widget.imageStudent,
                          'classId': widget.classId
                        });
                      },
                      value: 'my_profile',
                      child: const Row(
                        children: [
                          Icon(Icons.person_outline_sharp),
                          SizedBox(width: 5),
                          Text('My Profile'),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        context.pushNamed(Routes.settingPage);
                      },
                      value: 'settings',
                      child: const Row(
                        children: [
                          Icon(Icons.settings),
                          SizedBox(width: 5),
                          Text('Settings'),
                        ],
                      ),
                    ),
                  ],
                  icon: const Icon(Icons.settings),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
      body: IndexedStack(index: _currentIndex, children: [
        ListView(children: [
          verticalSpacing(20),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    context.pushNamed(Routes.studentProfilePage, arguments: {
                      'nameStudent': widget.nameStudent,
                      'emailStudent': widget.emailStudent,
                      'nationalIdStudent': widget.nationalIdStudent,
                      'imageStudent': widget.imageStudent,
                      'classId': widget.classId
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(widget.imageStudent),
                            radius: 25.sp,
                          ),
                          horizontalSpacing(10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.nameStudent,
                                  style: TextStyles.font16SemiBoldBlack
                                      .copyWith(fontSize: 14.sp)),
                              verticalSpacing(5),
                              Text(widget.emailStudent,
                                  style: TextStyles.font14MediumLightBlack),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                verticalSpacing(20),
                StudentInformationsWidget(
                  token: widget.token,
                  studentId: widget.studentId,
                  teacherId: widget.teacherId,
                  roleName: widget.roleName,
                ),
              ],
            ),
          )
        ]),
        StudentProfilePage(
            imageStudent: widget.imageStudent,
            nameStudent: widget.nameStudent,
            emailStudent: widget.emailStudent,
            nationalIdStudent: widget.nationalIdStudent,
            classId: widget.classId),
        SettingPage()
      ]),
      bottomNavigationBar: CurvedNavigationBar(  
        color: Color(0xff6C63FF),
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Color(0xff6C63FF),
        animationDuration: Duration(milliseconds: 500),
          index: _currentIndex,
          items: const <Widget>[
            Icon(Icons.home, size: 30,color: Colors.white),
            Icon(Icons.person, size: 30,color: Colors.white),
            Icon(Icons.settings, size: 30,color: Colors.white),
            
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });},
      ),
    );
  }
}
