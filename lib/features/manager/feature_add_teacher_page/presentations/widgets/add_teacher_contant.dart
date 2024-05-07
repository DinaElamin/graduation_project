import 'dart:io';
import 'package:ablexa/features/manager/feature_add_teacher_page/presentations/widgets/add_teacher_text_FormField_Widgets.dart';
import 'package:ablexa/features/manager/feature_add_teacher_page/presentations/widgets/upload_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../generated/l10n.dart';
import '../../logic/cubits/add_teacher_cubit/add_teacher_cubit.dart';
import 'add_teacher_button.dart';
import 'classes_drop_down.dart';
import 'subjects_drop_down.dart';

class AddTeacherContantPage extends StatefulWidget {
  const AddTeacherContantPage({
    Key? key,
    required this.token,
  }) : super(key: key);
  final String token;

  @override
  State<AddTeacherContantPage> createState() => _AddTeacherContantPageState();
}

List<int> selectedClassIds = [];
late String subjectName;
late String className;
File? imageFile;

class _AddTeacherContantPageState extends State<AddTeacherContantPage> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AddTeacherCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const AddTeacherTextFormFieldWidgets(),
          UploadImageFileWidget(onImageSelected: (file) {
            setState(() {
              imageFile = file;
            });
          }),
          SubjectsDropDown(
              onSubjectSelected: (subject) {
            setState(() {
              subjectName = subject;
              print("the subject choose is :$subject");
            });
          }),

          ClassesDropDown(
            onSubjectsSelected: (classes) {
              setState(() {
                selectedClassIds = classes;
                print("Selected class IDs: $selectedClassIds");
              });
            },
          ),
          verticalSpacing(20),
          AddTeacherButton(
            token: widget.token,
            onPressedFunction: () {
              validateThenDoAddTeacher(context);
            },
          ),
          verticalSpacing(20),
        ],
      ),
    );
  }

  void validateThenDoAddTeacher(BuildContext context) {
    if (context.read<AddTeacherCubit>().formKey.currentState!.validate()) {
      // Check if imageFile is not null before proceeding
      if (imageFile != null) {
        context.read<AddTeacherCubit>().emitAddTeacherStates(
              widget.token,
              Name: context.read<AddTeacherCubit>().fullNameController.text,
              Email: context.read<AddTeacherCubit>().emailController.text,
              NationalNum:
                  context.read<AddTeacherCubit>().nationalIdController.text,
              Image: imageFile!,
              SubjectName: subjectName,
              AssignClassId: selectedClassIds,
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
