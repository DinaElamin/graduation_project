import 'package:ablexa/features/manager/feature_home_manager_page/logic/cubits/delete_user_cubit/delete_user_cubit.dart';
import 'package:ablexa/features/manager/feature_home_manager_page/logic/cubits/get_all_teacher_cubit/login_cubit/get_all_teacher_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Routing/routers.dart';
import '../../../../../core/helper/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/image_manager.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
class TeacherCard extends StatefulWidget {
  final String name, type, image,id,token,email,nationalNumber,TeacherId;

  const TeacherCard({
    Key? key,
    required this.name,
    required this.type,
    required this.image, required this.id, required this.token, required this.email, required this.nationalNumber, required this.TeacherId
  }) : super(key: key);

  @override
  State<TeacherCard> createState() => _TeacherCardState();
}

class _TeacherCardState extends State<TeacherCard> {
  @override
  Widget build(BuildContext context) {
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
                    style: TextStyles.font14MediumLightBlack.copyWith(fontSize: 12.sp),
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

                      context.pushNamed(Routes.editTeacherProfilePage,arguments: {
                        'token':widget.token,
                        'nameTeacher':widget.name,
                        'emailTeacher':widget.email,
                        'nationalNumber':widget.nationalNumber,
                        'imageTeacher':widget.image,
                        'TeacherId':widget.TeacherId,
                      });
                },
                value: 'view_profile',
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Text(S.of(context).view_profile),
                ),
              ),
              PopupMenuItem(
                onTap: () {
                  showDialog<void>(
                      context: context,
                      builder: (BuildContext dialogContext) {
                        final deleteStudentCubit = context
                            .read<DeleteUserCubit>();
                        return AlertDialog(
                          content: Text("Delete Teacher ?? ",style: TextStyles.font20BoldBlack,),
                          actions: <Widget>[
                            AppTextButton(
                                buttonHeight: 25.r,
                                buttonWidth: 60.r,
                                textButton: "Delete",
                                onPressed: () {
                                  deleteStudentCubit
                                      .emitDeleteUserStates(
                                      token: widget.token,userId:  widget.id);
                                  Navigator.of(dialogContext)
                                      .pop();
                                  setState(() {
                                    context.read<GetAllTeacherDataCubit>().emitAllTeacherStates();
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
                      });                      },
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
  }
}
