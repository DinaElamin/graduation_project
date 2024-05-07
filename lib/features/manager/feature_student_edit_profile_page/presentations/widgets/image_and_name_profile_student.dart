import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';

class ImageAndNameProfileStudent extends StatefulWidget {
  const ImageAndNameProfileStudent({
    Key? key,
    required this.name,
    required this.image,
    required this.onImageSelected,
  }) : super(key: key);

  final String name, image;
  final void Function(File? imageFile) onImageSelected;

  @override
  State<ImageAndNameProfileStudent> createState() =>
      _ImageAndNameProfileStudentState();
}

class _ImageAndNameProfileStudentState
    extends State<ImageAndNameProfileStudent> {
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        imageProfile(),
        verticalSpacing(10),
        Text(
          widget.name,
          style: TextStyles.font16SemiBoldBlack,
        ),
      ],
    );
  }

  Widget imageProfile() {
    return GestureDetector(
      onTap: _chooseImage,
      child: SizedBox(
        height: 80.h,
        width: 100.w,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 38.sp,
              backgroundImage: _imageFile != null
                  ? FileImage(_imageFile!) as ImageProvider<Object>?
                  : NetworkImage(widget.image) as ImageProvider<Object>?,
            ),
            Positioned(
              bottom: -1.h,
              right: 18.w,
              height: 35.h,
              width: 35.w,
              child: CircleAvatar(
                backgroundColor: ColorsManager.mainColor,
                radius: 20.sp,
                child: Center(
                  child: IconButton(
                    icon: const Icon(Icons.camera_alt),
                    color: ColorsManager.mainWhite,
                    iconSize: 20.sp,
                    onPressed: _chooseImage,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }




  Future<void> _chooseImage() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).select_image_source),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera),
                title: Text(S.of(context).camera),
                onTap: () async {
                  Navigator.of(context).pop();
                  final pickedImage = await ImagePicker().pickImage(
                    source: ImageSource.camera,
                  );
                  _setImageFile(
                      pickedImage == null ? null : File(pickedImage.path));
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: Text(S.of(context).gallery),
                onTap: () async {
                  Navigator.of(context).pop();
                  final pickedImage = await ImagePicker().pickImage(
                    source: ImageSource.gallery,
                  );
                  _setImageFile(
                      pickedImage == null ? null : File(pickedImage.path));
                },
              ),
            ],
          ),
        );
      },
    );
  }
  void _setImageFile(File? pickedImage) {
    setState(() {
      _imageFile = pickedImage ?? File(widget.image); // Use the pickedImage if not null, otherwise use the default image
      widget.onImageSelected(_imageFile); // Pass the selected image to the parent widget
    });
  }



  }

