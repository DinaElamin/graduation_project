import 'package:ablexa/core/theming/colors.dart';
import '../../../../core/theming/spacing.dart';
import 'package:flutter/material.dart';
import '../../../../core/shared_widgets/appBar_widget.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../widgets/all_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(children: [
          AppBarWidget(pageName: S.of(context).login),
          verticalSpacing(20),
          CircleAvatar(
            radius: 40,
            backgroundColor: ColorsManager.mainColor,
            child: Image.asset(
              'assets/images/photo_2024-06-22_14-08-36.jpg',
              height: 100,
              width: 100,
              fit: BoxFit.fill,
            ),
          ),
          verticalSpacing(30),
          Text(
            textAlign: TextAlign.center,
            S.of(context).login_text,
            style: TextStyles.font20BoldBlack,
          ),
          verticalSpacing(10),
          Text(
              textAlign: TextAlign.center,
              maxLines: 2,
              S.of(context).login_text_desc,
              style: TextStyles.font14MediumLightBlack),
          verticalSpacing(50),
          const AllTextFieldsWidget(),
        ]),
      ),
    );
  }
}
