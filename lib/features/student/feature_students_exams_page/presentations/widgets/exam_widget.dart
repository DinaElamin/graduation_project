import 'package:ablexa/features/student/feature_students_exams_page/data/models/get_material_by_teacher_id_model/get_material_by_teacher_id_model.dart';
import 'package:ablexa/features/student/feature_students_exams_page/logic/cubits/get_material_by_teacher_id_cubit/get_material_by_teacher_id_cubit.dart';
import 'package:ablexa/features/student/feature_students_exams_page/logic/cubits/get_material_by_teacher_id_cubit/get_material_by_teacher_id_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/Routing/routers.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';

class ExamWidget extends StatefulWidget {
  const ExamWidget({Key? key,  required this.roleName, required this.teacherId}) : super(key: key);
final String roleName,teacherId;

  @override
  State<ExamWidget> createState() => _ExamWidgetState();
}

class _ExamWidgetState extends State<ExamWidget> {

  @override
  Widget build(BuildContext context) {
    setState(() {
      context
          .read<GetMaterialByTeacherIdCubit>()
          .emitMaterialByTeacherIdStates(TeacherId: widget.teacherId);
    });
    return ListView(
      children: [
        verticalSpacing(10),
        Container(
          height: 70.h,
          decoration: BoxDecoration(
            color: ColorsManager.grey,
            borderRadius: BorderRadius.circular(8.sp),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Subjects ", style: TextStyles.font20BoldBlack),
                Text(
                  "Total grades",
                  style: TextStyles.font14MediumLightBlack
                      .copyWith(fontSize: 16.sp),
                ),
              ],
            ),
          ),
        ),
        verticalSpacing(10),
        SingleChildScrollView(
          child: Column(
            children: [
              widget.roleName == 'Teacher'
                  ? BlocBuilder<GetMaterialByTeacherIdCubit,
              GetMaterialByTeacherIdState>(
              builder: (context, state) {
                return state.when(initial: () {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.mainColor,
                    ),
                  );
                }, loading: () {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.mainColor,
                    ),
                  );
                }, success: (data) {
                  final List<GetMaterialByTeacherIdModel>
                  getMaterialByTeacherIdModel = data;
                  return examInformationWidget(
                    context,
                    subjectName: getMaterialByTeacherIdModel[0].name.toString(),
                    totalDegree: "40/${getMaterialByTeacherIdModel[0].m_grade}",
                  );
                }, error: (error) {
                  return setupErrorState(context, error);
                });
              },
              )
                  : ListView.builder(
                      itemCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: examInformationWidget(
                          context,
                          subjectName: "Science",
                          totalDegree: "40/60",
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ],
    );
  }

  GestureDetector examInformationWidget(BuildContext context,
      {required String subjectName, required String totalDegree}) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.subjectDetailsPage, arguments: subjectName);
      },
      child: SizedBox(
        height: 70.h,
        child: Container(
          color: ColorsManager.lighterPurple,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(subjectName, style: TextStyles.font20BoldBlack),
                Text(totalDegree, style: TextStyles.font18SemiBoldPurple),
              ],
            ),
          ),
        ),
      ),
    );
  }

  setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
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
      ),
    );
  }
}
