import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helper/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/Routing/routers.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../manager/feature_home_manager_page/data/models/get_all_classes_model/get_all_classes_model.dart';
import '../../../../manager/feature_home_manager_page/logic/cubits/get_all_classes_cubit/get_all_classes_cubit.dart';
import '../../../../manager/feature_home_manager_page/logic/cubits/get_all_classes_cubit/get_all_classes_state.dart';

class TeacherClasses extends StatefulWidget {
  const TeacherClasses({Key? key}) : super(key: key);

  @override
  State<TeacherClasses> createState() => _ClassCardListViewState();
}

class _ClassCardListViewState extends State<TeacherClasses> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllClassesDataCubit, GetAllClassesDataState>(
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
          final List<GetAllClassesModel> getAllClassesModel = data;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: getAllClassesModel
                .length, // Example itemCount, replace with your actual data length
            itemBuilder: (context, index) {
              return  GestureDetector(
                onTap: () {
                  setState(() {
                    // Update the selected index
                    selectedIndex = index;
                  });
                  context.pushNamed(Routes.studentsPage, arguments: {
                    'className': getAllClassesModel[index].className,
                    'classId':getAllClassesModel[index].classId
                  });
                },
                child: Container(
                  height: 90.h,
                  padding: EdgeInsets.only(top: 10.h),
                  child: Card(
                    color: selectedIndex == index
                        ? ColorsManager.mainColor
                        : null,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.sp),
                    ),
                    child: ListTile(
                      mouseCursor: MouseCursor.uncontrolled,
                      title: Text(
                          getAllClassesModel[index].className.toString(),
                          style: TextStyles.font20BoldBlack),
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
