import 'package:ablexa/core/helper/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/Routing/routers.dart';
import '../../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../../core/shared_widgets/success_widget.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
import '../../logic/cubits/add_teacher_cubit/add_teacher_cubit.dart';
import '../../logic/cubits/add_teacher_cubit/add_teacher_state.dart';
class AddTeacherButton extends StatefulWidget {
  const AddTeacherButton({super.key, required this.token, this.onPressedFunction});
final String token;
final Function()? onPressedFunction;
  @override
  State<AddTeacherButton> createState() => _AddTeacherButtonState();
}

class _AddTeacherButtonState extends State<AddTeacherButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 50.w, right: 50.w),
      child: BlocListener<AddTeacherCubit, AddTeacherState>(
        listener: (context, state) {
          state.when(
            initial: () {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.mainColor,
                ),
              );
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.mainColor,
                ),
              );
            },
            success: (data) {
              showSuccessDialog(onPressed: () {
                context.pop();
                context.pushNamed(Routes.homeManagerPage,
                    arguments: widget.token);
              }, context,
                  text: S.of(context).add_teacher,
                  contentText: S.of(context).add_teacher_successfully);
            },
            error: (error) {
              return AlertDialog(
                content: Text(
                  error,
                  style: TextStyles.font14MediumLightBlack,
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text(
                        'Got It ',
                        style: TextStyles.font20BoldBlack,
                      )),
                ],
                icon: const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 32,
                ),
              );
            },
          );
        },
        child: AppTextButton(
            buttonHeight: 60.h,
            textButton: S.of(context).add_teacher,
            onPressed:
              widget.onPressedFunction
            ),
      ),
    );
  }

}
