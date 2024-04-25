import '../../../../../core/helper/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/Routing/routers.dart';
import '../../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';


class AddButtonsFromManager extends StatefulWidget {
  const AddButtonsFromManager({Key? key, required this.token}) : super(key: key);
final String token;
  @override
  _AddButtonsFromManagerState createState() => _AddButtonsFromManagerState();
}

class _AddButtonsFromManagerState extends State<AddButtonsFromManager> {
  bool isStudentButtonPressed = false;
  bool isTeacherButtonPressed = false;
  bool isGradeButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: buildButton(
                  buttonText: 'Add Student',
                  onPressed: () {
                    setState(() {
                      isStudentButtonPressed = true;
                      isTeacherButtonPressed = false;
                      isGradeButtonPressed = false;
                    });
                    context.pushNamed(Routes.addStudentPage,arguments: widget.token);
                  },
                  isPressed: isStudentButtonPressed,

                ),
              ),
              horizontalSpacing(40),
              Expanded(
                child: buildButton(
                  buttonText: 'Add Teacher',
                  onPressed: () {
                    setState(() {
                      isStudentButtonPressed = false;
                      isTeacherButtonPressed = true;
                      isGradeButtonPressed = false;
                    });
                    context.pushNamed(Routes.addTeacherPage,arguments: "Bearer ${widget.token}");
                  },
                  isPressed: isTeacherButtonPressed,
                ),
              )
            ],
          ),
          verticalSpacing(20),
          Padding(
            padding: EdgeInsets.only(left: 70.w, right: 70.w),
            child: buildButton(
              buttonText: 'Add Grade',
              onPressed: () {
                setState(() {
                  isStudentButtonPressed = false;
                  isTeacherButtonPressed = false;
                  isGradeButtonPressed = true;
                });
                context.pushNamed(Routes.addGradePage);
              },
              isPressed: isGradeButtonPressed,
            ),
          )
        ],
      ),
    );
  }

  Widget buildButton({
    required String buttonText,
    required VoidCallback onPressed,
    required bool isPressed,
  }) {
    return AppTextButton(
      textStyle: isPressed
          ? TextStyles.font18SemiBoldWhite.copyWith(fontSize: 16.sp)
          : TextStyles.font16SemiBoldBlack,
      buttonWidth: 120.w,
      backgroundColor: isPressed ? ColorsManager.mainColor : ColorsManager.grey,
      textButton: buttonText,
      onPressed: onPressed,
    );
  }
}
