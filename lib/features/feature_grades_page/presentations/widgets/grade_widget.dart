import 'package:ablexa/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';

class GradeWidget extends StatelessWidget {
  final String gradeName;
  final VoidCallback deleteAction;

  const GradeWidget({
    required this.gradeName,
    required this.deleteAction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 70.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ColorsManager.mainColor),
        child: ListTile(
          
          title: Text(gradeName,style: TextStyles.font18SemiBoldWhite),
          trailing: IconButton(
            icon: const Icon(Icons.delete,color: ColorsManager.mainWhite),
            onPressed: deleteAction,
          ),
        ),
      ),
    );
  }
}
