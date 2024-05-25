import 'package:ablexa/core/helper/extentions.dart';
import 'package:ablexa/features/manager/feature_edit_profile_teacher_page/logic/cubits/edit_teacher_cubit/edit_teacher_cubit.dart';
import 'package:ablexa/features/manager/feature_edit_profile_teacher_page/logic/cubits/edit_teacher_cubit/edit_teacher_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../../core/shared_widgets/success_widget.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
class EditTeacherButton extends StatefulWidget {
  const EditTeacherButton({super.key, required this.token, this.onPressedFunction});
final String token;
final Function()? onPressedFunction;
  @override
  State<EditTeacherButton> createState() => _EditTeacherButtonState();
}

class _EditTeacherButtonState extends State<EditTeacherButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 50.w, right: 50.w),
      child: BlocListener<EditTeacherCubit, EditTeacherState>(
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

              }, context,
                  text: S.of(context).edit,
                  contentText: "Edit Teacher Successfully !!");
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
            textButton: S.of(context).edit_teacher,
            onPressed:
              widget.onPressedFunction
            ),
      ),
    );
  }

}
