import 'dart:io';

import 'package:ablexa/core/helper/extentions.dart';
import 'package:ablexa/features/manager/feature_student_edit_profile_page/logic/cubits/edit_student_cubit/edit_student_cubit.dart';
import 'package:ablexa/features/manager/feature_student_edit_profile_page/logic/cubits/edit_student_cubit/edit_student_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/Routing/routers.dart';
import '../../../../../core/shared_widgets/appBar_widget.dart';
import '../../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../../core/shared_widgets/success_widget.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/drop_down_grade_edit_profile.dart';
import '../widgets/image_and_name_profile_student.dart';
import '../widgets/text_form_field_profile_student.dart';
import '../widgets/year_drop_down_edit_profile.dart';

class StudentEditProfilePage extends StatefulWidget {
  const StudentEditProfilePage(
      {super.key,
      required this.nameStudent,
      required this.id,
      required this.image,
      required this.email,
      required this.token});
  final String nameStudent, image, email, id, token;

  @override
  State<StudentEditProfilePage> createState() => _StudentEditProfilePageState();
}

File? imageFile;
late int yearId;
late int classId;

class _StudentEditProfilePageState extends State<StudentEditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppBarWidget(
              pageName: S.of(context).student_profile,
              widget: Text(
                S.of(context).edit,
                style: TextStyles.font16SemiBoldBlack,
              )),
          Form(
            key: context.read<EditStudentCubit>().formKey,
            child: Column(
              children: [
                ImageAndNameProfileStudent(
                  onImageSelected: (file) {
                    setState(() {
                      imageFile = file;
                    });
                  },
                  name: widget.nameStudent,
                  image: widget.image,
                ),
                TextFormFieldProfileStudent(
                    nameStudent: widget.nameStudent, email: widget.email),
                EditProfileGradeDropDown(
                  onGradeSelected: (idYear) {
                    setState(() {
                      try {
                        yearId = int.parse(idYear); // Parse the String to int
                      } catch (e) {
                        print("Error parsing gradeId to int: $e");
                        // Handle the error as needed
                      }
                    });
                  },
                ),
                EditProfileYearDropDown(
                  onSemesterSelected: (idClass) {
                    setState(() {
                      try {
                        classId = int.parse(idClass); // Parse the String to int
                      } catch (e) {
                        print("Error parsing termId to int: $e");
                        // Handle the error as needed
                      }
                    });
                  },
                ),
                verticalSpacing(40),
                editStudentButtonWidget(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Padding editStudentButtonWidget(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 50.w,right: 50.w),
      child: BlocListener<EditStudentCubit,EditStudentState>(
        listener: (context, state) {
          state.when(
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
              showSuccessDialog(
                  onPressed: (){
                    context.pop();
                    context.pushNamed(Routes.homeManagerPage,arguments: widget.token);
                  },
                  context,
                  text: S.of(context).save_change,
                  contentText: S.of(context).edit_student_successfully);
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
        child: AppTextButton(
            buttonHeight: 60.h,
            textButton: S.of(context).add_student, onPressed: (){
          validateThenDoEditStudent(context);
        }),
      ),
    );
  }
  void validateThenDoEditStudent(BuildContext context) {
    if (context.read<EditStudentCubit>().formKey.currentState!.validate()) {
      // Check if imageFile is not null before proceeding
      if (imageFile != null) {
        // Send the data to the AddTeacherCubit for processing
        context.read<EditStudentCubit>().emitEditStudentStates(
              widget.id,
              widget.token,

              Name: context.read<EditStudentCubit>().fullNameController.text,
              Email: context.read<EditStudentCubit>().emailController.text,
              NationalNum:
                  context.read<EditStudentCubit>().nationalIdController.text,
              Image: imageFile!, // Use the selected imageFile
              YearId: yearId,

              PClassId: classId,
            );
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(S.of(context).image_required),
            content: Text(S.of(context).please_select_an_image),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(S.of(context).ok),
              ),
            ],
          ),
        );
      }
    } else {
      // Validation failed
      print("Validation failed. Please check the form fields.");
    }
  }
}
