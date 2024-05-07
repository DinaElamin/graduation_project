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
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/drop_down_grade_edit_profile.dart';
import '../widgets/image_and_name_profile_student.dart';
import '../widgets/text_form_field_profile_student.dart';
import '../widgets/year_drop_down_edit_profile.dart';



class StudentEditProfilePage extends StatefulWidget {
  const StudentEditProfilePage({
    Key? key,
    required this.token,
    required this.id,
    required this.image,
    required this.name,
    required this.nationalId,
    required this.yearId,
    required this.classId,
    required this.email,
  }) : super(key: key);

  final String token, id, image, name, email, nationalId;
  final int classId, yearId;

  @override
  State<StudentEditProfilePage> createState() => _StudentEditProfilePageState();
}

class _StudentEditProfilePageState extends State<StudentEditProfilePage> {
  late File? imageFile;
  late int yearId;
  late int classId;
  late String nameStudent;
  late String emailStudent;
  late String nationalNumberStudent;

  @override
  void initState() {
    super.initState();
    imageFile = File(widget.image);
    yearId = widget.yearId;
    classId = widget.classId;
    nameStudent = widget.name;
    emailStudent = widget.email;
    nationalNumberStudent = widget.nationalId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppBarWidget(
            pageName: S.of(context).student_profile,
          ),
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
                  name: widget.name,
                  image: widget.image,
                ),
                TextFormFieldProfileStudent(
                  onTextChanged: (fullName, email, nationalId) {
                    nameStudent = fullName;
                    emailStudent = email;
                    nationalNumberStudent = nationalId;
                  },
                  nameStudent: nameStudent,
                  email: emailStudent,
                  nationalNumber: nationalNumberStudent,
                ),
                EditProfileGradeDropDown(
                  onGradeSelected: (idYear) {
                    setState(() {
                      try {
                        yearId = int.parse(idYear);
                      } catch (e) {
                        print("Error parsing gradeId to int: $e");
                      }
                    });
                  },
                ),
                EditProfileYearDropDown(
                  onSemesterSelected: (idClass) {
                    setState(() {
                      try {
                        classId = int.parse(idClass);
                      } catch (e) {
                        print("Error parsing termId to int: $e");
                      }
                    });
                  },
                ),
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
      padding: EdgeInsets.symmetric(horizontal: 50.w),
      child: BlocListener<EditStudentCubit, EditStudentState>(
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
                onPressed: () {
                  context.pop();
                  context.pushNamed(Routes.homeManagerPage, arguments: widget.token);
                },
                context,
                text: S.of(context).save_change,
                contentText: S.of(context).edit_student_successfully,
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
                    ),
                  ),
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
          textButton: S.of(context).save_change,
          onPressed: () {
            validateThenDoEditStudent(context);
          },
        ),
      ),
    );
  }

  void validateThenDoEditStudent(BuildContext context) {
    if (context.read<EditStudentCubit>().formKey.currentState!.validate()) {
      // Use a default image if imageFile is null (i.e., user did not select an image)
      final File selectedImage = imageFile ?? File(widget.image);

      context.read<EditStudentCubit>().emitEditStudentStates(
        widget.id,
        widget.token,
        Name: nameStudent,
        Email: emailStudent,
        NationalNum: nationalNumberStudent,
        Image: selectedImage,
        YearId: yearId,
        PClassId: classId,
      );
    } else {
      // Validation failed
      print("Validation failed. Please check the form fields.");
    }
  }
}
