import 'package:ablexa/core/helper/extentions.dart';
import 'package:ablexa/core/theming/spacing.dart';
import 'package:ablexa/features/student/feature_students_exams_page/data/models/get_student_attendance_model.dart';
import 'package:ablexa/features/student/feature_students_exams_page/logic/cubits/get_student_attendance_cubit.dart';
import 'package:ablexa/features/student/feature_students_exams_page/logic/cubits/get_student_attendance_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class AttendenceWidget extends StatefulWidget {
  const AttendenceWidget(
      {super.key, required this.studentId, required this.token});
  final String studentId, token;

  @override
  State<AttendenceWidget> createState() => _AttendenceWidgetState();
}
class _AttendenceWidgetState extends State<AttendenceWidget> {
  
   
   @override
  
  Widget build(BuildContext context) {
   setState((){
      context
          .read<GetStudentAttendanceCubit>()
          .emitStudentAttendance(
         widget.token,
         studentId: widget.studentId);
    });
    return ListView(
      children: [
        verticalSpacing(10),
        SingleChildScrollView(
            child: Column(children: [
          BlocBuilder<GetStudentAttendanceCubit, GetStudentAttendanceState>(
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
                final List<GetStudentAttendanceModel>
                getStudentAttendanceModel = data;
                return ListView.builder(
                  itemCount: getStudentAttendanceModel.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: ColorsManager.grey,
                        borderRadius: BorderRadius.circular(16.sp),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.w, right: 10.w),
                        child:itemAttendance(date:getStudentAttendanceModel[index].date_Day.toString(),value: getStudentAttendanceModel[index].total!,)
                      ),
                      
                    ),
                  ),
                );
              }, error: (error) {
                return setupErrorState(context, error);
              });
            },
          ),
        ])),
      ],
    );
  }
  //   return ListView.builder(
  //     itemCount: 1,
  //     shrinkWrap: true,
  //     physics: const AlwaysScrollableScrollPhysics(),
  //     itemBuilder: (context, index) =>   Padding(
  //       padding:  EdgeInsets.only(top: 5.h,bottom: 5.h),
  //       child: Container(
  //         height: 60.h,
  //         decoration: BoxDecoration(
  //           color: ColorsManager.grey,
  //           borderRadius: BorderRadius.circular(16.sp),
  //         ),
  //         child: Padding(
  //           padding:  EdgeInsets.only(left: 10.w,right: 10.w),
  //           child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Text("1/1/2024", style: TextStyles.font20BoldBlack.copyWith(fontSize: 15.sp),),
  //                 Container(
  //                   height: 40.h,
  //                   width: 90.w,
  //                   decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(16.sp),
  //                       color: ColorsManager.lightGreenColor),
  //                   child: Center(child: Text("Present",style: TextStyles.font15MediumDarkGreen,)),)
  //               ]),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

class itemAttendance extends StatelessWidget {
   itemAttendance({super.key, required String date, required int value});
  late String date;
  late int value;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        date,
        style: TextStyles.font20BoldBlack.copyWith(fontSize: 15.sp),
      ),
      value ==0?
      Container(
        height: 40.h,
        width: 90.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.sp),
            color: ColorsManager.lighterRedColor),
        child: Center(
            child: Text(
          "Absent",
          style: TextStyles.font15MediumDarkred,
        )),
      ):Container(
        height: 40.h,
        width: 90.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.sp),
            color: ColorsManager.lightGreenColor),
        child: Center(
            child: Text(
          "Present",
          style: TextStyles.font15MediumDarkGreen,
        )),
      )
    ]);
  }
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
