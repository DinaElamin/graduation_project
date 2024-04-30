import 'students_list_view.dart';
import 'teachers_list_view.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
import 'class_card_list_veiw.dart';
class UsersWidget extends StatelessWidget {
  const UsersWidget({
    super.key, required this.token,
  });
final String token;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.only(left: 20.w,right: 20.w),
          child: Text(
            S.of(context).users,
            style: TextStyles.font16SemiBoldBlack,
          ),
        ),
        verticalSpacing(20),
        DefaultTabController(
          animationDuration: const Duration(milliseconds: 30),
          length: 3,
          child: Column(
            children: <Widget>[
              ButtonsTabBar(
                height: 50.h,
                labelSpacing: 30,
                radius: 16,
                contentPadding: EdgeInsets.only(left: 30.w,right: 30.w),
                decoration: BoxDecoration(
                  color: ColorsManager.mainColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                unselectedBackgroundColor: ColorsManager.mainWhite,
                labelStyle: const TextStyle(
                  color: ColorsManager.mainWhite,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle:  TextStyle(
                    color: ColorsManager.mainBlack.withOpacity(0.4),
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp
                ),
                tabs: [
                  Tab(text: S.of(context).teachers),
                  Tab(text: S.of(context).students),
                  Tab(text: S.of(context).classes),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height, // Set a height constraint
                child:   TabBarView(
                  children: [
                    // Add your TabBarView children here
                    TeachersListView(token: token),
                    StudentsListView(token: token),
                    const ClassCardListView(),
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