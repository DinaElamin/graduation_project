import 'package:ablexa/features/manager/feature_home_manager_page/logic/cubits/delete_user_cubit/delete_user_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Routing/routers.dart';
import '../../../../../core/helper/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/image_manager.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../feature_student_edit_profile_page/data/models/get_student_by_id_model/get_student_by_id_model.dart';
import '../../../feature_student_edit_profile_page/logic/cubits/get_students_by_id_cubit/get_students_by_id_cubit.dart';
import '../../../feature_student_edit_profile_page/logic/cubits/get_students_by_id_cubit/get_students_by_id_state.dart';

class StudentCard extends StatefulWidget {
  final String name, type, image, id, token,email;
  const StudentCard(
      {Key? key,
      required this.name,
      required this.type,
      required this.image,
      required this.id,
      required this.token, required this.email})
      : super(key: key);

  @override
  State<StudentCard> createState() => _StudentCardState();
}

class _StudentCardState extends State<StudentCard> {
  @override
  Widget build(BuildContext context) {
    setState(() {
      context
          .read<GetStudentByIdCubit>()
          .emitAllStudentsByClassId(studentId: widget.id);
    });
    return BlocBuilder<GetStudentByIdCubit, GetStudentByIdState>(
      builder: (context, state) {
        return state.when(
          initial: () {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.mainColor,
              ),
            );
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.mainColor,
              ),
            );
          },
          success: (data) {
            final GetStudentByIdModel getStudentByIdModel = data;
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ColorsManager.mainWhite,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                          radius: 25.sp,
                          backgroundImage: NetworkImage(widget.image)),
                      horizontalSpacing(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(widget.name, style: TextStyles.font12BlackBold),
                          verticalSpacing(10),
                          Text(
                            widget.type,
                            style: TextStyles.font14MediumLightBlack
                                .copyWith(fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ],
                  ),
                  horizontalSpacing(10), // Add horizontal spacing
                  PopupMenuButton<String>(
                    onSelected: (String value) {
                      if (value == 'view_profile') {
                        // Handle view profile action
                        print('View Profile selected');
                      } else if (value == 'delete') {
                        // Handle delete action
                        print('Delete selected');
                      }
                    },
                    itemBuilder: (BuildContext context) => [
                      PopupMenuItem(
                        onTap: () {
                          context.pushNamed(Routes.editStudentProfilePage,arguments: {
                            'name':getStudentByIdModel.name.toString(),
                            'image':widget.image,
                            'id':getStudentByIdModel.id.toString(),
                            'email':getStudentByIdModel.email.toString(),
                            'token':widget.token,
                            'nationalNumber':getStudentByIdModel.nationalNumber.toString(),
                            'yearId':getStudentByIdModel.year!.yearId,
                            'classId':getStudentByIdModel.classId
                          });
                        },
                        value: 'view_profile',
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          child: Text(S.of(context).view_profile),
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () {
                          context
                              .read<DeleteUserCubit>()
                              .emitDeleteUserStates(token: widget.token, userId: widget.id);
                        },
                        value: 'delete',
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          child: Text(S.of(context).delete),
                        ),
                      ),
                    ],
                    icon: Image.asset(ImageManager.settingIcon),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    color: ColorsManager.grey, // Background color
                    elevation: 4, // Add elevation for shadow effect
                  ),
                ],
              ),
            );
          },
          error: (error) {
            return AlertDialog(
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
            );
          },
        );
      },
    );
  }
}
