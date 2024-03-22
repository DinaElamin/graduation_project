import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theming/image_manager.dart';
import 'card_information_grade_student.dart';

class GradeStudents extends StatelessWidget {
  const GradeStudents({Key? key, required this.gradeName});
  final String gradeName;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9, // Set a percentage of the screen height
      child: ListView.builder(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) =>  Padding(
          padding:  EdgeInsets.only(top: 10.h),
          child: CardInformationGradeStudents(
            type: gradeName,
            image: ImageManager.studentImage,
            name: "Shaban Salah Abdulhameed",
          ),
        ),
      ),
    );
  }
}
