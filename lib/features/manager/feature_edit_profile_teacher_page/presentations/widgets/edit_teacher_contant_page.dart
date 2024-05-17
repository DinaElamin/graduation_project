import 'dart:io';
import 'package:ablexa/features/manager/feature_add_teacher_page/presentations/widgets/upload_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../generated/l10n.dart';
import '../../../feature_add_teacher_page/presentations/widgets/classes_drop_down.dart';
import '../../../feature_add_teacher_page/presentations/widgets/subjects_drop_down.dart';
import '../../logic/cubits/edit_teacher_cubit/edit_teacher_cubit.dart';
import 'edit_teacher_button.dart';
import 'edit_teacher_text_FormField_Widgets.dart';


class EditTeacherContantPage extends StatefulWidget {
  const EditTeacherContantPage({
    Key? key,
    required this.token, required this.userId,
  }) : super(key: key);
  final String token,userId;

  @override
  State<EditTeacherContantPage> createState() => _EditTeacherContantPageState();
}

List<String> selectedClassIds = [];
late String subjectName;
late String className;
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
          const EditTeacherTextFormFieldWidgets(),
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
              validateThenDoAddTeacher(context);
            },
          ),
          verticalSpacing(20),
        ],
      ),
    );
  }

  void validateThenDoAddTeacher(BuildContext context) {
    if (context.read<EditTeacherCubit>().formKey.currentState!.validate()) {
      // Check if imageFile is not null before proceeding
      if (imageFile != null) {
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
