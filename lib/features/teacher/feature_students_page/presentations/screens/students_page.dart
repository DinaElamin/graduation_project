import 'package:ablexa/core/theming/styles.dart';
import 'package:ablexa/features/manager/feature_get_all_student_by_id_page/logic/get_all_students_by_class_id_cubit/get_all_students_by_class_id_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/card_list_view_for_students_garde.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage(
      {super.key, required this.className, required this.classId, required this.subjectNameTeacher, required this.roleName});
  final String className,subjectNameTeacher,roleName;
  final int classId;

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  @override
  Widget build(BuildContext context) {
    setState(() {
      context
          .read<GetAllStudentByClassIdCubit>()
          .emitAllStudentsByClassId(classId: widget.classId);
    });
    return Scaffold(
      appBar: AppBar(
          leading: const BackButton(
            color: ColorsManager.mainBlack,
          ),
          title:
              Text(S.of(context).students, style: TextStyles.font20BoldBlack),
          backgroundColor: ColorsManager.mainWhite),
      backgroundColor: ColorsManager.grey,
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpacing(10),
                  GradeStudents(
                    roleName: widget.roleName,
                      subjectNameTeacher:widget.subjectNameTeacher,
                      gradeName: widget.className,classId: widget.classId),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
