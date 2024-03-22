import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

class UploadExamImageWidget extends StatefulWidget {
  const UploadExamImageWidget({Key? key}) : super(key: key);

  @override
  State<UploadExamImageWidget> createState() => _UploadExamImageWidgetState();
}

class _UploadExamImageWidgetState extends State<UploadExamImageWidget> {
  File? _examImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10.sp),
          height: 60.h,
          decoration: BoxDecoration(
            color: ColorsManager.grey,
            borderRadius: BorderRadius.circular(16.sp),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).upload_exam_image,
                style: TextStyles.font20BoldBlack.copyWith(fontSize: 16.sp),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(S.of(context).select_image_source),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  Navigator.pop(context);
                                  final ImagePicker _picker = ImagePicker();
                                  XFile? pickedImage = await _picker.pickImage(source: ImageSource.camera);
                                  if (pickedImage != null) {
                                    setState(() {
                                      _examImage = File(pickedImage.path);
                                    });
                                  }
                                },
                                child: Text(S.of(context).camera),
                              ),
                              Padding(padding: EdgeInsets.all(8.0.sp)),
                              GestureDetector(
                                onTap: () async {
                                  Navigator.pop(context);
                                  final ImagePicker _picker = ImagePicker();
                                  XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
                                  if (pickedImage != null) {
                                    setState(() {
                                      _examImage = File(pickedImage.path);
                                    });
                                  }
                                },
                                child: Text(S.of(context).gallery),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                icon: const Icon(Icons.upload),
                color: ColorsManager.mainColor,
              ),
            ],
          ),
        ),
        verticalSpacing(20),
        if (_examImage != null)
          Container(
            height: 200.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xffF5EEE6),
              borderRadius: BorderRadius.circular(16.sp),
            ),
            child: Image.file(
              _examImage!,
              fit: BoxFit.cover,
            ),
          ),
        verticalSpacing(70),
      ],
    );
  }
}
