import 'package:ablexa/features/teacher/feature_add_exam_page/logic/cubits/add_exam_cubit/add_exam_cubit.dart';
import 'package:ablexa/features/teacher/feature_add_exam_page/presentations/widgets/add_exam_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared_widgets/appBar_widget.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../generated/l10n.dart';
import '../../../../manager/feature_add_teacher_page/presentations/widgets/add_teacher_contant.dart';
import '../widgets/upload_exam_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/add_exam_text_form_fields.dart';

class AddExamPage extends StatefulWidget {
  const AddExamPage({Key? key, required this.token, required this.TeacherId}) : super(key: key);
final String token,TeacherId;
  @override
  State<AddExamPage> createState() => _AddExamPageState();
}

class _AddExamPageState extends State<AddExamPage> {
  final formKey = GlobalKey<FormState>();
  late String subjectIdFromAddExam;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppBarWidget(pageName: S.of(context).add_exam),
          verticalSpacing(50),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Form(
              key: context.read<AddExamCubit>().formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AddExamTextFormFields(
                    teacherId: widget.TeacherId,
                    onSubjectIdSelected: (subjectId) {
                      subjectIdFromAddExam = subjectId;
                      print("Selected subject ID: $subjectId");
                    },
                  ),
                  UploadImageFileWidget(onImageSelected: (file) {
                    setState(() {
                      imageFile = file;
                    });
                  }),
                  verticalSpacing(20),
                  Padding(
                    padding:  EdgeInsets.only(left: 50.w,right: 50.w),
                    child:   AddExamButton(
                      token: widget.token,
                      onPressedFunction: () {
                        validateThenDoAddExam(context);
                      },
                    ),
                  )

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  void validateThenDoAddExam(BuildContext context) {
    if (context.read<AddExamCubit>().formKey.currentState!.validate()) {
      // Check if imageFile is not null before proceeding
      if (imageFile != null) {
        // Extract integers from text controllers
        final int examGrade = int.tryParse(context.read<AddExamCubit>().examGradeController.text) ?? 0;

        context.read<AddExamCubit>().emitAddExamStates(
          widget.token,
          widget.TeacherId,
          Name: context.read<AddExamCubit>().examNameController.text,
          Exam_Grade: examGrade,
          Image: imageFile!,
          MaterialId: int.parse(subjectIdFromAddExam),
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
