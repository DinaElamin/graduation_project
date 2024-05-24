
import 'package:ablexa/features/manager/feature_edit_profile_teacher_page/logic/cubits/edit_teacher_cubit/edit_teacher_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared_widgets/appBar_widget.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../generated/l10n.dart';
import '../../../../teacher/feature_profile_teacher_page/presentations/widgets/image_and_name_profile_teacher.dart';
import '../../../../teacher/feature_profile_teacher_page/presentations/widgets/text_form_field_profile_manager.dart';
import '../widgets/edit_teacher_button.dart';

class TeacherEditProfilePage extends StatefulWidget {
  const TeacherEditProfilePage({Key? key, required this.nameTeacher, required this.emailTeacher, required this.imageTeacher, required this.nationalNumber, required this.token, required this.teacherId});
  final String token,nameTeacher,emailTeacher,imageTeacher,nationalNumber,teacherId;
  @override
  State<TeacherEditProfilePage> createState() => _TeacherEditProfilePageState();
}

class _TeacherEditProfilePageState extends State<TeacherEditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        children: [
          AppBarWidget(pageName: S.of(context).my_profile,),
          verticalSpacing(10),
          ImageAndNameProfileTeacher(
            nameTeacher: widget.nameTeacher,
            emailTeacher: widget.emailTeacher,
            imageTeacher: widget.imageTeacher,
          ),
          verticalSpacing(10),
          TextFormFieldProfileManager(
            teacherId: widget.teacherId,
            token: widget.token,
            emailTeacher: widget.emailTeacher,
            nameTeacher: widget.nameTeacher,
            nationalNumber: widget.nationalNumber,
          ),
          verticalSpacing(20),
          EditTeacherButton(
            token: widget.token,
            onPressedFunction: () {
              // validateThenDoAddTeacher(context);
            },
          ),
        ],
      ),
    );
  }
  // void validateThenDoAddTeacher(BuildContext context) {
  //   if (context.read<EditTeacherCubit>().formKey.currentState!.validate()) {
  //     // Check if imageFile is not null before proceeding
  //
  //       context.read<EditTeacherCubit>().emitEditTeacherStates(
  //         widget.teacherId,
  //         widget.token,
  //         Name: context.read<EditTeacherCubit>().fullNameController.text,
  //         Email: context.read<EditTeacherCubit>().emailController.text,
  //         NationalNum:
  //         context.read<EditTeacherCubit>().nationalIdController.text,
  //         Image: imageFile!,
  //         SubjectName: subjectName,
  //         AssignClassId: selectedClassIds,
  //       );
  //     } else {
  //       showDialog(
  //         context: context,
  //         builder: (context) => AlertDialog(
  //           title: Text(S.of(context).image_required),
  //           content: Text(S.of(context).please_select_an_image),
  //           actions: [
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.pop(context);
  //               },
  //               child: Text(S.of(context).ok),
  //             ),
  //           ],
  //         ),
  //       );
  //     }
  //   } else {
  //     // Validation failed
  //     print("Validation failed. Please check the form fields.");
  //   }
//  }

}


