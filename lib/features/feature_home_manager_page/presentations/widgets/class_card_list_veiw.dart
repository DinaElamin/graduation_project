import 'package:ablexa/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';

class ClassCardListView extends StatefulWidget {
  const ClassCardListView({Key? key}) : super(key: key);

  @override
  State<ClassCardListView> createState() => _ClassCardListViewState();
}

class _ClassCardListViewState extends State<ClassCardListView> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 6, // Example itemCount, replace with your actual data length
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              // Update the selected index
              selectedIndex = index;
            });
          },
          child: Container(
            height: 100.h,
            padding: EdgeInsets.only(right: 10.w, left: 10.w, top: 10.h),
            child: Card(

              color: selectedIndex == index ? ColorsManager.mainColor : null,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.sp), // Set border radius to 20
              ),
              child: ListTile(
                title: Text('Grade ${index+1}', style: TextStyles.font20BoldBlack),
              ),
            ),
          ),
        );
      },
    );
  }
}
