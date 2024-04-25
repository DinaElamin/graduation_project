import 'dart:io';

import 'package:ablexa/core/helper/extentions.dart';
import 'package:ablexa/features/manager/feature_add_student_page/logic/add_student_cubit/add_student_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../../core/theming/image_manager.dart';
import '../../logic/add_student_cubit/add_student_state.dart';
import 'drop_down_grade.dart';
import 'termid_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/shared_widgets/app_text_feild.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
class TextFormFieldFromAddStudent extends StatefulWidget {
  const TextFormFieldFromAddStudent({
    Key? key, required this.token,
  }) : super(key: key);
final String token;
  @override
  State<TextFormFieldFromAddStudent> createState() => _TextFormFieldFromAddStudentState();
}

class _TextFormFieldFromAddStudentState extends State<TextFormFieldFromAddStudent> {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController nationalIdController = TextEditingController();

  TextEditingController imageController = TextEditingController();
 late int termId;
  late int pClassId;
  final formKey = GlobalKey<FormState>();
  File? imageFile; // Change to File type


  final ImagePicker _imagePicker = ImagePicker();
  Future<void> captureImageFromCamera() async {
    final XFile? image = await _imagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        imageFile = File(image.path);
      });
    }
  }
  Future<void> selectImageFromGallery() async {
    final XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imageFile = File(image.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            S.of(context).full_name,
            style: TextStyles.font16SemiBoldBlack,
          ),
          verticalSpacing(10),
          AppTextFormField(
            controller: fullNameController,
            fillColorFromBackground: ColorsManager.mainWhite,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.sp),
              borderSide: BorderSide(color: ColorsManager.mainBlack.withOpacity(0.3)),
            ),
            hintText: S.of(context).enter_full_name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter full name';
              }
              return null; // Return null if the input is valid
            },
          ),
          verticalSpacing(20),
          Text(
            S.of(context).national_iD,
            style: TextStyles.font16SemiBoldBlack,
          ),
          verticalSpacing(10),
          AppTextFormField(
            controller: nationalIdController,
            fillColorFromBackground: ColorsManager.mainWhite,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.sp),
              borderSide: BorderSide(color: ColorsManager.mainBlack.withOpacity(0.3)),
            ),
            hintText: S.of(context).enter_national_id,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter national ID';
              }
              return null; // Return null if the input is valid
            },
          ),
          verticalSpacing(20),
          Text(
            S.of(context).email,
            style: TextStyles.font16SemiBoldBlack,
          ),
          verticalSpacing(10),
          AppTextFormField(
            controller: emailController,
            fillColorFromBackground: ColorsManager.mainWhite,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.sp),
              borderSide: BorderSide(color: ColorsManager.mainBlack.withOpacity(0.3)),
            ),
            hintText: S.of(context).enter_email,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter email';
              }
              // Add email format validation here if needed
              return null; // Return null if the input is valid
            },
          ),
          verticalSpacing(20),
          uploadImageWidget(context),
           GradeDropDown(
             onGradeSelected: (gradeId) {
               setState(() {
                 try {
                   pClassId = int.parse(gradeId); // Parse the String to int
                   print("the pClassId : $pClassId");
                 } catch (e) {
                   print("Error parsing gradeId to int: $e");
                   // Handle the error as needed
                 }
               });
               },
           ),
          TermIdDropDown(
            onTermIdSelected: (selectedTermId) {
              setState(() {
                try {
                  termId = int.parse(selectedTermId); // Parse the String to int
                  print("the termId : $termId");
                } catch (e) {
                  print("Error parsing termId to int: $e");
                  // Handle the error as needed
                }
              });
            },
          ),

          Padding(
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
          ),

        ],
      ),
    );
  }
  void validateThenDoAddStudent(BuildContext context) {
    if (formKey.currentState!.validate()) {
      // Check if imageFile is not null before proceeding
      if (imageFile != null) {
        // Send the data to the AddTeacherCubit for processing
        context.read<AddStudentCubit>().emitAddStudentStates(
          widget.token,
          Name: fullNameController.text,
          Email: emailController.text,
          NationalNum: nationalIdController.text,
          Image: imageFile!, // Use the selected imageFile
          TermId: termId,
          PClassId: pClassId,
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Image Required"),
            content: const Text("Please select an image to proceed."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"),
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
  Container uploadImageWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.sp),
      height: 60.h,
      decoration: BoxDecoration(
        color: ColorsManager.lightGrey,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16.sp),
      ),
      child: GestureDetector(
        onTap: () {
          showImagePickerBottomSheet(context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Upload user Image", style: TextStyles.font20BoldBlack),
            Image.asset(ImageManager.uploadImageIcon),
          ],
        ),
      ),
    );
  }

  void showImagePickerBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take Photo'),
              onTap: () {
                Navigator.pop(context);
                captureImageFromCamera(); // Call method to capture image from camera
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Gallery'),
              onTap: () {
                Navigator.pop(context);
                selectImageFromGallery(); // Call method to select image from gallery
              },
            ),
          ],
        );
      },
    );
  }
}
