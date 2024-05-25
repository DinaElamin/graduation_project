
import 'package:ablexa/core/helper/extentions.dart';
import 'package:ablexa/features/manager/feature_edit_profile_teacher_page/data/models/get_teacher_by_id_model/get_teacher_by_id_model.dart';
import 'package:ablexa/features/manager/feature_edit_profile_teacher_page/logic/cubits/get_all_teacher_by_id_cubit/get_all_Teacher_by_id_cubit.dart';
import 'package:ablexa/features/manager/feature_edit_profile_teacher_page/logic/cubits/get_all_teacher_by_id_cubit/get_all_Teacher_by_id_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/shared_widgets/appBar_widget.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/edit_teacher_contant_page.dart';
import '../widgets/image_and_name_profile_teacher.dart';
import '../widgets/text_form_field_profile_manager.dart';

class EditProfileTeacherPage extends StatefulWidget {
  const EditProfileTeacherPage({Key? key, required this.token, required this.teacherId, required this.imageTeacher});
  final String token,teacherId,imageTeacher;
  @override
  State<EditProfileTeacherPage> createState() => _EditProfileTeacherPageState();
}

class _EditProfileTeacherPageState extends State<EditProfileTeacherPage> {
  @override
  void initState() {
    context.read<GetTeacherByIdCubit>().emitAllTeacherById(teacherId: widget.teacherId);
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(

      body:       BlocBuilder<GetTeacherByIdCubit,GetTeacherByIdState>(
    builder: (context, state) {
      return state.when(
        initial:  (){
          return const Center(child: CircularProgressIndicator(
            color: ColorsManager.mainColor,
          ),);
        },
        loading: (){
          return const Center(child: CircularProgressIndicator(
            color: ColorsManager.mainColor,
          ),);
        },
        success: (data) {
          final GetTeacherByIdModel getTeacherByIdModel= data;
          return  Padding(
            padding:  EdgeInsets.only(left: 20.sp,right: 20.sp),
            child: ListView(
              children: [
                AppBarWidget(pageName: S.of(context).my_profile,),
                verticalSpacing(10),
                EditTeacherContantPage(
                  nameTeacher: getTeacherByIdModel.name.toString(),
                  nationalNumberTeacher:getTeacherByIdModel.nationalNumber.toString(),
                  emailTeacher: getTeacherByIdModel.email.toString(),
                  userId: widget.teacherId,
                  token: widget.token, imageTeacher: widget.imageTeacher,
                ),
                verticalSpacing(20),

              ],
            ),
          );
        },
        error:(error) {
          return AlertDialog(
            content: Text(error,
              style: TextStyles.font14MediumLightBlack,
            ),
            actions: [
              TextButton(onPressed: (){
                context.pop();
              }, child: Text('Got It ',style: TextStyles.font20BoldBlack,)),
            ],
            icon: const Icon(Icons.error,
              color: Colors.red,
              size: 32,
            ),
          );
        },);
    },

    )

    );
  }
}

