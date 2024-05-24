import 'package:ablexa/features/manager/feature_add_student_page/logic/cubits/get_all_semester_cubit/get_all_year_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ablexa/core/helper/extentions.dart';
import 'package:ablexa/core/theming/colors.dart';
import 'package:ablexa/core/theming/styles.dart';
import 'package:ablexa/core/Routing/routers.dart';
import 'package:ablexa/features/manager/feature_grades_page/logic/cubits/delete_grade_cubit/delete_grade_cubit.dart';
import 'package:ablexa/generated/l10n.dart';

import '../../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../../core/theming/spacing.dart';

class GradeWidget extends StatefulWidget {
  final String gradeName, token;
  final int yearId;

  const GradeWidget({
    required this.gradeName,
    Key? key,
    required this.token,
    required this.yearId,
  }) : super(key: key);

  @override
  State<GradeWidget> createState() => _GradeWidgetState();
}

class _GradeWidgetState extends State<GradeWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h, bottom: 10.h),
      child: GestureDetector(
        onTap: () {
          context.pushNamed(Routes.gradeDetailsPage, arguments: {
            'token': widget.token,
            'gradeName': widget.gradeName,
            'materialid':widget.yearId,
          });
        },
        child: Container(
          height: 70.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ColorsManager.mainColor,
          ),
          child: ListTile(
            title: Text(widget.gradeName, style: TextStyles.font18SemiBoldWhite),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: ColorsManager.mainWhite),
              onPressed: () {
                showDialog<void>(
                    context: context,
                    builder: (BuildContext dialogContext) {
                  final deleteGradeGradeCubit = context
                      .read<DeleteGradeCubit>();
                  return AlertDialog(
                    content: Text("Delete Grade ?? ",style: TextStyles.font20BoldBlack,),
                    actions: <Widget>[
                      AppTextButton(
                          buttonHeight: 25.r,
                          buttonWidth: 60.r,
                          textButton: "Delete",
                          onPressed: () {
                            deleteGradeGradeCubit
                                .emitDeleteGradeStates(
                              token: widget.token,yearId: widget.yearId);
                            Navigator.of(dialogContext)
                                .pop();
                            setState(() {
                              context.read<GetAllYearDataCubit>().emitAllYearStates();
                            });
                          }),
                      verticalSpacing(10),
                      AppTextButton(
                          buttonHeight: 25.r,
                          buttonWidth: 60.r,
                          textButton:
                          S.of(context).cancel,
                          onPressed: () {
                            Navigator.of(dialogContext)
                                .pop();
                          }),
                    ],
                  );
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
