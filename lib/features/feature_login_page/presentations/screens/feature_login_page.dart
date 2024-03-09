import 'package:ablexa/core/helper/extentions.dart';
import 'package:ablexa/core/theming/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/Routing/routers.dart';
import '../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../widgets/all_text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(children: [
          verticalSpacing(50),
          Text(
            textAlign: TextAlign.center,
            S.of(context).sign_up,
            style: TextStyles.font20BoldBlack,
          ),
          verticalSpacing(10),
          Text(
              textAlign: TextAlign.center,
              maxLines: 2,
              S.of(context).sign_up_text_desc,
              style: TextStyles.font14MediumLightBlack),
          verticalSpacing(30),
          const AllTextFieldsWidget(),

        ]),
      ),
    );
  }


}
