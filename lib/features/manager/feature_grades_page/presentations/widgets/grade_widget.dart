import 'package:ablexa/core/di/dependacy_injection.dart';
import 'package:ablexa/features/manager/feature_grades_page/logic/cubits/delete_grade_cubit/delete_grade_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helper/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/Routing/routers.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';

class GradeWidget extends StatelessWidget {
  final String gradeName, token;
  final int yearId;

  const GradeWidget({
    required this.gradeName,
    Key? key,
    required this.token,
    required this.yearId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h, bottom: 10.h),
      child: GestureDetector(
        onTap: () {
          context.pushNamed(Routes.gradeDetailsPage, arguments: {
            'token':token,
            'materialid':yearId,
            'gradeName':gradeName
          });
        },
        child: Container(
          height: 70.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ColorsManager.mainColor),
          child: ListTile(
            title: Text(gradeName, style: TextStyles.font18SemiBoldWhite),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: ColorsManager.mainWhite),
              onPressed: () {
                context
                    .read<DeleteGradeCubit>()
                    .emitDeleteGradeStates(token: token, yearId: yearId);
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showDeleteConfirmationDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text(
            S.of(context).delete_garde,
            textAlign: TextAlign.center,
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  // Use context.read to access the DeleteGradeCubit instance
                  context.read<DeleteGradeCubit>().emitDeleteGradeStates(token: token, yearId: yearId);
                  Navigator.of(context).pop(true);
                },
                child: Container(
                  height: 30.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                        color: ColorsManager.mainBlack.withOpacity(0.3)),
                  ),
                  child: Center(
                    child: Text(
                      S.of(context).delete,
                      style: TextStyles.font12RegularPurple.copyWith(color: Colors.red),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w), // Add spacing between buttons
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Container(
                  height: 30.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                        color: ColorsManager.mainBlack.withOpacity(0.3)),
                  ),
                  child: Center(
                    child: Text(
                      S.of(context).cancel,
                      style: TextStyles.font12RegularPurple.copyWith(color: ColorsManager.mainBlack),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

}
