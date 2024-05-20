import 'dart:io';
import 'package:ablexa/core/Routing/routers.dart';
import 'package:ablexa/core/helper/extentions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../../core/shared_widgets/success_widget.dart';
import '../../../feature_add_teacher_page/presentations/widgets/upload_image_widget.dart';
import '../../logic/cubits/add_student_cubit/add_student_cubit.dart';
import '../../logic/cubits/add_student_cubit/add_student_state.dart';
import 'add_student_text_form_field.dart';
import 'drop_down_grade.dart';
import 'year_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
class AddStudentContantPage extends StatefulWidget {
  const AddStudentContantPage({
    Key? key, required this.token,
  }) : super(key: key);
final String token;
  @override
  State<AddStudentContantPage> createState() => _AddStudentContantPageState();
}

class _AddStudentContantPageState extends State<AddStudentContantPage> {

 late int termId;
  late int pClassId;
  File? imageFile; // Change to File type
  @override
  Widget build(BuildContext context) {
    return Form(
      key:  context.read<AddStudentCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const AddStudentTextFormField(),
          UploadImageFileWidget(onImageSelected: (file) {
            setState(() {
              imageFile = file;
            });
          }),
           GradeDropDown(
             onGradeSelected: (gradeId) {
               setState(() {
                 try {
                   pClassId = int.parse(gradeId); // Parse the String to int
                 } catch (e) {
                   print("Error parsing gradeId to int: $e");
                   // Handle the error as needed
                 }
               });
               },
           ),
          YearDropDown(
            onSemesterSelected: (selectedTermId) {
              setState(() {
                try {
                  termId = int.parse(selectedTermId); // Parse the String to int
                } catch (e) {
                  print("Error parsing termId to int: $e");
                  // Handle the error as needed
                }
              });
            },
          ),
          addStudentButtonWidget(context),

        ],
      ),
    );
  }

  Padding addStudentButtonWidget(BuildContext context) {
    return Padding(
          padding:  EdgeInsets.only(left: 50.w,right: 50.w),
          child: BlocListener<AddStudentCubit,AddStudentState>(
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
                    },
                      context,
                      text: S.of(context).add_student,
                      contentText: S.of(context).add_student_successfully);
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
              validateThenDoAddStudent(context);
            }),
          ),
        );
  }

  void validateThenDoAddStudent(BuildContext context) {
    if (context.read<AddStudentCubit>().formKey.currentState!.validate()) {
      // Check if imageFile is not null before proceeding
      if (imageFile != null) {
        // Send the data to the AddTeacherCubit for processing
        context.read<AddStudentCubit>().emitAddStudentStates(
          widget.token,
          Name:  context.read<AddStudentCubit>().fullNameController.text,
          Email: context.read<AddStudentCubit>().emailController.text,
          NationalNum:  context.read<AddStudentCubit>().nationalIdController.text,
          Image: imageFile!, // Use the selected imageFile
          TermId: termId,
          PClassId: pClassId,
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title:  Text(S.of(context).image_required),
            content:  Text(S.of(context).please_select_an_image),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child:  Text(S.of(context).ok),
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
