import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/image_manager.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
class UploadImageFileWidget extends StatefulWidget {
  const UploadImageFileWidget({super.key, required this.onImageSelected});
  final void Function(File? imageFile) onImageSelected;
  @override
  State<UploadImageFileWidget> createState() => _UploadImageFileWidgetState();
}

class _UploadImageFileWidgetState extends State<UploadImageFileWidget> {
  File? imageFile; // Change to File type
  final ImagePicker _imagePicker = ImagePicker();
  Future<void> captureImageFromCamera() async {
    final XFile? image =
    await _imagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        imageFile = File(image.path);
      });
      widget.onImageSelected(imageFile);
    }
  }

// Add a method to handle gallery image selection and set the imageFile state
  Future<void> selectImageFromGallery() async {
    final XFile? image =
    await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imageFile = File(image.path);
      });
      widget.onImageSelected(imageFile);
    }
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
              title: Text(S.of(context).take_photo),
              onTap: () {
                Navigator.pop(context);
                captureImageFromCamera(); // Call method to capture image from camera
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: Text(S.of(context).choose_from_the_gallery),
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
  @override
  Widget build(BuildContext context) {

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
            Text(S.of(context).update_user_image,
                style: TextStyles.font20BoldBlack),
            Image.asset(ImageManager.uploadImageIcon),
          ],
        ),
      ),
    );
  }

}
