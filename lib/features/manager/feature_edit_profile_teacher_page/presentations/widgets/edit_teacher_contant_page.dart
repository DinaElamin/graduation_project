import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../student/feature_student_profile_page/presentations/widgets/image_and_name_profile_student.dart';
import '../../../feature_add_teacher_page/presentations/widgets/classes_drop_down.dart';
import '../../../feature_add_teacher_page/presentations/widgets/subjects_drop_down.dart';
import '../../logic/cubits/edit_teacher_cubit/edit_teacher_cubit.dart';
import 'edit_teacher_button.dart';
import 'edit_teacher_text_FormField_Widgets.dart';

class EditTeacherContantPage extends StatefulWidget {
  const EditTeacherContantPage({
    Key? key,
    required this.token,
    required this.userId,
    required this.nameTeacher,
    required this.emailTeacher,
    required this.nationalNumberTeacher,
    required this.imageTeacher,
  }) : super(key: key);
  final String token, userId;
  final String nameTeacher, emailTeacher, nationalNumberTeacher, imageTeacher;

  @override
  State<EditTeacherContantPage> createState() => _EditTeacherContantPageState();
}

List<String> selectedClassIds = [];
late String subjectName = ''; // Initialize subjectName
File? imageFile;

class _EditTeacherContantPageState extends State<EditTeacherContantPage> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<EditTeacherCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageAndNameProfileStudent(
                setImage: (image) {
                  setState(() {
                    imageFile = image;
                  });
                },
                nameStudent: widget.nameTeacher,
                imageStudent: widget.imageTeacher,
              ),
            ],
          ),
          EditTeacherTextFormFieldWidgets(
            nameTeacher: widget.nameTeacher,
            emailTeacher: widget.emailTeacher,
            nationalNumberTeacher: widget.nationalNumberTeacher,
          ),
          SubjectsDropDown(
            onSubjectSelected: (subject) {
              setState(() {
                subjectName = subject;
                print("the subject choose is :$subject");
              });
            },
          ),
          ClassesDropDown(
            onSubjectsSelected: (classes) {
              setState(() {
                selectedClassIds = classes;
                print("classes $classes");
                print("Selected class IDs: $selectedClassIds");
              });
            },
          ),
          verticalSpacing(20),
          EditTeacherButton(
            token: widget.token,
            onPressedFunction: () {
              return validateThenDoEditTeacher(context);
            },
          ),
          verticalSpacing(20),
        ],
      ),
    );
  }

  void validateThenDoEditTeacher(BuildContext context) {
    if (context.read<EditTeacherCubit>().formKey.currentState!.validate()) {
      // Check if imageFile is not null before proceeding
      context.read<EditTeacherCubit>().emitEditTeacherStates(
            widget.userId,
            widget.token,
            Name: context.read<EditTeacherCubit>().fullNameController.text,
            Email: context.read<EditTeacherCubit>().emailController.text,
            NationalNum:
                context.read<EditTeacherCubit>().nationalIdController.text,
            Image: imageFile!,
            SubjectName: subjectName,
            AssignClassId: selectedClassIds,
          );
    } else {
      // Validation failed
      print("Validation failed. Please check the form fields.");
    }
  }
}
