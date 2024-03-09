import 'package:ablexa/core/theming/styles.dart';
import 'package:flutter/material.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../generated/l10n.dart';
import '../widgets/text-form_filed_password.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(children: [
            verticalSpacing(100),
            Text(S.of(context).change_password,
                style: TextStyles.font20BoldBlack),
            verticalSpacing(50),
            const TextFormFieldPassword(),

          ]),
        ],
      ),
    );
  }
}
