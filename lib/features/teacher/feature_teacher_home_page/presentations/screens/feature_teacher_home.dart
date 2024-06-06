import 'package:ablexa/core/helper/extentions.dart';
import 'package:ablexa/features/teacher/feature_teacher_home_page/logic/cubits/get_classes_by_teacher_id_cubit/get_classes_by_teacher_id_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Routing/routers.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/image_manager.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/profile_and_setting_widget.dart';
import '../widgets/teacher_classes.dart';

class TeacherHome extends StatefulWidget {
  const TeacherHome({super.key, required this.nameTeacher, required this.emailTeacher, required this.imageTeacher, required this.token, required this.nationalNumber, required this.TeacherId, required this.roleName});
  final String nameTeacher,emailTeacher,imageTeacher,token,nationalNumber,TeacherId,roleName;

  @override
  State<TeacherHome> createState() => _TeacherHomeState();
}

class _TeacherHomeState extends State<TeacherHome> {

  @override
  Widget build(BuildContext context) {
    setState(() {
      context.read<GetClassesByTeacherIdCubit>().emitAllStudentsByClassId(token: widget.token, teacherId: widget.TeacherId);
    });
    return Scaffold(
      backgroundColor: ColorsManager.grey,
      body: ListView(children: [
        Container(
          decoration: const BoxDecoration(color: ColorsManager.mainColor),
          child: Row(

            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(ImageManager.logoApp,height: 50.sp,width: 50.sp),
              ),
              horizontalSpacing(50.sp),
              Center(child: Text(S.of(context).home_page,style: TextStyles.font20BoldWhite,)),
              horizontalSpacing(90.sp),
              PopupMenuButton<String>(
                offset: const Offset(0, 40), // Offset to position menu under the icon
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    onTap: () {
                      context.pushNamed(Routes.teacherProfilePage,arguments: {
                        'TeacherId':widget.TeacherId,
                        'token':widget.token,
                        'nameTeacher':widget.nameTeacher,
                        'emailTeacher':widget.emailTeacher,
                        'imageTeacher':widget.imageTeacher,
                        'nationalNumber':widget.nationalNumber,
                      });
                    },
                    value: 'my_profile',
                    child: SizedBox(
                      width: 100.w,
                      child: Row(
                        children: [
                          const Icon(Icons.person_outline_sharp),
                          horizontalSpacing(5),
                          Text(S.of(context).my_profile, style: TextStyles.font12BlackBold),
                        ],
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    onTap: () {
                      context.pushNamed(Routes.settingPage);
                    },
                    value: 'settings',
                    child: SizedBox(
                        width: 100.w,
                        child: Row(children: [
                          const Icon(Icons.settings),
                          horizontalSpacing(5),
                          Text(S.of(context).setting, style: TextStyles.font12BlackBold),
                        ],)
                    ),
                  ),
                ],
                icon:  Image.asset(ImageManager.settingWhite), // Use Flutter's built-in Icon widget
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16), // Set border radius to 16
                ),
              ),
            ],
          ),
        ),
        verticalSpacing(20),
        Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w),
          child: Column(
            children: [

              ProfileInformationWidget(
                 imageTeacher: widget.imageTeacher,
                 emailTeacher: widget.emailTeacher,
                 nameTeacher: widget.nameTeacher,
               ),
              verticalSpacing(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).classes,
                    style: TextStyles.font20BoldBlack,
                  ),
                  verticalSpacing(10),
                   TeacherClasses(
                     token: widget.token,
                     teacherId: widget.TeacherId,
                     roleName: widget.roleName,
                  ),
                ],
              ),
              verticalSpacing(20),
            ],
          ),
        )
      ]),
    );
  }
}