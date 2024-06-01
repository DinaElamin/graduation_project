import 'package:ablexa/features/student/feature_students_exams_page/data/models/get_student_material_grade_model/get_student_material_grade_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helper/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/Routing/routers.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../logic/cubits/get_student_material_grade_cubit/get_student_material_grade_cubit.dart';
import '../../logic/cubits/get_student_material_grade_cubit/get_student_material_grade_state.dart';

class ExamWidget extends StatefulWidget {
  const ExamWidget({Key? key,  required this.roleName, required this.teacherId, required this.studentId, required this.termId, required this.token}) : super(key: key);
final String roleName,teacherId,studentId,token;
final int termId;
  @override
  State<ExamWidget> createState() => _ExamWidgetState();
}

class _ExamWidgetState extends State<ExamWidget> {

  @override
  Widget build(BuildContext context) {
    setState(() {

      context
          .read<GetStudentMaterialGradeCubit>()
          .emitStudentMaterialGrade(
        widget.token,
         studentId: widget.studentId,termId: widget.termId,);
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
              BlocBuilder<GetStudentMaterialGradeCubit,
              GetStudentMaterialGradeState>(
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
                  final List<GetStudentMaterialGradeModel>
                  getStudentMaterialGradeModel = data;
                 return ListView.builder(
                   itemCount: getStudentMaterialGradeModel.length,
                   shrinkWrap: true,
                   physics: const NeverScrollableScrollPhysics(),
                   itemBuilder: (context, index) => Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: examInformationWidget(
                       materialId: getStudentMaterialGradeModel[index].materialId!,
                       context,
                       subjectName: getStudentMaterialGradeModel[index].materialName.toString(),
                       totalDegree: "${getStudentMaterialGradeModel[index].studentTotalGrade}/${getStudentMaterialGradeModel[index].materialGrade}",
                     ),
                   ),
                 );

                }, error: (error) {
                  return setupErrorState(context, error);
                });
              },
              ),
          ])
        ),
      ],
    );
  }

  GestureDetector examInformationWidget(BuildContext context,
      {required String subjectName, required String totalDegree,required int materialId}) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.subjectDetailsPage, arguments: {
          'roleName':widget.roleName,
          'token':widget.token,
          'subjectName':subjectName,
          'studentId':widget.studentId,
          'materialId':materialId,
          'TeacherId':widget.teacherId,

        });
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
