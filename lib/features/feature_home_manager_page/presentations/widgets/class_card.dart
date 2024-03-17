import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/styles.dart';

class ClassCard extends StatelessWidget {
  const ClassCard({Key? key, required this.text, required this.color, required Null Function() onTap}) : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w,right: 10.w,top: 10.h,bottom: 5.h),
      child: Container(
        decoration: BoxDecoration(

          borderRadius: BorderRadius.all(Radius.circular(16.sp)),
          color: color,
        ),
        height: 80.h,
        padding: EdgeInsets.all(10.sp),
        child: Text(text, style: TextStyles.font20BoldBlack),
      ),
    );
  }
}
