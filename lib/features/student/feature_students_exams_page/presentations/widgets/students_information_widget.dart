import 'package:ablexa/features/manager/feature_student_edit_profile_page/data/models/get_student_by_id_model.dart';
import 'package:ablexa/features/manager/feature_student_edit_profile_page/logic/cubits/get_students_by_id_cubit/get_students_by_id_cubit.dart';
import 'package:ablexa/features/manager/feature_student_edit_profile_page/logic/cubits/get_students_by_id_cubit/get_students_by_id_state.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
import 'attendence_widget.dart';
import 'behaviors_widget.dart';
import 'exam_widget.dart';

class StudentInformationsWidget extends StatefulWidget {
  const StudentInformationsWidget({Key? key, required this.roleName, required this.teacherId, required this.studentId, required this.token});
final String roleName,teacherId,studentId,token;

  @override
  State<StudentInformationsWidget> createState() => _StudentInformationsWidgetState();
}

class _StudentInformationsWidgetState extends State<StudentInformationsWidget> {
  @override


  Widget build(BuildContext context) {
    setState(() {

      context
          .read<GetStudentByIdCubit>()
          .emitAllStudentsByClassId(studentId: widget.studentId);
    });
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultTabController(
          initialIndex: 1  ,
          length: 3, // Match the number of tabs
          child: Column(
            children: <Widget>[
              ButtonsTabBar(
                height: 50.h,
                labelSpacing: 20,
                radius: 16,
                contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  color: ColorsManager.mainColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                unselectedBackgroundColor: ColorsManager.grey,
                labelStyle: const TextStyle(
                  color: ColorsManager.mainWhite,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: TextStyle(
                  color: ColorsManager.mainBlack.withOpacity(0.4),
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                ),
                tabs: [
                  Tab(text: S.of(context).attendence),
                  Tab(text: S.of(context).exams),
                  Tab(text: S.of(context).behaviors),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7, // Adjust height as needed
                child:  TabBarView(
                  children: [
                    // Add your TabBarView children here
                    const AttendenceWidget(),
                  // ExamWidget(
                  //   token: widget.token,
                  //   studentId:widget.studentId,
                  //   termId: 110,
                  //   teacherId: widget.teacherId,
                  //   roleName: widget.roleName,
                  // ),
                    BlocBuilder<GetStudentByIdCubit,
                        GetStudentByIdState>(
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
                          final GetStudentByIdModel
                          getStudentByIdModel = data;
                          return ExamWidget(
                            studentId:widget.studentId,
                            termId: getStudentByIdModel.term!.termId!,
                            teacherId: widget.teacherId,
                            roleName: widget.roleName, token: widget.token,
                          );
                        }, error: (error) {
                          return setupErrorState(context, error);
                        });
                      },
                    ),
                    BehaviorsWidget(), // Adjust as needed
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

   setupErrorState(BuildContext context, String error) {
    Navigator.of(context).pop();
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
}
