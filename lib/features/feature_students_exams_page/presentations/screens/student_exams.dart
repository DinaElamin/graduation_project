import 'package:ablexa/core/helper/extentions.dart';
import 'package:ablexa/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/Routing/routers.dart';
import '../../../../core/shared_widgets/appBar_widget.dart';
import '../../../../core/theming/image_manager.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../widgets/students_information_widget.dart';

class StudentExamsPage extends StatelessWidget {
  const StudentExamsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        AppBarWidget(
          widget: Row(children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: ColorsManager.mainBlack),
            ),
            IconButton(
              onPressed: () {
                context.pushNamed(Routes.settingPage);
              },
              icon: const Icon(Icons.settings, color: ColorsManager.mainBlack),
            ),
          ]),
          pageName: S.of(context).student_exams,
        ),
        verticalSpacing(20),
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(ImageManager.defaultImageProfile,
                          width: 50.w, height: 50.h),
                      horizontalSpacing(10),
                      Text("Shaban Salah Abdulhameed ",
                          style: TextStyles.font16SemiBoldBlack
                              .copyWith(fontSize: 14.sp)),
                    ],
                  ),
                ],
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
