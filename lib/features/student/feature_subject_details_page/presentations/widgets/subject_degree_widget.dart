import 'package:ablexa/core/helper/extentions.dart';
import 'package:ablexa/features/student/feature_subject_details_page/logic/cubits/subject_details_cubit/get_subject_details_cubit.dart';
import 'package:ablexa/features/student/feature_subject_details_page/logic/cubits/subject_details_cubit/get_subject_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/Routing/routers.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../data/models/subject_details_model/subject_details_model.dart';

class SubjectDegreeWidget extends StatefulWidget {
  const SubjectDegreeWidget(
      {Key? key,
      required this.studentId,
      required this.materialId,
      required this.token,
      required this.roleName, required this.TeacherId})
      : super(key: key);
  final String studentId, token, roleName,TeacherId;
  final int materialId;
  @override
  State<SubjectDegreeWidget> createState() => _SubjectDegreeWidgetState();
}

class _SubjectDegreeWidgetState extends State<SubjectDegreeWidget> {
  @override
  void initState() {
    context.read<SubjectDetailsCubit>().emitSubjectDetailsStates(widget.token,
        studentId: widget.studentId, materialId: widget.materialId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubjectDetailsCubit, SubjectDetailsState>(
      builder: (context, state) {
        return _buildContent(context, state);
      },
    );
  }

  Widget _buildContent(BuildContext context, SubjectDetailsState state) {
    return state.when(
      initial: () {
        return const Center(child: CircularProgressIndicator());
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
      success: (data) {
        final List<GetStudentGradesDetailsForOneMaterialModel>
            studentGradesDetailsForOneMaterialModel = data;
        return Column(
          children: [
            verticalSpacing(10),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Container(
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
                      Text("Total Subject", style: TextStyles.font20BoldBlack),
                      Text(
                        "${studentGradesDetailsForOneMaterialModel[0].materialGrade}/${studentGradesDetailsForOneMaterialModel[0].studentTotalGrade}",
                        style: TextStyles.font14MediumLightBlack
                            .copyWith(fontSize: 16.sp),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            verticalSpacing(10),
            Column(
              children: studentGradesDetailsForOneMaterialModel[0]
                  .exams!
                  .map((exam) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: examInformationWidget(
                          examId: exam.examId!,
                          roleName: widget.roleName,
                          imageExam: exam.generalExamImage!,
                          context,
                          quizName: exam.examName.toString(),
                          studentExamGrade: exam.studentExamGrade!,
                          examGrade: exam.examGrade!,
                        ),
                      ))
                  .toList(),
            ),
          ],
        );
      },
      error: (error) {
        return _showErrorDialog(context, error);
      },
    );
  }

  _showErrorDialog(BuildContext context, String error) {
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
              Navigator.of(context).pop();
            },
            child: Text(
              'Got It ',
              style: TextStyles.font20BoldBlack,
            ),
          ),
        ],
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
      ),
    );
  }

  GestureDetector examInformationWidget(BuildContext context,
      {required String roleName,

      required String imageExam,
      required String quizName,
      required int studentExamGrade,
      required int examGrade,
      required int examId,}) {
    // Check if studentExamGrade is 0
    final bool isNotUpdatedYet = studentExamGrade == 0;

    return GestureDetector(
      onTap: () {
        // Navigate to another page if the degree is "NotUpdatedYet"
        if (isNotUpdatedYet) {
          context.pushNamed(Routes.addExamDegree,arguments: {
            'roleName': roleName,
            'imageExam': imageExam,
            'totalDegreeFromExam': examGrade,
            'studentExamGrade': studentExamGrade,
            'quizName': quizName,
            'token':widget.token,
            'studentId':widget.studentId,
            'ExamId':examId,
            'TeacherId':widget.TeacherId,
          });
        } else {

          context.pushNamed(Routes.quizDegreePage, arguments: {
            'roleName': roleName,
            'imageExam': imageExam,
            'totalDegreeFromExam': examGrade,
            'studentExamGrade': studentExamGrade,
            'quizName': quizName,
            'token':widget.token,
            'studentId':widget.studentId,
            'ExamId':examId,
            'TeacherId':widget.TeacherId,
            'studentGradeId':widget.materialId,
          });
        }
      },
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: SizedBox(
          height: 70.h,
          child: Container(
            decoration: BoxDecoration(
              color: isNotUpdatedYet ? Colors.purple : ColorsManager.lighterPurple,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(quizName, style: TextStyles.font20BoldBlack),
                  Text(
                    isNotUpdatedYet ? 'NotUpdatedYet' : "$studentExamGrade/$examGrade",
                    style: isNotUpdatedYet
                        ? TextStyle(color: Colors.white)
                        : TextStyles.font18SemiBoldPurple,
                  ),
                ],
              ),
            ),
          ),

        ),
      ),
    );
  }
}
