import '../../../../core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';

class AttendenceWidget extends StatelessWidget {
  const AttendenceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) =>   Padding(
        padding:  EdgeInsets.only(top: 5.h,bottom: 5.h),
        child: Container(
          height: 60.h,
          decoration: BoxDecoration(
            color: ColorsManager.grey,
            borderRadius: BorderRadius.circular(16.sp),
          ),
          child: Padding(
            padding:  EdgeInsets.only(left: 10.w,right: 10.w),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("1/1/2024", style: TextStyles.font20BoldBlack.copyWith(fontSize: 15.sp),),
                  Container(
                    height: 40.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.sp),
                        color: ColorsManager.lightGreenColor),
                    child: Center(child: Text("Present",style: TextStyles.font15MediumDarkGreen,)),)
                ]),
          ),
        ),
      ),
    );
  }
}