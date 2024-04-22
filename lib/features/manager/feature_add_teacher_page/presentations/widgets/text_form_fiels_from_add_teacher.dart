import 'dart:io';
import 'package:ablexa/core/helper/extentions.dart';
import 'package:ablexa/core/theming/image_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../../core/shared_widgets/app_text_feild.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
import '../../logic/cubits/add_teacher_cubit/get_all_classes_cubit.dart';
import '../../logic/cubits/add_teacher_cubit/get_all_classes_state.dart';
class TextFormFieldFromAddTeacher extends StatefulWidget {
  const TextFormFieldFromAddTeacher({
    Key? key, required this.token,
  }) : super(key: key);
final String token;
  @override
  State<TextFormFieldFromAddTeacher> createState() => _TextFormFieldFromAddTeacherState();
}

class _TextFormFieldFromAddTeacherState extends State<TextFormFieldFromAddTeacher> {
  final formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nationalIdController = TextEditingController();
  TextEditingController imageController = TextEditingController();
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

  // Add a method to handle gallery image selection and set the imageFile state
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
          fullNameWidget(context),
          nationalIdWidget(context),
          emailWidget(context),
          // Text(
          //   S.of(context).subject,
          //   style: TextStyles.font16SemiBoldBlack,
          // ),
          // verticalSpacing(10),
          // AppTextFormField(
          //   fillColorFromBackground: ColorsManager.mainWhite,
          //   enabledBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(16.sp),
          //     borderSide: BorderSide(color: ColorsManager.mainBlack.withOpacity(0.3)),
          //   ),
          //   hintText: S.of(context).enter_the_teacher_subject,
          //   validator: (value) {
          //     if (value == null || value.isEmpty) {
          //       return 'Please enter teacher subject';
          //     }
          //     return null; // Return null if the input is valid
          //   },
          // ),
          // verticalSpacing(20),
          // Text(
          //   S.of(context).class_code,
          //   style: TextStyles.font16SemiBoldBlack,
          // ),
          // verticalSpacing(10),
          // AppTextFormField(
          //   fillColorFromBackground: ColorsManager.mainWhite,
          //   enabledBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(16.sp),
          //     borderSide: BorderSide(color: ColorsManager.mainBlack.withOpacity(0.3)),
          //   ),
          //   hintText: S.of(context).enter_the_teacher_class,
          //   validator: (value) {
          //     if (value == null || value.isEmpty) {
          //       return 'Please enter teacher class code';
          //     }
          //     return null; // Return null if the input is valid
          //   },
          // ),
          // verticalSpacing(20),
          uploadImageWidget(context),
          verticalSpacing(40),
          addTeacherButton(context),
          verticalSpacing(20),
        ],
      ),
    );
  }

  Padding addTeacherButton(BuildContext context) {
    return Padding(
          padding: EdgeInsets.only(left: 50.w, right: 50.w),
          child: BlocListener<AddTeacherCubit, AddTeacherState>(
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
                textButton: S.of(context).add_teacher,
                onPressed: () {
                  validateThenDoAddTeacher(context);
                }),
          ),
        );
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


  Column emailWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
          ],
        );
  }

  Column nationalIdWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
          ],
        );
  }

  Column fullNameWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
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
          ],
        );
  }
  void validateThenDoAddTeacher(BuildContext context) {
    if (formKey.currentState!.validate()) {
      // Check if imageFile is not null before proceeding
      if (imageFile != null) {
        // Send the data to the AddTeacherCubit for processing
        context.read<AddTeacherCubit>().emitAddTeacherStates(
          widget.token,
          Name: fullNameController.text,
          Email: emailController.text,
          NationalNum: nationalIdController.text,
          Image: imageFile!, // Use the selected imageFile
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


}
