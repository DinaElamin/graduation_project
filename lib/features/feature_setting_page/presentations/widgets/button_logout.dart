import 'package:ablexa/core/helper/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/Routing/routers.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../generated/l10n.dart';
class ButtonLogout extends StatelessWidget {
  const ButtonLogout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 50.w,right: 50.w),
      child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
              fixedSize: MaterialStatePropertyAll(Size(120.w, 60.h)),
              backgroundColor: const MaterialStatePropertyAll(ColorsManager.mainColor)),
          onPressed: (){
            context.pushNamed(Routes.changeProfilePage);

          }, child:
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
const Icon(Icons.logout_rounded,color: ColorsManager.mainWhite),
          horizontalSpacing(5),
          Text(S.of(context).logout),
        ],)
      ),
    );
  }
}