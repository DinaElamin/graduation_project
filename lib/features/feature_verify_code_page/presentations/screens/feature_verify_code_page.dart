import 'package:ablexa/core/helper/extentions.dart';
import 'package:ablexa/core/shared_widgets/app_elevated_button.dart';
import 'package:ablexa/core/theming/colors.dart';
import 'package:ablexa/core/theming/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/Routing/routers.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

class VerifyCodePage extends StatefulWidget {
  const VerifyCodePage({Key? key}) : super(key: key);

  @override
  State<VerifyCodePage> createState() => _VerifyCodePageState();
}

class _VerifyCodePageState extends State<VerifyCodePage> {
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();
  TextEditingController txt3 = TextEditingController();
  TextEditingController txt4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).verify_code),
        elevation: 0,
        backgroundColor: ColorsManager.mainWhite,
        foregroundColor: ColorsManager.mainBlack,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  S.of(context).please_check_your_email,
                  style: TextStyles.font20BoldBlack,
                ),
                verticalSpacing(20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(S.of(context).text_verify_code,
                        style: TextStyles.font14MediumLightBlack),
                    Text(" ****@gmail.com",
                        style: TextStyles.font14MediumLightBlack),
                  ],
                ),
                verticalSpacing(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    myInputBox(context, txt1),
                    myInputBox(context, txt2),
                    myInputBox(context, txt3),
                    myInputBox(context, txt4),
                  ],
                ),
                verticalSpacing(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).did_not_receive_code,
                      style: TextStyles.font16SemiBoldPurple
                          .copyWith(color: ColorsManager.mainBlack),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        S.of(context).resend,
                        style: TextStyles.font16SemiBoldPurple,
                      ),
                    )
                  ],
                ),
                verticalSpacing(50),
                Padding(
                  padding: EdgeInsets.only(left: 30.w, right: 30.w),
                  child: AppTextButton(
                      textButton: S.of(context).verify, onPressed: () {
                        context.pushNamed(Routes.changePasswordPage);
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget myInputBox(BuildContext context, TextEditingController controller) {
  return Container(
    height: 70.h,
    width: 60.w,
    decoration: BoxDecoration(
      border: Border.all(width: 1.w),
      borderRadius: BorderRadius.all(
        Radius.circular(10.sp),
      ),
    ),
    child: TextField(
      controller: controller,
      maxLength: 1,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      style: TextStyle(fontSize: 42.sp),
      decoration: const InputDecoration(
        counterText: '',
      ),
      onChanged: (value) {
        if (value.length == 1) {
          FocusScope.of(context).nextFocus();
        }
      },
    ),
  );
}
