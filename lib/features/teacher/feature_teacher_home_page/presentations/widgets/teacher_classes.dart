import 'package:ablexa/features/teacher/feature_teacher_home_page/data/models/get_classes_by_teacher_Id_model/get_classes_by_teacher_Id_model.dart';
import 'package:ablexa/features/teacher/feature_teacher_home_page/logic/cubits/get_classes_by_teacher_id_cubit/get_classes_by_teacher_id_cubit.dart';
import 'package:ablexa/features/teacher/feature_teacher_home_page/logic/cubits/get_classes_by_teacher_id_cubit/get_classes_by_teacher_id_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helper/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/Routing/routers.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class TeacherClasses extends StatefulWidget {
  const TeacherClasses({Key? key,  required this.roleName, required this.teacherId, required this.token}) : super(key: key);
final String roleName,teacherId,token;
  @override
  State<TeacherClasses> createState() => _ClassCardListViewState();
}

class _ClassCardListViewState extends State<TeacherClasses> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetClassesByTeacherIdCubit, GetClassesByTeacherIdState>(
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
          final List<GetClassesByTeacherIdModel> getClassesByTeacherIdModel = data;
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: getClassesByTeacherIdModel
                .length, // Example itemCount, replace with your actual data length
            itemBuilder: (context, index) {
              return  GestureDetector(
                onTap: () {
                  setState(() {
                    // Update the selected index
                    selectedIndex = index;
                  });
                  context.pushNamed(Routes.studentsPage, arguments: {
                    'className': getClassesByTeacherIdModel[index].name,
                    'classId':getClassesByTeacherIdModel[index].id,
                    'roleName':widget.roleName,
                    'teacherId':widget.teacherId,
                    'token':widget.token
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 70.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ColorsManager.mainColor,
                    ),
                    child: ListTile(
                      title: Text(getClassesByTeacherIdModel[index].name.toString(), style: TextStyles.font18SemiBoldWhite),

                    ),
                  ),
                ),
              );
            },
          );
        }, error: (error) {
          return setupErrorState(context, error);
        });
      },
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
